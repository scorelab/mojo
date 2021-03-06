// WARNING: DO NOT EDIT. This file was generated by a program.
// See $MOJO_SDK/tools/bindings/mojom_bindings_generator.py.

library authentication_mojom;
import 'dart:async';
import 'package:mojo/bindings.dart' as bindings;
import 'package:mojo/core.dart' as core;
import 'package:mojo/mojo/bindings/types/service_describer.mojom.dart' as service_describer;



class _AuthenticationServiceSelectAccountParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  bool returnLastSelected = false;

  _AuthenticationServiceSelectAccountParams() : super(kVersions.last.size);

  _AuthenticationServiceSelectAccountParams.init(
    bool this.returnLastSelected
  ) : super(kVersions.last.size);

  static _AuthenticationServiceSelectAccountParams deserialize(bindings.Message message) =>
      bindings.Struct.deserialize(decode, message);

  static _AuthenticationServiceSelectAccountParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _AuthenticationServiceSelectAccountParams result = new _AuthenticationServiceSelectAccountParams();

    var mainDataHeader = bindings.Struct.checkVersion(decoder0, kVersions);
    if (mainDataHeader.version >= 0) {
      
      result.returnLastSelected = decoder0.decodeBool(8, 0);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    const String structName = "_AuthenticationServiceSelectAccountParams";
    String fieldName;
    try {
      fieldName = "returnLastSelected";
      encoder0.encodeBool(returnLastSelected, 8, 0);
    } on bindings.MojoCodecError catch(e) {
      bindings.Struct.fixErrorMessage(e, fieldName, structName);
      rethrow;
    }
  }

  String toString() {
    return "_AuthenticationServiceSelectAccountParams("
           "returnLastSelected: $returnLastSelected" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["returnLastSelected"] = returnLastSelected;
    return map;
  }
}


class AuthenticationServiceSelectAccountResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  String username = null;
  String error = null;

  AuthenticationServiceSelectAccountResponseParams() : super(kVersions.last.size);

  AuthenticationServiceSelectAccountResponseParams.init(
    String this.username, 
    String this.error
  ) : super(kVersions.last.size);

  static AuthenticationServiceSelectAccountResponseParams deserialize(bindings.Message message) =>
      bindings.Struct.deserialize(decode, message);

  static AuthenticationServiceSelectAccountResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    AuthenticationServiceSelectAccountResponseParams result = new AuthenticationServiceSelectAccountResponseParams();

    var mainDataHeader = bindings.Struct.checkVersion(decoder0, kVersions);
    if (mainDataHeader.version >= 0) {
      
      result.username = decoder0.decodeString(8, true);
    }
    if (mainDataHeader.version >= 0) {
      
      result.error = decoder0.decodeString(16, true);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    const String structName = "AuthenticationServiceSelectAccountResponseParams";
    String fieldName;
    try {
      fieldName = "username";
      encoder0.encodeString(username, 8, true);
      fieldName = "error";
      encoder0.encodeString(error, 16, true);
    } on bindings.MojoCodecError catch(e) {
      bindings.Struct.fixErrorMessage(e, fieldName, structName);
      rethrow;
    }
  }

  String toString() {
    return "AuthenticationServiceSelectAccountResponseParams("
           "username: $username" ", "
           "error: $error" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["username"] = username;
    map["error"] = error;
    return map;
  }
}


class _AuthenticationServiceGetOAuth2TokenParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  String username = null;
  List<String> scopes = null;

  _AuthenticationServiceGetOAuth2TokenParams() : super(kVersions.last.size);

  _AuthenticationServiceGetOAuth2TokenParams.init(
    String this.username, 
    List<String> this.scopes
  ) : super(kVersions.last.size);

  static _AuthenticationServiceGetOAuth2TokenParams deserialize(bindings.Message message) =>
      bindings.Struct.deserialize(decode, message);

  static _AuthenticationServiceGetOAuth2TokenParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _AuthenticationServiceGetOAuth2TokenParams result = new _AuthenticationServiceGetOAuth2TokenParams();

    var mainDataHeader = bindings.Struct.checkVersion(decoder0, kVersions);
    if (mainDataHeader.version >= 0) {
      
      result.username = decoder0.decodeString(8, false);
    }
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(16, false);
      {
        var si1 = decoder1.decodeDataHeaderForPointerArray(bindings.kUnspecifiedArrayLength);
        result.scopes = new List<String>(si1.numElements);
        for (int i1 = 0; i1 < si1.numElements; ++i1) {
          
          result.scopes[i1] = decoder1.decodeString(bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i1, false);
        }
      }
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    const String structName = "_AuthenticationServiceGetOAuth2TokenParams";
    String fieldName;
    try {
      fieldName = "username";
      encoder0.encodeString(username, 8, false);
      fieldName = "scopes";
      if (scopes == null) {
        encoder0.encodeNullPointer(16, false);
      } else {
        var encoder1 = encoder0.encodePointerArray(scopes.length, 16, bindings.kUnspecifiedArrayLength);
        for (int i0 = 0; i0 < scopes.length; ++i0) {
          encoder1.encodeString(scopes[i0], bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i0, false);
        }
      }
    } on bindings.MojoCodecError catch(e) {
      bindings.Struct.fixErrorMessage(e, fieldName, structName);
      rethrow;
    }
  }

  String toString() {
    return "_AuthenticationServiceGetOAuth2TokenParams("
           "username: $username" ", "
           "scopes: $scopes" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["username"] = username;
    map["scopes"] = scopes;
    return map;
  }
}


