// WARNING: DO NOT EDIT. This file was generated by a program.
// See $MOJO_SDK/tools/bindings/mojom_bindings_generator.py.

library http_server_mojom;
import 'dart:async';
import 'package:mojo/bindings.dart' as bindings;
import 'package:mojo/core.dart' as core;
import 'package:mojo/mojo/bindings/types/service_describer.mojom.dart' as service_describer;
import 'package:mojo_services/mojo/http_connection.mojom.dart' as http_connection_mojom;



class _HttpServerDelegateOnConnectedParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  http_connection_mojom.HttpConnectionInterface connection = null;
  http_connection_mojom.HttpConnectionDelegateInterfaceRequest delegate = null;

  _HttpServerDelegateOnConnectedParams() : super(kVersions.last.size);

  _HttpServerDelegateOnConnectedParams.init(
    http_connection_mojom.HttpConnectionInterface this.connection, 
    http_connection_mojom.HttpConnectionDelegateInterfaceRequest this.delegate
  ) : super(kVersions.last.size);

  static _HttpServerDelegateOnConnectedParams deserialize(bindings.Message message) =>
      bindings.Struct.deserialize(decode, message);

  static _HttpServerDelegateOnConnectedParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _HttpServerDelegateOnConnectedParams result = new _HttpServerDelegateOnConnectedParams();

    var mainDataHeader = bindings.Struct.checkVersion(decoder0, kVersions);
    if (mainDataHeader.version >= 0) {
      
      result.connection = decoder0.decodeServiceInterface(8, false, http_connection_mojom.HttpConnectionProxy.newFromEndpoint);
    }
    if (mainDataHeader.version >= 0) {
      
      result.delegate = decoder0.decodeInterfaceRequest(16, false, http_connection_mojom.HttpConnectionDelegateStub.newFromEndpoint);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    const String structName = "_HttpServerDelegateOnConnectedParams";
    String fieldName;
    try {
      fieldName = "connection";
      encoder0.encodeInterface(connection, 8, false);
      fieldName = "delegate";
      encoder0.encodeInterfaceRequest(delegate, 16, false);
    } on bindings.MojoCodecError catch(e) {
      bindings.Struct.fixErrorMessage(e, fieldName, structName);
      rethrow;
    }
  }

  String toString() {
    return "_HttpServerDelegateOnConnectedParams("
           "connection: $connection" ", "
           "delegate: $delegate" ")";
  }

  Map toJson() {
    throw new bindings.MojoCodecError(
        'Object containing handles cannot be encoded to JSON.');
  }
}

const int _httpServerDelegateMethodOnConnectedName = 0;

class _HttpServerDelegateServiceDescription implements service_describer.ServiceDescription {
  void getTopLevelInterface(Function responder) {
    responder(null);
  }

  void getTypeDefinition(String typeKey, Function responder) {
    responder(null);
  }

  void getAllTypeDefinitions(Function responder) {
    responder(null);
  }
}

abstract class HttpServerDelegate {
  static const String serviceName = null;

  static service_describer.ServiceDescription _cachedServiceDescription;
  static service_describer.ServiceDescription get serviceDescription {
    if (_cachedServiceDescription == null) {
      _cachedServiceDescription = new _HttpServerDelegateServiceDescription();
    }
    return _cachedServiceDescription;
  }

  static HttpServerDelegateProxy connectToService(
      bindings.ServiceConnector s, String url, [String serviceName]) {
    HttpServerDelegateProxy p = new HttpServerDelegateProxy.unbound();
    String name = serviceName ?? HttpServerDelegate.serviceName;
    if ((name == null) || name.isEmpty) {
      throw new core.MojoApiError(
          "If an interface has no ServiceName, then one must be provided.");
    }
    s.connectToService(url, p, name);
    return p;
  }
  void onConnected(http_connection_mojom.HttpConnectionInterface connection, http_connection_mojom.HttpConnectionDelegateInterfaceRequest delegate);
}

abstract class HttpServerDelegateInterface
    implements bindings.MojoInterface<HttpServerDelegate>,
               HttpServerDelegate {
  factory HttpServerDelegateInterface([HttpServerDelegate impl]) =>
      new HttpServerDelegateStub.unbound(impl);

  factory HttpServerDelegateInterface.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint,
      [HttpServerDelegate impl]) =>
      new HttpServerDelegateStub.fromEndpoint(endpoint, impl);

  factory HttpServerDelegateInterface.fromMock(
      HttpServerDelegate mock) =>
      new HttpServerDelegateProxy.fromMock(mock);
}

abstract class HttpServerDelegateInterfaceRequest
    implements bindings.MojoInterface<HttpServerDelegate>,
               HttpServerDelegate {
  factory HttpServerDelegateInterfaceRequest() =>
      new HttpServerDelegateProxy.unbound();
}

