// WARNING: DO NOT EDIT. This file was generated by a program.
// See $MOJO_SDK/tools/bindings/mojom_bindings_generator.py.

library timeline_controller_mojom;
import 'dart:async';
import 'package:mojo/bindings.dart' as bindings;
import 'package:mojo/core.dart' as core;
import 'package:mojo/mojo/bindings/types/service_describer.mojom.dart' as service_describer;
import 'package:mojo_services/mojo/timelines.mojom.dart' as timelines_mojom;



class MediaTimelineControlSiteStatus extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  timelines_mojom.TimelineTransform timelineTransform = null;
  bool endOfStream = false;

  MediaTimelineControlSiteStatus() : super(kVersions.last.size);

  MediaTimelineControlSiteStatus.init(
    timelines_mojom.TimelineTransform this.timelineTransform, 
    bool this.endOfStream
  ) : super(kVersions.last.size);

  static MediaTimelineControlSiteStatus deserialize(bindings.Message message) =>
      bindings.Struct.deserialize(decode, message);

  static MediaTimelineControlSiteStatus decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    MediaTimelineControlSiteStatus result = new MediaTimelineControlSiteStatus();

    var mainDataHeader = bindings.Struct.checkVersion(decoder0, kVersions);
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.timelineTransform = timelines_mojom.TimelineTransform.decode(decoder1);
    }
    if (mainDataHeader.version >= 0) {
      
      result.endOfStream = decoder0.decodeBool(16, 0);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    const String structName = "MediaTimelineControlSiteStatus";
    String fieldName;
    try {
      fieldName = "timelineTransform";
      encoder0.encodeStruct(timelineTransform, 8, false);
      fieldName = "endOfStream";
      encoder0.encodeBool(endOfStream, 16, 0);
    } on bindings.MojoCodecError catch(e) {
      bindings.Struct.fixErrorMessage(e, fieldName, structName);
      rethrow;
    }
  }

  String toString() {
    return "MediaTimelineControlSiteStatus("
           "timelineTransform: $timelineTransform" ", "
           "endOfStream: $endOfStream" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["timelineTransform"] = timelineTransform;
    map["endOfStream"] = endOfStream;
    return map;
  }
}


class _MediaTimelineControllerAddControlSiteParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  MediaTimelineControlSiteInterface controlSite = null;

  _MediaTimelineControllerAddControlSiteParams() : super(kVersions.last.size);

  _MediaTimelineControllerAddControlSiteParams.init(
    MediaTimelineControlSiteInterface this.controlSite
  ) : super(kVersions.last.size);

  static _MediaTimelineControllerAddControlSiteParams deserialize(bindings.Message message) =>
      bindings.Struct.deserialize(decode, message);

  static _MediaTimelineControllerAddControlSiteParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _MediaTimelineControllerAddControlSiteParams result = new _MediaTimelineControllerAddControlSiteParams();

    var mainDataHeader = bindings.Struct.checkVersion(decoder0, kVersions);
    if (mainDataHeader.version >= 0) {
      
      result.controlSite = decoder0.decodeServiceInterface(8, false, MediaTimelineControlSiteProxy.newFromEndpoint);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    const String structName = "_MediaTimelineControllerAddControlSiteParams";
    String fieldName;
    try {
      fieldName = "controlSite";
      encoder0.encodeInterface(controlSite, 8, false);
    } on bindings.MojoCodecError catch(e) {
      bindings.Struct.fixErrorMessage(e, fieldName, structName);
      rethrow;
    }
  }

  String toString() {
    return "_MediaTimelineControllerAddControlSiteParams("
           "controlSite: $controlSite" ")";
  }

  Map toJson() {
    throw new bindings.MojoCodecError(
        'Object containing handles cannot be encoded to JSON.');
  }
}


class _MediaTimelineControllerGetControlSiteParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  MediaTimelineControlSiteInterfaceRequest controlSite = null;

  _MediaTimelineControllerGetControlSiteParams() : super(kVersions.last.size);

  _MediaTimelineControllerGetControlSiteParams.init(
    MediaTimelineControlSiteInterfaceRequest this.controlSite
  ) : super(kVersions.last.size);

  static _MediaTimelineControllerGetControlSiteParams deserialize(bindings.Message message) =>
      bindings.Struct.deserialize(decode, message);

  static _MediaTimelineControllerGetControlSiteParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _MediaTimelineControllerGetControlSiteParams result = new _MediaTimelineControllerGetControlSiteParams();

    var mainDataHeader = bindings.Struct.checkVersion(decoder0, kVersions);
    if (mainDataHeader.version >= 0) {
      
      result.controlSite = decoder0.decodeInterfaceRequest(8, false, MediaTimelineControlSiteStub.newFromEndpoint);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    const String structName = "_MediaTimelineControllerGetControlSiteParams";
    String fieldName;
    try {
      fieldName = "controlSite";
      encoder0.encodeInterfaceRequest(controlSite, 8, false);
    } on bindings.MojoCodecError catch(e) {
      bindings.Struct.fixErrorMessage(e, fieldName, structName);
      rethrow;
    }
  }

  String toString() {
    return "_MediaTimelineControllerGetControlSiteParams("
           "controlSite: $controlSite" ")";
  }

  Map toJson() {
    throw new bindings.MojoCodecError(
        'Object containing handles cannot be encoded to JSON.');
  }
}


class _MediaTimelineControlSiteGetStatusParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  int versionLastSeen = 0;

  _MediaTimelineControlSiteGetStatusParams() : super(kVersions.last.size);

  _MediaTimelineControlSiteGetStatusParams.init(
    int this.versionLastSeen
  ) : super(kVersions.last.size);

  static _MediaTimelineControlSiteGetStatusParams deserialize(bindings.Message message) =>
      bindings.Struct.deserialize(decode, message);

  static _MediaTimelineControlSiteGetStatusParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _MediaTimelineControlSiteGetStatusParams result = new _MediaTimelineControlSiteGetStatusParams();

    var mainDataHeader = bindings.Struct.checkVersion(decoder0, kVersions);
    if (mainDataHeader.version >= 0) {
      
      result.versionLastSeen = decoder0.decodeUint64(8);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    const String structName = "_MediaTimelineControlSiteGetStatusParams";
    String fieldName;
    try {
      fieldName = "versionLastSeen";
      encoder0.encodeUint64(versionLastSeen, 8);
    } on bindings.MojoCodecError catch(e) {
      bindings.Struct.fixErrorMessage(e, fieldName, structName);
      rethrow;
    }
  }

  String toString() {
    return "_MediaTimelineControlSiteGetStatusParams("
           "versionLastSeen: $versionLastSeen" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["versionLastSeen"] = versionLastSeen;
    return map;
  }
}


class MediaTimelineControlSiteGetStatusResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  int version = 0;
  MediaTimelineControlSiteStatus status = null;

  MediaTimelineControlSiteGetStatusResponseParams() : super(kVersions.last.size);

  MediaTimelineControlSiteGetStatusResponseParams.init(
    int this.version, 
    MediaTimelineControlSiteStatus this.status
  ) : super(kVersions.last.size);

  static MediaTimelineControlSiteGetStatusResponseParams deserialize(bindings.Message message) =>
      bindings.Struct.deserialize(decode, message);

  static MediaTimelineControlSiteGetStatusResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    MediaTimelineControlSiteGetStatusResponseParams result = new MediaTimelineControlSiteGetStatusResponseParams();

    var mainDataHeader = bindings.Struct.checkVersion(decoder0, kVersions);
    if (mainDataHeader.version >= 0) {
      
      result.version = decoder0.decodeUint64(8);
    }
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(16, false);
      result.status = MediaTimelineControlSiteStatus.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    const String structName = "MediaTimelineControlSiteGetStatusResponseParams";
    String fieldName;
    try {
      fieldName = "version";
      encoder0.encodeUint64(version, 8);
      fieldName = "status";
      encoder0.encodeStruct(status, 16, false);
    } on bindings.MojoCodecError catch(e) {
      bindings.Struct.fixErrorMessage(e, fieldName, structName);
      rethrow;
    }
  }

  String toString() {
    return "MediaTimelineControlSiteGetStatusResponseParams("
           "version: $version" ", "
           "status: $status" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["version"] = version;
    map["status"] = status;
    return map;
  }
}