class AuthenticationServiceGetOAuth2TokenResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  String token = null;
  String error = null;

  AuthenticationServiceGetOAuth2TokenResponseParams() : super(kVersions.last.size);

  AuthenticationServiceGetOAuth2TokenResponseParams.init(
    String this.token, 
    String this.error
  ) : super(kVersions.last.size);

  static AuthenticationServiceGetOAuth2TokenResponseParams deserialize(bindings.Message message) =>
      bindings.Struct.deserialize(decode, message);

  static AuthenticationServiceGetOAuth2TokenResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    AuthenticationServiceGetOAuth2TokenResponseParams result = new AuthenticationServiceGetOAuth2TokenResponseParams();

    var mainDataHeader = bindings.Struct.checkVersion(decoder0, kVersions);
    if (mainDataHeader.version >= 0) {
      
      result.token = decoder0.decodeString(8, true);
    }
    if (mainDataHeader.version >= 0) {
      
      result.error = decoder0.decodeString(16, true);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    const String structName = "AuthenticationServiceGetOAuth2TokenResponseParams";
    String fieldName;
    try {
      fieldName = "token";
      encoder0.encodeString(token, 8, true);
      fieldName = "error";
      encoder0.encodeString(error, 16, true);
    } on bindings.MojoCodecError catch(e) {
      bindings.Struct.fixErrorMessage(e, fieldName, structName);
      rethrow;
    }
  }

  String toString() {
    return "AuthenticationServiceGetOAuth2TokenResponseParams("
           "token: $token" ", "
           "error: $error" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["token"] = token;
    map["error"] = error;
    return map;
  }
}


class _AuthenticationServiceClearOAuth2TokenParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  String token = null;

  _AuthenticationServiceClearOAuth2TokenParams() : super(kVersions.last.size);

  _AuthenticationServiceClearOAuth2TokenParams.init(
    String this.token
  ) : super(kVersions.last.size);

  static _AuthenticationServiceClearOAuth2TokenParams deserialize(bindings.Message message) =>
      bindings.Struct.deserialize(decode, message);

  static _AuthenticationServiceClearOAuth2TokenParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _AuthenticationServiceClearOAuth2TokenParams result = new _AuthenticationServiceClearOAuth2TokenParams();

    var mainDataHeader = bindings.Struct.checkVersion(decoder0, kVersions);
    if (mainDataHeader.version >= 0) {
      
      result.token = decoder0.decodeString(8, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    const String structName = "_AuthenticationServiceClearOAuth2TokenParams";
    String fieldName;
    try {
      fieldName = "token";
      encoder0.encodeString(token, 8, false);
    } on bindings.MojoCodecError catch(e) {
      bindings.Struct.fixErrorMessage(e, fieldName, structName);
      rethrow;
    }
  }

  String toString() {
    return "_AuthenticationServiceClearOAuth2TokenParams("
           "token: $token" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["token"] = token;
    return map;
  }
}

const int _authenticationServiceMethodSelectAccountName = 0;
const int _authenticationServiceMethodGetOAuth2TokenName = 1;
const int _authenticationServiceMethodClearOAuth2TokenName = 2;

class _AuthenticationServiceServiceDescription implements service_describer.ServiceDescription {
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

abstract class AuthenticationService {
  static const String serviceName = "authentication::AuthenticationService";

  static service_describer.ServiceDescription _cachedServiceDescription;
  static service_describer.ServiceDescription get serviceDescription {
    if (_cachedServiceDescription == null) {
      _cachedServiceDescription = new _AuthenticationServiceServiceDescription();
    }
    return _cachedServiceDescription;
  }

