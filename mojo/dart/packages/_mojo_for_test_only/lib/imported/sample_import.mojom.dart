// WARNING: DO NOT EDIT. This file was generated by a program.
// See $MOJO_SDK/tools/bindings/mojom_bindings_generator.py.

library sample_import_mojom;
import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:mojo/bindings.dart' as bindings;
import 'package:mojo/core.dart' as core;
import 'package:mojo/mojo/bindings/types/mojom_types.mojom.dart' as mojom_types;
import 'package:mojo/mojo/bindings/types/service_describer.mojom.dart' as service_describer;

class Shape extends bindings.MojoEnum {
  static const Shape rectangle = const Shape._(1);
  static const Shape circle = const Shape._(2);
  static const Shape triangle = const Shape._(3);
  static const Shape last = const Shape._(3);

  const Shape._(int v) : super(v);

  static const Map<String, Shape> valuesMap = const {
    "rectangle": rectangle,
    "circle": circle,
    "triangle": triangle,
    "last": last,
  };
  static const List<Shape> values = const [
    rectangle,
    circle,
    triangle,
    last,
  ];

  static Shape valueOf(String name) => valuesMap[name];

  factory Shape(int v) {
    switch (v) {
      case 1:
        return Shape.rectangle;
      case 2:
        return Shape.circle;
      case 3:
        return Shape.triangle;
      case 3:
        return Shape.last;
      default:
        return null;
    }
  }

  static Shape decode(bindings.Decoder decoder0, int offset) {
    int v = decoder0.decodeUint32(offset);
    Shape result = new Shape(v);
    if (result == null) {
      throw new bindings.MojoCodecError(
          'Bad value $v for enum Shape.');
    }
    return result;
  }

  String toString() {
    switch(this) {
      case rectangle:
        return 'Shape.rectangle';
      case circle:
        return 'Shape.circle';
      case triangle:
        return 'Shape.triangle';
      case last:
        return 'Shape.last';
      default:
        return null;
    }
  }

  int toJson() => mojoEnumValue;
}

class AnotherShape extends bindings.MojoEnum {
  static const AnotherShape rectangle = const AnotherShape._(10);
  static const AnotherShape circle = const AnotherShape._(11);
  static const AnotherShape triangle = const AnotherShape._(12);

  const AnotherShape._(int v) : super(v);

  static const Map<String, AnotherShape> valuesMap = const {
    "rectangle": rectangle,
    "circle": circle,
    "triangle": triangle,
  };
  static const List<AnotherShape> values = const [
    rectangle,
    circle,
    triangle,
  ];

  static AnotherShape valueOf(String name) => valuesMap[name];

  factory AnotherShape(int v) {
    switch (v) {
      case 10:
        return AnotherShape.rectangle;
      case 11:
        return AnotherShape.circle;
      case 12:
        return AnotherShape.triangle;
      default:
        return null;
    }
  }

  static AnotherShape decode(bindings.Decoder decoder0, int offset) {
    int v = decoder0.decodeUint32(offset);
    AnotherShape result = new AnotherShape(v);
    if (result == null) {
      throw new bindings.MojoCodecError(
          'Bad value $v for enum AnotherShape.');
    }
    return result;
  }

  String toString() {
    switch(this) {
      case rectangle:
        return 'AnotherShape.rectangle';
      case circle:
        return 'AnotherShape.circle';
      case triangle:
        return 'AnotherShape.triangle';
      default:
        return null;
    }
  }

  int toJson() => mojoEnumValue;
}

class YetAnotherShape extends bindings.MojoEnum {
  static const YetAnotherShape rectangle = const YetAnotherShape._(20);
  static const YetAnotherShape circle = const YetAnotherShape._(21);
  static const YetAnotherShape triangle = const YetAnotherShape._(22);

  const YetAnotherShape._(int v) : super(v);

  static const Map<String, YetAnotherShape> valuesMap = const {
    "rectangle": rectangle,
    "circle": circle,
    "triangle": triangle,
  };
  static const List<YetAnotherShape> values = const [
    rectangle,
    circle,
    triangle,
  ];

  static YetAnotherShape valueOf(String name) => valuesMap[name];