class _MediaTimelineControlSiteGetTimelineConsumerParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  timelines_mojom.TimelineConsumerInterfaceRequest timelineConsumer = null;

  _MediaTimelineControlSiteGetTimelineConsumerParams() : super(kVersions.last.size);

  _MediaTimelineControlSiteGetTimelineConsumerParams.init(
    timelines_mojom.TimelineConsumerInterfaceRequest this.timelineConsumer
  ) : super(kVersions.last.size);

  static _MediaTimelineControlSiteGetTimelineConsumerParams deserialize(bindings.Message message) =>
      bindings.Struct.deserialize(decode, message);

  static _MediaTimelineControlSiteGetTimelineConsumerParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _MediaTimelineControlSiteGetTimelineConsumerParams result = new _MediaTimelineControlSiteGetTimelineConsumerParams();

    var mainDataHeader = bindings.Struct.checkVersion(decoder0, kVersions);
    if (mainDataHeader.version >= 0) {
      
      result.timelineConsumer = decoder0.decodeInterfaceRequest(8, false, timelines_mojom.TimelineConsumerStub.newFromEndpoint);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    const String structName = "_MediaTimelineControlSiteGetTimelineConsumerParams";
    String fieldName;
    try {
      fieldName = "timelineConsumer";
      encoder0.encodeInterfaceRequest(timelineConsumer, 8, false);
    } on bindings.MojoCodecError catch(e) {
      bindings.Struct.fixErrorMessage(e, fieldName, structName);
      rethrow;
    }
  }

  String toString() {
    return "_MediaTimelineControlSiteGetTimelineConsumerParams("
           "timelineConsumer: $timelineConsumer" ")";
  }

  Map toJson() {
    throw new bindings.MojoCodecError(
        'Object containing handles cannot be encoded to JSON.');
  }
}

const int _mediaTimelineControllerMethodAddControlSiteName = 0;
const int _mediaTimelineControllerMethodGetControlSiteName = 1;

class _MediaTimelineControllerServiceDescription implements service_describer.ServiceDescription {
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

abstract class MediaTimelineController {
  static const String serviceName = null;

  static service_describer.ServiceDescription _cachedServiceDescription;
  static service_describer.ServiceDescription get serviceDescription {
    if (_cachedServiceDescription == null) {
      _cachedServiceDescription = new _MediaTimelineControllerServiceDescription();
    }
    return _cachedServiceDescription;
  }

  static MediaTimelineControllerProxy connectToService(
      bindings.ServiceConnector s, String url, [String serviceName]) {
    MediaTimelineControllerProxy p = new MediaTimelineControllerProxy.unbound();
    String name = serviceName ?? MediaTimelineController.serviceName;
    if ((name == null) || name.isEmpty) {
      throw new core.MojoApiError(
          "If an interface has no ServiceName, then one must be provided.");
    }
    s.connectToService(url, p, name);
    return p;
  }
  void addControlSite(MediaTimelineControlSiteInterface controlSite);
  void getControlSite(MediaTimelineControlSiteInterfaceRequest controlSite);
}

abstract class MediaTimelineControllerInterface
    implements bindings.MojoInterface<MediaTimelineController>,
               MediaTimelineController {
  factory MediaTimelineControllerInterface([MediaTimelineController impl]) =>
      new MediaTimelineControllerStub.unbound(impl);

  factory MediaTimelineControllerInterface.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint,
      [MediaTimelineController impl]) =>
      new MediaTimelineControllerStub.fromEndpoint(endpoint, impl);

  factory MediaTimelineControllerInterface.fromMock(
      MediaTimelineController mock) =>
      new MediaTimelineControllerProxy.fromMock(mock);
}

abstract class MediaTimelineControllerInterfaceRequest
    implements bindings.MojoInterface<MediaTimelineController>,
               MediaTimelineController {
  factory MediaTimelineControllerInterfaceRequest() =>
      new MediaTimelineControllerProxy.unbound();
}

class _MediaTimelineControllerProxyControl
    extends bindings.ProxyMessageHandler
    implements bindings.ProxyControl<MediaTimelineController> {
  MediaTimelineController impl;

  _MediaTimelineControllerProxyControl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  _MediaTimelineControllerProxyControl.fromHandle(
      core.MojoHandle handle) : super.fromHandle(handle);

  _MediaTimelineControllerProxyControl.unbound() : super.unbound();

  String get serviceName => MediaTimelineController.serviceName;

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
    return "_MediaTimelineControllerProxyControl($superString)";
  }
}