  static AuthenticationServiceProxy connectToService(
      bindings.ServiceConnector s, String url, [String serviceName]) {
    AuthenticationServiceProxy p = new AuthenticationServiceProxy.unbound();
    String name = serviceName ?? AuthenticationService.serviceName;
    if ((name == null) || name.isEmpty) {
      throw new core.MojoApiError(
          "If an interface has no ServiceName, then one must be provided.");
    }
    s.connectToService(url, p, name);
    return p;
  }
  void selectAccount(bool returnLastSelected,void callback(String username, String error));
  void getOAuth2Token(String username,List<String> scopes,void callback(String token, String error));
  void clearOAuth2Token(String token);
}

abstract class AuthenticationServiceInterface
    implements bindings.MojoInterface<AuthenticationService>,
               AuthenticationService {
  factory AuthenticationServiceInterface([AuthenticationService impl]) =>
      new AuthenticationServiceStub.unbound(impl);

  factory AuthenticationServiceInterface.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint,
      [AuthenticationService impl]) =>
      new AuthenticationServiceStub.fromEndpoint(endpoint, impl);

  factory AuthenticationServiceInterface.fromMock(
      AuthenticationService mock) =>
      new AuthenticationServiceProxy.fromMock(mock);
}

abstract class AuthenticationServiceInterfaceRequest
    implements bindings.MojoInterface<AuthenticationService>,
               AuthenticationService {
  factory AuthenticationServiceInterfaceRequest() =>
      new AuthenticationServiceProxy.unbound();
}

class _AuthenticationServiceProxyControl
    extends bindings.ProxyMessageHandler
    implements bindings.ProxyControl<AuthenticationService> {
  AuthenticationService impl;

  _AuthenticationServiceProxyControl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  _AuthenticationServiceProxyControl.fromHandle(
      core.MojoHandle handle) : super.fromHandle(handle);

  _AuthenticationServiceProxyControl.unbound() : super.unbound();

  String get serviceName => AuthenticationService.serviceName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case _authenticationServiceMethodSelectAccountName:
        var r = AuthenticationServiceSelectAccountResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          proxyError("Expected a message with a valid request Id.");
          return;
        }
        Function callback = callbackMap[message.header.requestId];
        if (callback == null) {
          proxyError(
              "Message had unknown request Id: ${message.header.requestId}");
          return;
        }
        callbackMap.remove(message.header.requestId);
        callback(r.username , r.error );
        break;
      case _authenticationServiceMethodGetOAuth2TokenName:
        var r = AuthenticationServiceGetOAuth2TokenResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          proxyError("Expected a message with a valid request Id.");
          return;
        }
        Function callback = callbackMap[message.header.requestId];
        if (callback == null) {
          proxyError(
              "Message had unknown request Id: ${message.header.requestId}");
          return;
        }
        callbackMap.remove(message.header.requestId);
        callback(r.token , r.error );
        break;
      default:
        proxyError("Unexpected message type: ${message.header.type}");
        close(immediate: true);
        break;
    }
  }

  @override
  String toString() {
    var superString = super.toString();
    return "_AuthenticationServiceProxyControl($superString)";
  }
}

class AuthenticationServiceProxy
    extends bindings.Proxy<AuthenticationService>
    implements AuthenticationService,
               AuthenticationServiceInterface,
               AuthenticationServiceInterfaceRequest {
  AuthenticationServiceProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint)
      : super(new _AuthenticationServiceProxyControl.fromEndpoint(endpoint));

  AuthenticationServiceProxy.fromHandle(core.MojoHandle handle)
      : super(new _AuthenticationServiceProxyControl.fromHandle(handle));

  AuthenticationServiceProxy.unbound()
      : super(new _AuthenticationServiceProxyControl.unbound());

  factory AuthenticationServiceProxy.fromMock(AuthenticationService mock) {
    AuthenticationServiceProxy newMockedProxy =
        new AuthenticationServiceProxy.unbound();
    newMockedProxy.impl = mock;
    return newMockedProxy;
  }

  static AuthenticationServiceProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For AuthenticationServiceProxy"));
    return new AuthenticationServiceProxy.fromEndpoint(endpoint);
  }


  void selectAccount(bool returnLastSelected,void callback(String username, String error)) {
    if (impl != null) {
      impl.selectAccount(returnLastSelected,callback);
      return;
    }
    var params = new _AuthenticationServiceSelectAccountParams();
    params.returnLastSelected = returnLastSelected;
    Function zonedCallback;
    if (identical(Zone.current, Zone.ROOT)) {
      zonedCallback = callback;
    } else {
      Zone z = Zone.current;
      zonedCallback = ((String username, String error) {
        z.bindCallback(() {
          callback(username, error);
        })();
      });
    }
    ctrl.sendMessageWithRequestId(
        params,
        _authenticationServiceMethodSelectAccountName,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse,
        zonedCallback);
  }
  void getOAuth2Token(String username,List<String> scopes,void callback(String token, String error)) {
    if (impl != null) {
      impl.getOAuth2Token(username,scopes,callback);
      return;
    }
    var params = new _AuthenticationServiceGetOAuth2TokenParams();
    params.username = username;
    params.scopes = scopes;
    Function zonedCallback;
    if (identical(Zone.current, Zone.ROOT)) {
      zonedCallback = callback;
    } else {
      Zone z = Zone.current;
      zonedCallback = ((String token, String error) {
        z.bindCallback(() {
          callback(token, error);
        })();
      });
    }
    ctrl.sendMessageWithRequestId(
        params,
        _authenticationServiceMethodGetOAuth2TokenName,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse,
        zonedCallback);
  }
  void clearOAuth2Token(String token) {
    if (impl != null) {
      impl.clearOAuth2Token(token);
      return;
    }
    if (!ctrl.isBound) {
      ctrl.proxyError("The Proxy is closed.");
      return;
    }
    var params = new _AuthenticationServiceClearOAuth2TokenParams();
    params.token = token;
    ctrl.sendMessage(params,
        _authenticationServiceMethodClearOAuth2TokenName);
  }
}