  factory YetAnotherShape(int v) {
    switch (v) {
      case 20:
        return YetAnotherShape.rectangle;
      case 21:
        return YetAnotherShape.circle;
      case 22:
        return YetAnotherShape.triangle;
      default:
        return null;
    }
  }

  static YetAnotherShape decode(bindings.Decoder decoder0, int offset) {
    int v = decoder0.decodeUint32(offset);
    YetAnotherShape result = new YetAnotherShape(v);
    if (result == null) {
      throw new bindings.MojoCodecError(
          'Bad value $v for enum YetAnotherShape.');
    }
    return result;
  }

  String toString() {
    switch(this) {
      case rectangle:
        return 'YetAnotherShape.rectangle';
      case circle:
        return 'YetAnotherShape.circle';
      case triangle:
        return 'YetAnotherShape.triangle';
      default:
        return null;
    }
  }

  int toJson() => mojoEnumValue;
}



class Point extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  int x = 0;
  int y = 0;

  Point() : super(kVersions.last.size);

  Point.init(
    int this.x, 
    int this.y
  ) : super(kVersions.last.size);

  static Point deserialize(bindings.Message message) =>
      bindings.Struct.deserialize(decode, message);

  static Point decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    Point result = new Point();

    var mainDataHeader = bindings.Struct.checkVersion(decoder0, kVersions);
    if (mainDataHeader.version >= 0) {
      
      result.x = decoder0.decodeInt32(8);
    }
    if (mainDataHeader.version >= 0) {
      
      result.y = decoder0.decodeInt32(12);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    const String structName = "Point";
    String fieldName;
    try {
      fieldName = "x";
      encoder0.encodeInt32(x, 8);
      fieldName = "y";
      encoder0.encodeInt32(y, 12);
    } on bindings.MojoCodecError catch(e) {
      bindings.Struct.fixErrorMessage(e, fieldName, structName);
      rethrow;
    }
  }

  String toString() {
    return "Point("
           "x: $x" ", "
           "y: $y" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["x"] = x;
    map["y"] = y;
    return map;
  }
}


class _ImportedInterfaceDoSomethingParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(8, 0)
  ];

  _ImportedInterfaceDoSomethingParams() : super(kVersions.last.size);

  _ImportedInterfaceDoSomethingParams.init(
  ) : super(kVersions.last.size);

  static _ImportedInterfaceDoSomethingParams deserialize(bindings.Message message) =>
      bindings.Struct.deserialize(decode, message);

  static _ImportedInterfaceDoSomethingParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _ImportedInterfaceDoSomethingParams result = new _ImportedInterfaceDoSomethingParams();

    var mainDataHeader = bindings.Struct.checkVersion(decoder0, kVersions);
    return result;
  }

  void encode(bindings.Encoder encoder) {
    encoder.getStructEncoderAtOffset(kVersions.last);
    const String structName = "_ImportedInterfaceDoSomethingParams";
    String fieldName;
    try {
    } on bindings.MojoCodecError catch(e) {
      bindings.Struct.fixErrorMessage(e, fieldName, structName);
      rethrow;
    }
  }

  String toString() {
    return "_ImportedInterfaceDoSomethingParams("")";
  }

  Map toJson() {
    Map map = new Map();
    return map;
  }
}

const int _importedInterfaceMethodDoSomethingName = 0;

class _ImportedInterfaceServiceDescription implements service_describer.ServiceDescription {
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

abstract class ImportedInterface {
  static const String serviceName = null;

  static service_describer.ServiceDescription _cachedServiceDescription;
  static service_describer.ServiceDescription get serviceDescription {
    if (_cachedServiceDescription == null) {
      _cachedServiceDescription = new _ImportedInterfaceServiceDescription();
    }
    return _cachedServiceDescription;
  }

  static ImportedInterfaceProxy connectToService(
      bindings.ServiceConnector s, String url, [String serviceName]) {
    ImportedInterfaceProxy p = new ImportedInterfaceProxy.unbound();
    String name = serviceName ?? ImportedInterface.serviceName;
    if ((name == null) || name.isEmpty) {
      throw new core.MojoApiError(
          "If an interface has no ServiceName, then one must be provided.");
    }
    s.connectToService(url, p, name);
    return p;
  }
  void doSomething();
}

abstract class ImportedInterfaceInterface
    implements bindings.MojoInterface<ImportedInterface>,
               ImportedInterface {
  factory ImportedInterfaceInterface([ImportedInterface impl]) =>
      new ImportedInterfaceStub.unbound(impl);

  factory ImportedInterfaceInterface.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint,
      [ImportedInterface impl]) =>
      new ImportedInterfaceStub.fromEndpoint(endpoint, impl);