class MediaTimelineControllerProxy
    extends bindings.Proxy<MediaTimelineController>
    implements MediaTimelineController,
               MediaTimelineControllerInterface,
               MediaTimelineControllerInterfaceRequest {
  MediaTimelineControllerProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint)
      : super(new _MediaTimelineControllerProxyControl.fromEndpoint(endpoint));

  MediaTimelineControllerProxy.fromHandle(core.MojoHandle handle)
      : super(new _MediaTimelineControllerProxyControl.fromHandle(handle));

  MediaTimelineControllerProxy.unbound()
      : super(new _MediaTimelineControllerProxyControl.unbound());

  factory MediaTimelineControllerProxy.fromMock(MediaTimelineController mock) {
    MediaTimelineControllerProxy newMockedProxy =
        new MediaTimelineControllerProxy.unbound();
    newMockedProxy.impl = mock;
    return newMockedProxy;
  }

  static MediaTimelineControllerProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For MediaTimelineControllerProxy"));
    return new MediaTimelineControllerProxy.fromEndpoint(endpoint);
  }


  void addControlSite(MediaTimelineControlSiteInterface controlSite) {
    if (impl != null) {
      impl.addControlSite(controlSite);
      return;
    }
    if (!ctrl.isBound) {
      ctrl.proxyError("The Proxy is closed.");
      return;
    }
    var params = new _MediaTimelineControllerAddControlSiteParams();
    params.controlSite = controlSite;
    ctrl.sendMessage(params,
        _mediaTimelineControllerMethodAddControlSiteName);
  }
  void getControlSite(MediaTimelineControlSiteInterfaceRequest controlSite) {
    if (impl != null) {
      impl.getControlSite(controlSite);
      return;
    }
    if (!ctrl.isBound) {
      ctrl.proxyError("The Proxy is closed.");
      return;
    }
    var params = new _MediaTimelineControllerGetControlSiteParams();
    params.controlSite = controlSite;
    ctrl.sendMessage(params,
        _mediaTimelineControllerMethodGetControlSiteName);
  }
}

class _MediaTimelineControllerStubControl
    extends bindings.StubMessageHandler
    implements bindings.StubControl<MediaTimelineController> {
  MediaTimelineController _impl;

  _MediaTimelineControllerStubControl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [MediaTimelineController impl])
      : super.fromEndpoint(endpoint, autoBegin: impl != null) {
    _impl = impl;
  }

  _MediaTimelineControllerStubControl.fromHandle(
      core.MojoHandle handle, [MediaTimelineController impl])
      : super.fromHandle(handle, autoBegin: impl != null) {
    _impl = impl;
  }

  _MediaTimelineControllerStubControl.unbound([this._impl]) : super.unbound();

  String get serviceName => MediaTimelineController.serviceName;



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
      case _mediaTimelineControllerMethodAddControlSiteName:
        var params = _MediaTimelineControllerAddControlSiteParams.deserialize(
            message.payload);
        _impl.addControlSite(params.controlSite);
        break;
      case _mediaTimelineControllerMethodGetControlSiteName:
        var params = _MediaTimelineControllerGetControlSiteParams.deserialize(
            message.payload);
        _impl.getControlSite(params.controlSite);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }

  MediaTimelineController get impl => _impl;
  set impl(MediaTimelineController d) {
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
    return "_MediaTimelineControllerStubControl($superString)";
  }

  int get version => 0;
}

class MediaTimelineControllerStub
    extends bindings.Stub<MediaTimelineController>
    implements MediaTimelineController,
               MediaTimelineControllerInterface,
               MediaTimelineControllerInterfaceRequest {
  MediaTimelineControllerStub.unbound([MediaTimelineController impl])
      : super(new _MediaTimelineControllerStubControl.unbound(impl));

  MediaTimelineControllerStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [MediaTimelineController impl])
      : super(new _MediaTimelineControllerStubControl.fromEndpoint(endpoint, impl));

  MediaTimelineControllerStub.fromHandle(
      core.MojoHandle handle, [MediaTimelineController impl])
      : super(new _MediaTimelineControllerStubControl.fromHandle(handle, impl));

  static MediaTimelineControllerStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For MediaTimelineControllerStub"));
    return new MediaTimelineControllerStub.fromEndpoint(endpoint);
  }


  void addControlSite(MediaTimelineControlSiteInterface controlSite) {
    return impl.addControlSite(controlSite);
  }
  void getControlSite(MediaTimelineControlSiteInterfaceRequest controlSite) {
    return impl.getControlSite(controlSite);
  }
}

const int _mediaTimelineControlSiteMethodGetStatusName = 0;
const int _mediaTimelineControlSiteMethodGetTimelineConsumerName = 1;

