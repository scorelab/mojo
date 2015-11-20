// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

package tests

import (
	"testing"

	"examples/echo/echo"
	"mojo/public/go/bindings"
	"mojo/public/go/system"
)

func TestProxyClosesPipe(t *testing.T) {
	request, pointer := echo.CreateMessagePipeForEcho()
	// Create a message with valid header and invalid payload and send it.
	header := bindings.MessageHeader{0, bindings.MessageIsResponseFlag, 1}
	message, err := bindings.EncodeMessage(header, &header)
	if err != nil {
		t.Fatalf("Error encoding message: %v", err)
	}
	requestPipe := request.PassMessagePipe()
	if r := requestPipe.WriteMessage(message.Bytes, nil, system.MOJO_WRITE_MESSAGE_FLAG_NONE); r != system.MOJO_RESULT_OK {
		t.Fatalf("Can't send a message: %v", r)
	}

	// Make echo request with response (that is already sent).
	echoProxy := echo.NewEchoProxy(pointer, waiter)
	_, err = echoProxy.EchoString(bindings.StringPointer("hello, world"))
	if err == nil {
		t.Fatalf("Message is invalid, error expected")
	}

	// Wait for the pipe to be closed.
	waitResponseChan := make(chan bindings.WaitResponse)
	waiter.AsyncWait(requestPipe, system.MOJO_HANDLE_SIGNAL_PEER_CLOSED, waitResponseChan)
	waitResponse := <-waitResponseChan
	if waitResponse.Result != system.MOJO_RESULT_OK {
		t.Fatalf("Error waiting on pipe to be closed: %v", waitResponse.Result)
	}
	requestPipe.Close()
}

type echoImpl struct{}

func (impl *echoImpl) EchoString(in *string) (*string, error) {
	return nil, nil
}

func TestStubClosesPipe(t *testing.T) {
	request, pointer := echo.CreateMessagePipeForEcho()
	// Create a message with valid header and invalid payload and send it.
	header := bindings.MessageHeader{0, bindings.MessageIsResponseFlag, 1}
	message, err := bindings.EncodeMessage(header, &header)
	if err != nil {
		t.Fatalf("Error encoding message: %v", err)
	}
	pointerPipe := pointer.PassMessagePipe()
	if r := pointerPipe.WriteMessage(message.Bytes, nil, system.MOJO_WRITE_MESSAGE_FLAG_NONE); r != system.MOJO_RESULT_OK {
		t.Fatalf("Can't send a message: %v", r)
	}

	// Make echo request with response (that is already sent).
	echoStub := echo.NewEchoStub(request, &echoImpl{}, waiter)
	if err := echoStub.ServeRequest(); err == nil {
		t.Fatalf("Message is invalid, error expected")
	}

	// Wait for the pipe to be closed.
	waitResponseChan := make(chan bindings.WaitResponse)
	waiter.AsyncWait(pointerPipe, system.MOJO_HANDLE_SIGNAL_PEER_CLOSED, waitResponseChan)
	waitResponse := <-waitResponseChan
	if waitResponse.Result != system.MOJO_RESULT_OK {
		t.Fatalf("Error waiting on pipe to be closed: %v", waitResponse.Result)
	}
	pointerPipe.Close()
}

type echoImplAsync struct {
	done <-chan struct{}
}

func (impl *echoImplAsync) EchoString(in *string) (*string, error) {
	<-impl.done
	return in, nil
}

func TestServeRequestInGoroutine(t *testing.T) {
	request, pointer := echo.CreateMessagePipeForEcho()
	echoProxy := echo.NewEchoProxy(pointer, waiter)
	numRequests := 10
	// Send several requests in parallel.
	for i := 0; i < numRequests; i++ {
		go func() {
			if _, err := echoProxy.EchoString(bindings.StringPointer("echo")); err != nil {
				t.Fatalf("Echo failed: %v", err)
			}
		}()
	}
	done := make(chan struct{})
	echoStub := echo.NewEchoStub(request, &echoImplAsync{done: done}, waiter)
	// Read all requests in parallel and create a goroutine to serve each
	// request. Goroutines will block until we close the done channel.
	var errors []<-chan error
	for i := 0; i < numRequests; i++ {
		errors = append(errors, echoStub.ServeRequestInGoroutine())
	}
	// Close the done channel and unblock all goroutines.
	close(done)
	for i := 0; i < numRequests; i++ {
		if err := <-errors[i]; err != nil {
			t.Fatalf("Echo failed: %v", err)
		}
	}
}