  factory ImportedInterfaceInterface.fromMock(
      ImportedInterface mock) =>
      new ImportedInterfaceProxy.fromMock(mock);
}

abstract class ImportedInterfaceInterfaceRequest
    implements bindings.MojoInterface<ImportedInterface>,
               ImportedInterface {
  factory ImportedInterfaceInterfaceRequest() =>
      new ImportedInterfaceProxy.unbound();
}

class _ImportedInterfaceProxyControl
    extends bindings.ProxyMessageHandler
    implements bindings.ProxyControl<ImportedInterface> {
  ImportedInterface impl;

  _ImportedInterfaceProxyControl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  _ImportedInterfaceProxyControl.fromHandle(
      core.MojoHandle handle) : super.fromHandle(handle);

  _ImportedInterfaceProxyControl.unbound() : super.unbound();

  String get serviceName => ImportedInterface.serviceName;

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
    return "_ImportedInterfaceProxyControl($superString)";
  }
}

class ImportedInterfaceProxy
    extends bindings.Proxy<ImportedInterface>
    implements ImportedInterface,
               ImportedInterfaceInterface,
               ImportedInterfaceInterfaceRequest {
  ImportedInterfaceProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint)
      : super(new _ImportedInterfaceProxyControl.fromEndpoint(endpoint));

  ImportedInterfaceProxy.fromHandle(core.MojoHandle handle)
      : super(new _ImportedInterfaceProxyControl.fromHandle(handle));

  ImportedInterfaceProxy.unbound()
      : super(new _ImportedInterfaceProxyControl.unbound());

  factory ImportedInterfaceProxy.fromMock(ImportedInterface mock) {
    ImportedInterfaceProxy newMockedProxy =
        new ImportedInterfaceProxy.unbound();
    newMockedProxy.impl = mock;
    return newMockedProxy;
  }

  static ImportedInterfaceProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For ImportedInterfaceProxy"));
    return new ImportedInterfaceProxy.fromEndpoint(endpoint);
  }


  void doSomething() {
    if (impl != null) {
      impl.doSomething();
      return;
    }
    if (!ctrl.isBound) {
      ctrl.proxyError("The Proxy is closed.");
      return;
    }
    var params = new _ImportedInterfaceDoSomethingParams();
    ctrl.sendMessage(params,
        _importedInterfaceMethodDoSomethingName);
  }
}

class _ImportedInterfaceStubControl
    extends bindings.StubMessageHandler
    implements bindings.StubControl<ImportedInterface> {
  ImportedInterface _impl;

  _ImportedInterfaceStubControl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [ImportedInterface impl])
      : super.fromEndpoint(endpoint, autoBegin: impl != null) {
    _impl = impl;
  }

  _ImportedInterfaceStubControl.fromHandle(
      core.MojoHandle handle, [ImportedInterface impl])
      : super.fromHandle(handle, autoBegin: impl != null) {
    _impl = impl;
  }

  _ImportedInterfaceStubControl.unbound([this._impl]) : super.unbound();

  String get serviceName => ImportedInterface.serviceName;



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
      case _importedInterfaceMethodDoSomethingName:
        _impl.doSomething();
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }

  ImportedInterface get impl => _impl;
  set impl(ImportedInterface d) {
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
    return "_ImportedInterfaceStubControl($superString)";
  }

  int get version => 0;
}

class ImportedInterfaceStub
    extends bindings.Stub<ImportedInterface>
    implements ImportedInterface,
               ImportedInterfaceInterface,
               ImportedInterfaceInterfaceRequest {
  ImportedInterfaceStub.unbound([ImportedInterface impl])
      : super(new _ImportedInterfaceStubControl.unbound(impl));

  ImportedInterfaceStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [ImportedInterface impl])
      : super(new _ImportedInterfaceStubControl.fromEndpoint(endpoint, impl));

  ImportedInterfaceStub.fromHandle(
      core.MojoHandle handle, [ImportedInterface impl])
      : super(new _ImportedInterfaceStubControl.fromHandle(handle, impl));

  static ImportedInterfaceStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For ImportedInterfaceStub"));
    return new ImportedInterfaceStub.fromEndpoint(endpoint);
  }


  void doSomething() {
    return impl.doSomething();
  }
}