class _MediaTimelineControlSiteServiceDescription implements service_describer.ServiceDescription {
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

abstract class MediaTimelineControlSite {
  static const String serviceName = null;

  static service_describer.ServiceDescription _cachedServiceDescription;
  static service_describer.ServiceDescription get serviceDescription {
    if (_cachedServiceDescription == null) {
      _cachedServiceDescription = new _MediaTimelineControlSiteServiceDescription();
    }
    return _cachedServiceDescription;
  }

  static MediaTimelineControlSiteProxy connectToService(
      bindings.ServiceConnector s, String url, [String serviceName]) {
    MediaTimelineControlSiteProxy p = new MediaTimelineControlSiteProxy.unbound();
    String name = serviceName ?? MediaTimelineControlSite.serviceName;
    if ((name == null) || name.isEmpty) {
      throw new core.MojoApiError(
          "If an interface has no ServiceName, then one must be provided.");
    }
    s.connectToService(url, p, name);
    return p;
  }
  void getStatus(int versionLastSeen,void callback(int version, MediaTimelineControlSiteStatus status));
  void getTimelineConsumer(timelines_mojom.TimelineConsumerInterfaceRequest timelineConsumer);
  static const int kInitialStatus = 0;
}

abstract class MediaTimelineControlSiteInterface
    implements bindings.MojoInterface<MediaTimelineControlSite>,
               MediaTimelineControlSite {
  factory MediaTimelineControlSiteInterface([MediaTimelineControlSite impl]) =>
      new MediaTimelineControlSiteStub.unbound(impl);

  factory MediaTimelineControlSiteInterface.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint,
      [MediaTimelineControlSite impl]) =>
      new MediaTimelineControlSiteStub.fromEndpoint(endpoint, impl);

  factory MediaTimelineControlSiteInterface.fromMock(
      MediaTimelineControlSite mock) =>
      new MediaTimelineControlSiteProxy.fromMock(mock);
}

abstract class MediaTimelineControlSiteInterfaceRequest
    implements bindings.MojoInterface<MediaTimelineControlSite>,
               MediaTimelineControlSite {
  factory MediaTimelineControlSiteInterfaceRequest() =>
      new MediaTimelineControlSiteProxy.unbound();
}

class _MediaTimelineControlSiteProxyControl
    extends bindings.ProxyMessageHandler
    implements bindings.ProxyControl<MediaTimelineControlSite> {
  MediaTimelineControlSite impl;

  _MediaTimelineControlSiteProxyControl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  _MediaTimelineControlSiteProxyControl.fromHandle(
      core.MojoHandle handle) : super.fromHandle(handle);

  _MediaTimelineControlSiteProxyControl.unbound() : super.unbound();

  String get serviceName => MediaTimelineControlSite.serviceName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case _mediaTimelineControlSiteMethodGetStatusName:
        var r = MediaTimelineControlSiteGetStatusResponseParams.deserialize(
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
        callback(r.version , r.status );
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
    return "_MediaTimelineControlSiteProxyControl($superString)";
  }
}

class MediaTimelineControlSiteProxy
    extends bindings.Proxy<MediaTimelineControlSite>
    implements MediaTimelineControlSite,
               MediaTimelineControlSiteInterface,
               MediaTimelineControlSiteInterfaceRequest {
  MediaTimelineControlSiteProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint)
      : super(new _MediaTimelineControlSiteProxyControl.fromEndpoint(endpoint));

  MediaTimelineControlSiteProxy.fromHandle(core.MojoHandle handle)
      : super(new _MediaTimelineControlSiteProxyControl.fromHandle(handle));

  MediaTimelineControlSiteProxy.unbound()
      : super(new _MediaTimelineControlSiteProxyControl.unbound());

  factory MediaTimelineControlSiteProxy.fromMock(MediaTimelineControlSite mock) {
    MediaTimelineControlSiteProxy newMockedProxy =
        new MediaTimelineControlSiteProxy.unbound();
    newMockedProxy.impl = mock;
    return newMockedProxy;
  }

  static MediaTimelineControlSiteProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For MediaTimelineControlSiteProxy"));
    return new MediaTimelineControlSiteProxy.fromEndpoint(endpoint);
  }


  void getStatus(int versionLastSeen,void callback(int version, MediaTimelineControlSiteStatus status)) {
    if (impl != null) {
      impl.getStatus(versionLastSeen,callback);
      return;
    }
    var params = new _MediaTimelineControlSiteGetStatusParams();
    params.versionLastSeen = versionLastSeen;
    Function zonedCallback;
    if (identical(Zone.current, Zone.ROOT)) {
      zonedCallback = callback;
    } else {
      Zone z = Zone.current;
      zonedCallback = ((int version, MediaTimelineControlSiteStatus status) {
        z.bindCallback(() {
          callback(version, status);
        })();
      });
    }
    ctrl.sendMessageWithRequestId(
        params,
        _mediaTimelineControlSiteMethodGetStatusName,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse,
        zonedCallback);
  }
  void getTimelineConsumer(timelines_mojom.TimelineConsumerInterfaceRequest timelineConsumer) {
    if (impl != null) {
      impl.getTimelineConsumer(timelineConsumer);
      return;
    }
    if (!ctrl.isBound) {
      ctrl.proxyError("The Proxy is closed.");
      return;
    }
    var params = new _MediaTimelineControlSiteGetTimelineConsumerParams();
    params.timelineConsumer = timelineConsumer;
    ctrl.sendMessage(params,
        _mediaTimelineControlSiteMethodGetTimelineConsumerName);
  }
}