class _AuthenticationServiceStubControl
    extends bindings.StubMessageHandler
    implements bindings.StubControl<AuthenticationService> {
  AuthenticationService _impl;

  _AuthenticationServiceStubControl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [AuthenticationService impl])
      : super.fromEndpoint(endpoint, autoBegin: impl != null) {
    _impl = impl;
  }

  _AuthenticationServiceStubControl.fromHandle(
      core.MojoHandle handle, [AuthenticationService impl])
      : super.fromHandle(handle, autoBegin: impl != null) {
    _impl = impl;
  }

  _AuthenticationServiceStubControl.unbound([this._impl]) : super.unbound();

  String get serviceName => AuthenticationService.serviceName;


  Function _authenticationServiceSelectAccountResponseParamsResponder(
      int requestId) {
  return (String username, String error) {
      var result = new AuthenticationServiceSelectAccountResponseParams();
      result.username = username;
      result.error = error;
      sendResponse(buildResponseWithId(
          result,
          _authenticationServiceMethodSelectAccountName,
          requestId,
          bindings.MessageHeader.kMessageIsResponse));
    };
  }
  Function _authenticationServiceGetOAuth2TokenResponseParamsResponder(
      int requestId) {
  return (String token, String error) {
      var result = new AuthenticationServiceGetOAuth2TokenResponseParams();
      result.token = token;
      result.error = error;
      sendResponse(buildResponseWithId(
          result,
          _authenticationServiceMethodGetOAuth2TokenName,
          requestId,
          bindings.MessageHeader.kMessageIsResponse));
    };
  }

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
      case _authenticationServiceMethodSelectAccountName:
        var params = _AuthenticationServiceSelectAccountParams.deserialize(
            message.payload);
        _impl.selectAccount(params.returnLastSelected, _authenticationServiceSelectAccountResponseParamsResponder(message.header.requestId));
        break;
      case _authenticationServiceMethodGetOAuth2TokenName:
        var params = _AuthenticationServiceGetOAuth2TokenParams.deserialize(
            message.payload);
        _impl.getOAuth2Token(params.username, params.scopes, _authenticationServiceGetOAuth2TokenResponseParamsResponder(message.header.requestId));
        break;
      case _authenticationServiceMethodClearOAuth2TokenName:
        var params = _AuthenticationServiceClearOAuth2TokenParams.deserialize(
            message.payload);
        _impl.clearOAuth2Token(params.token);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }

  AuthenticationService get impl => _impl;
  set impl(AuthenticationService d) {
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
    return "_AuthenticationServiceStubControl($superString)";
  }

  int get version => 0;
}

class AuthenticationServiceStub
    extends bindings.Stub<AuthenticationService>
    implements AuthenticationService,
               AuthenticationServiceInterface,
               AuthenticationServiceInterfaceRequest {
  AuthenticationServiceStub.unbound([AuthenticationService impl])
      : super(new _AuthenticationServiceStubControl.unbound(impl));

  AuthenticationServiceStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [AuthenticationService impl])
      : super(new _AuthenticationServiceStubControl.fromEndpoint(endpoint, impl));

  AuthenticationServiceStub.fromHandle(
      core.MojoHandle handle, [AuthenticationService impl])
      : super(new _AuthenticationServiceStubControl.fromHandle(handle, impl));

  static AuthenticationServiceStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For AuthenticationServiceStub"));
    return new AuthenticationServiceStub.fromEndpoint(endpoint);
  }


  void selectAccount(bool returnLastSelected,void callback(String username, String error)) {
    return impl.selectAccount(returnLastSelected,callback);
  }
  void getOAuth2Token(String username,List<String> scopes,void callback(String token, String error)) {
    return impl.getOAuth2Token(username,scopes,callback);
  }
  void clearOAuth2Token(String token) {
    return impl.clearOAuth2Token(token);
  }
}