mojom_types.RuntimeTypeInfo getRuntimeTypeInfo() => _runtimeTypeInfo ??
    _initRuntimeTypeInfo();

Map<String, mojom_types.UserDefinedType> getAllMojomTypeDefinitions() {
  return getRuntimeTypeInfo().typeMap;
}

var _runtimeTypeInfo;
mojom_types.RuntimeTypeInfo  _initRuntimeTypeInfo() {
  // serializedRuntimeTypeInfo contains the bytes of the Mojo serialization of
  // a mojom_types.RuntimeTypeInfo struct describing the Mojom types in this
  // file. The string contains the base64 encoding of the gzip-compressed bytes.
  var serializedRuntimeTypeInfo = "H4sIAAAJbogC/8yYzW7TQBCA10kLKU1LEP1JfwAXChQQWcSp4tSqRCSiQlGbQ3qhTVO3NkriYDsS8AQ8Rh+FR+EReuQG63iW2OPdxIbUyUqjjb3jeOfbmdnx5onXctC/gh7f530G9ViPKP3/mWayBbdL0Heg/w79JfRPmNxnUj2qFI/fF4/eGK2OaTnaWWG3bTq6Zh3q9Y5GyAum80ioV4Yf5bajWef1htb73wdMloX6FdNoOwPGvRc+Y2MbwvEjzQlOrddqYHcO2e1ep5n8nOpfu6j0TJDfj9ng9eWdwZx3SLDx9eP3f0OrEHFbYJJlgk25x2SRiWQZQvO5C3afM/nIhHZtizbNRr1JL0zzoqlR3Wxp9JtVpy3zk/ma2laj94t2uqdNo0ENvmw2PTXaZ0b7wqaOZjs2teutTlM79mZScJ9pEaICTz6PEvA4SXk99zsV+zHo3SLx+NUk/NzlmWFyUNyr7n54t1+E+0/B94T8Cn1tzNFdj1SCHLlfch6YG26zQ7htR/S7eSY3mOyVD/ZcaJvs97qUF9cK+91iwryG8cmOiE8Ocmz1oNxzFJ4fxXy4VpjP0oTwySvBaxmfEuJzIuGzArEnzvqEPGSy6uclUcS8NiEWkuKF35/3+ZGC/EHx7buY85WEk4wz8XEW3Se+vO7G/FvzkNnt6MweIbfHCfuZinhdoT6K3W7blti9Brb77H5paZ+7bEbi/RhaUvZnJH6RR/PJID/h47+4H6Xj5asdCa852P+9qsrLO/P++IMBzM3dI28mHG8pf7yhOmobzW+aRGtR42xL8vwMrOMXSV2twlomxSkuj6l/4KFE4PFVwmMjYR6D4iwlyN+5iPkobnzx+jsUXzCA3z+bcF2+Bb6gorq8BnW5nh5cn2eUwOfNf3/fyOpzFdYqyK9fmGOO2THV5UrEujwV089KEevy0HcgKsgxp7kJq8fTI+KC63F+boC4/C3EMZf5MXPJcR9RRsslC/G+v3tY9ddNiAsfDnG5Pea6UUXxI1tn2fnQdZ3LLAMbfMoUyltIAc9nZcznMhXgoQ85l+F12ELMvH8SM+8/h29DGb8CegDzXB3TPrAQcR9YvKbzmdB5FuYGipjX2oTtB0sx+dQi7gf8nFjKp39EI/Sr9YQ5/QkAAP//SWnGfvgXAAA=";

  // Deserialize RuntimeTypeInfo
  var bytes = BASE64.decode(serializedRuntimeTypeInfo);
  var unzippedBytes = new ZLibDecoder().convert(bytes);
  var bdata = new ByteData.view(unzippedBytes.buffer);
  var message = new bindings.Message(bdata, null, unzippedBytes.length, 0);
  _runtimeTypeInfo = mojom_types.RuntimeTypeInfo.deserialize(message);
  return _runtimeTypeInfo;
}
