// Copyright 2016 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

package templates

import (
	"testing"
)

func TestDecodingSimpleFieldDecoding(t *testing.T) {
	expected := `value, err := decoder.ReadUint8()
if err != nil {
	return err
}
s.Fuint8 = value`

	encodingInfo := mockEncodingInfo{
		isSimple:     true,
		identifier:   "s.Fuint8",
		readFunction: "ReadUint8",
	}

	check(t, expected, "FieldDecodingTmpl", encodingInfo)
}

func TestDecodingHandleFieldDecoding(t *testing.T) {
	expected := `handle, err := decoder.ReadHandle()
if err != nil {
	return err
}
if handle.IsValid() {
	s.SomeHandle = handle
} else {
	return &bindings.ValidationError{bindings.UnexpectedInvalidHandle, "unexpected invalid handle"}
}`

	encodingInfo := mockEncodingInfo{
		isHandle:     true,
		identifier:   "s.SomeHandle",
		readFunction: "ReadHandle",
	}

	check(t, expected, "FieldDecodingTmpl", encodingInfo)
}

func TestDecodingNullableHandleFieldDecoding(t *testing.T) {
	expected := `handle, err := decoder.ReadHandle()
if err != nil {
	return err
}
if handle.IsValid() {
	s.SomeNullableHandle = &handle
} else {
	s.SomeNullableHandle = nil
}`

	encodingInfo := mockEncodingInfo{
		isHandle:     true,
		identifier:   "s.SomeNullableHandle",
		readFunction: "ReadHandle",
		isNullable:   true,
	}

	check(t, expected, "FieldDecodingTmpl", encodingInfo)
}

func TestDecodingStringFieldDecoding(t *testing.T) {
	expected := `pointer, err := decoder.ReadPointer()
if err != nil {
	return err
}
if pointer == 0 {
	return &bindings.ValidationError{bindings.UnexpectedNullPointer, "unexpected null pointer"}
} else {
	value, err := decoder.ReadString()
	if err != nil {
		return err
	}
	s.FString = value
}`

	encodingInfo := mockEncodingInfo{
		isSimple:     true,
		identifier:   "s.FString",
		readFunction: "ReadString",
		isPointer:    true,
	}

	check(t, expected, "FieldDecodingTmpl", encodingInfo)
}

func TestDecodingNullableStringFieldDecoding(t *testing.T) {
	expected := `pointer, err := decoder.ReadPointer()
if err != nil {
	return err
}
if pointer == 0 {
	s.FString = nil
} else {
	value, err := decoder.ReadString()
	if err != nil {
		return err
	}
	s.FString = value
}`

	encodingInfo := mockEncodingInfo{
		isSimple:     true,
		identifier:   "s.FString",
		readFunction: "ReadString",
		isPointer:    true,
		isNullable:   true,
	}

	check(t, expected, "FieldDecodingTmpl", encodingInfo)
}

func TestDecodingStructFieldDecoding(t *testing.T) {
	expected := `pointer, err := decoder.ReadPointer()
if err != nil {
	return err
}
if pointer == 0 {
	return &bindings.ValidationError{bindings.UnexpectedNullPointer, "unexpected null pointer"}
} else {
	if err := s.FStruct.Decode(decoder); err != nil {
		return err
	}
}`

	encodingInfo := mockEncodingInfo{
		isPointer:  true,
		isStruct:   true,
		identifier: "s.FStruct",
	}

	check(t, expected, "FieldDecodingTmpl", encodingInfo)
}

func TestDecodingNullableStructFieldDecoding(t *testing.T) {
	expected := `pointer, err := decoder.ReadPointer()
if err != nil {
	return err
}
if pointer == 0 {
	s.FStruct = nil
} else {
	s.FStruct = new(SomeStruct)
	if err := s.FStruct.Decode(decoder); err != nil {
		return err
	}
}`

	encodingInfo := mockEncodingInfo{
		isNullable: true,
		isPointer:  true,
		isStruct:   true,
		identifier: "s.FStruct",
		goType:     "SomeStruct",
	}

	check(t, expected, "FieldDecodingTmpl", encodingInfo)
}