class _MediaTimelineControlSiteStubControl
    extends bindings.StubMessageHandler
    implements bindings.StubControl<MediaTimelineControlSite> {
  MediaTimelineControlSite _impl;

  _MediaTimelineControlSiteStubControl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [MediaTimelineControlSite impl])
      : super.fromEndpoint(endpoint, autoBegin: impl != null) {
    _impl = impl;
  }

  _MediaTimelineControlSiteStubControl.fromHandle(
      core.MojoHandle handle, [MediaTimelineControlSite impl])
      : super.fromHandle(handle, autoBegin: impl != null) {
    _impl = impl;
  }

  _MediaTimelineControlSiteStubControl.unbound([this._impl]) : super.unbound();

  String get serviceName => MediaTimelineControlSite.serviceName;


  Function _mediaTimelineControlSiteGetStatusResponseParamsResponder(
      int requestId) {
  return (int version, MediaTimelineControlSiteStatus status) {
      var result = new MediaTimelineControlSiteGetStatusResponseParams();
      result.version = version;
      result.status = status;
      sendResponse(buildResponseWithId(
          result,
          _mediaTimelineControlSiteMethodGetStatusName,
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
      case _mediaTimelineControlSiteMethodGetStatusName:
        var params = _MediaTimelineControlSiteGetStatusParams.deserialize(
            message.payload);
        _impl.getStatus(params.versionLastSeen, _mediaTimelineControlSiteGetStatusResponseParamsResponder(message.header.requestId));
        break;
      case _mediaTimelineControlSiteMethodGetTimelineConsumerName:
        var params = _MediaTimelineControlSiteGetTimelineConsumerParams.deserialize(
            message.payload);
        _impl.getTimelineConsumer(params.timelineConsumer);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }

  MediaTimelineControlSite get impl => _impl;
  set impl(MediaTimelineControlSite d) {
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
    return "_MediaTimelineControlSiteStubControl($superString)";
  }

  int get version => 0;
}

class MediaTimelineControlSiteStub
    extends bindings.Stub<MediaTimelineControlSite>
    implements MediaTimelineControlSite,
               MediaTimelineControlSiteInterface,
               MediaTimelineControlSiteInterfaceRequest {
  MediaTimelineControlSiteStub.unbound([MediaTimelineControlSite impl])
      : super(new _MediaTimelineControlSiteStubControl.unbound(impl));

  MediaTimelineControlSiteStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [MediaTimelineControlSite impl])
      : super(new _MediaTimelineControlSiteStubControl.fromEndpoint(endpoint, impl));

  MediaTimelineControlSiteStub.fromHandle(
      core.MojoHandle handle, [MediaTimelineControlSite impl])
      : super(new _MediaTimelineControlSiteStubControl.fromHandle(handle, impl));

  static MediaTimelineControlSiteStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For MediaTimelineControlSiteStub"));
    return new MediaTimelineControlSiteStub.fromEndpoint(endpoint);
  }


  void getStatus(int versionLastSeen,void callback(int version, MediaTimelineControlSiteStatus status)) {
    return impl.getStatus(versionLastSeen,callback);
  }
  void getTimelineConsumer(timelines_mojom.TimelineConsumerInterfaceRequest timelineConsumer) {
    return impl.getTimelineConsumer(timelineConsumer);
  }
}