class _HttpServerDelegateProxyControl
    extends bindings.ProxyMessageHandler
    implements bindings.ProxyControl<HttpServerDelegate> {
  HttpServerDelegate impl;

  _HttpServerDelegateProxyControl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  _HttpServerDelegateProxyControl.fromHandle(
      core.MojoHandle handle) : super.fromHandle(handle);

  _HttpServerDelegateProxyControl.unbound() : super.unbound();

  String get serviceName => HttpServerDelegate.serviceName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        proxyError("Unexpected message type: ${message.header.type}");
        close(immediate: true);
        break;
    }
  }

  @override
  String toString() {
    var superString = super.toString();
    return "_HttpServerDelegateProxyControl($superString)";
  }
}

class HttpServerDelegateProxy
    extends bindings.Proxy<HttpServerDelegate>
    implements HttpServerDelegate,
               HttpServerDelegateInterface,
               HttpServerDelegateInterfaceRequest {
  HttpServerDelegateProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint)
      : super(new _HttpServerDelegateProxyControl.fromEndpoint(endpoint));

  HttpServerDelegateProxy.fromHandle(core.MojoHandle handle)
      : super(new _HttpServerDelegateProxyControl.fromHandle(handle));

  HttpServerDelegateProxy.unbound()
      : super(new _HttpServerDelegateProxyControl.unbound());

  factory HttpServerDelegateProxy.fromMock(HttpServerDelegate mock) {
    HttpServerDelegateProxy newMockedProxy =
        new HttpServerDelegateProxy.unbound();
    newMockedProxy.impl = mock;
    return newMockedProxy;
  }

  static HttpServerDelegateProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For HttpServerDelegateProxy"));
    return new HttpServerDelegateProxy.fromEndpoint(endpoint);
  }


  void onConnected(http_connection_mojom.HttpConnectionInterface connection, http_connection_mojom.HttpConnectionDelegateInterfaceRequest delegate) {
    if (impl != null) {
      impl.onConnected(connection, delegate);
      return;
    }
    if (!ctrl.isBound) {
      ctrl.proxyError("The Proxy is closed.");
      return;
    }
    var params = new _HttpServerDelegateOnConnectedParams();
    params.connection = connection;
    params.delegate = delegate;
    ctrl.sendMessage(params,
        _httpServerDelegateMethodOnConnectedName);
  }
}

class _HttpServerDelegateStubControl
    extends bindings.StubMessageHandler
    implements bindings.StubControl<HttpServerDelegate> {
  HttpServerDelegate _impl;

  _HttpServerDelegateStubControl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [HttpServerDelegate impl])
      : super.fromEndpoint(endpoint, autoBegin: impl != null) {
    _impl = impl;
  }

  _HttpServerDelegateStubControl.fromHandle(
      core.MojoHandle handle, [HttpServerDelegate impl])
      : super.fromHandle(handle, autoBegin: impl != null) {
    _impl = impl;
  }

  _HttpServerDelegateStubControl.unbound([this._impl]) : super.unbound();

  String get serviceName => HttpServerDelegate.serviceName;



  void handleMessage(bindings.ServiceMessage message) {
    if (bindings.ControlMessageHandler.isControlMessage(message)) {
      bindings.ControlMessageHandler.handleMessage(
          this, 0, message);
      return;
    }
    if (_impl == null) {
      throw new core.MojoApiError("$this has no implementation set");
    }
    switch (message.header.type) {
      case _httpServerDelegateMethodOnConnectedName:
        var params = _HttpServerDelegateOnConnectedParams.deserialize(
            message.payload);
        _impl.onConnected(params.connection, params.delegate);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }

  HttpServerDelegate get impl => _impl;
  set impl(HttpServerDelegate d) {
    if (d == null) {
      throw new core.MojoApiError("$this: Cannot set a null implementation");
    }
    if (isBound && (_impl == null)) {
      beginHandlingEvents();
    }
    _impl = d;
  }

  @override
  void bind(core.MojoMessagePipeEndpoint endpoint) {
    super.bind(endpoint);
    if (!isOpen && (_impl != null)) {
      beginHandlingEvents();
    }
  }

  @override
  String toString() {
    var superString = super.toString();
    return "_HttpServerDelegateStubControl($superString)";
  }

  int get version => 0;
}

class HttpServerDelegateStub
    extends bindings.Stub<HttpServerDelegate>
    implements HttpServerDelegate,
               HttpServerDelegateInterface,
               HttpServerDelegateInterfaceRequest {
  HttpServerDelegateStub.unbound([HttpServerDelegate impl])
      : super(new _HttpServerDelegateStubControl.unbound(impl));

  HttpServerDelegateStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [HttpServerDelegate impl])
      : super(new _HttpServerDelegateStubControl.fromEndpoint(endpoint, impl));

  HttpServerDelegateStub.fromHandle(
      core.MojoHandle handle, [HttpServerDelegate impl])
      : super(new _HttpServerDelegateStubControl.fromHandle(handle, impl));

  static HttpServerDelegateStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For HttpServerDelegateStub"));
    return new HttpServerDelegateStub.fromEndpoint(endpoint);
  }


  void onConnected(http_connection_mojom.HttpConnectionInterface connection, http_connection_mojom.HttpConnectionDelegateInterfaceRequest delegate) {
    return impl.onConnected(connection, delegate);
  }
}



