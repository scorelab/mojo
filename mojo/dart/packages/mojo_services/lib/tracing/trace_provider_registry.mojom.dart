// WARNING: DO NOT EDIT. This file was generated by a program.
// See $MOJO_SDK/tools/bindings/mojom_bindings_generator.py.

library trace_provider_registry_mojom;
import 'dart:async';
import 'package:mojo/bindings.dart' as bindings;
import 'package:mojo/core.dart' as core;
import 'package:mojo/mojo/bindings/types/service_describer.mojom.dart' as service_describer;
import 'package:mojo_services/tracing/tracing.mojom.dart' as tracing_mojom;



class _TraceProviderRegistryRegisterTraceProviderParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  tracing_mojom.TraceProviderInterface traceProvider = null;

  _TraceProviderRegistryRegisterTraceProviderParams() : super(kVersions.last.size);

  _TraceProviderRegistryRegisterTraceProviderParams.init(
    tracing_mojom.TraceProviderInterface this.traceProvider
  ) : super(kVersions.last.size);

  static _TraceProviderRegistryRegisterTraceProviderParams deserialize(bindings.Message message) =>
      bindings.Struct.deserialize(decode, message);

  static _TraceProviderRegistryRegisterTraceProviderParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    _TraceProviderRegistryRegisterTraceProviderParams result = new _TraceProviderRegistryRegisterTraceProviderParams();

    var mainDataHeader = bindings.Struct.checkVersion(decoder0, kVersions);
    if (mainDataHeader.version >= 0) {
      
      result.traceProvider = decoder0.decodeServiceInterface(8, false, tracing_mojom.TraceProviderProxy.newFromEndpoint);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    const String structName = "_TraceProviderRegistryRegisterTraceProviderParams";
    String fieldName;
    try {
      fieldName = "traceProvider";
      encoder0.encodeInterface(traceProvider, 8, false);
    } on bindings.MojoCodecError catch(e) {
      bindings.Struct.fixErrorMessage(e, fieldName, structName);
      rethrow;
    }
  }

  String toString() {
    return "_TraceProviderRegistryRegisterTraceProviderParams("
           "traceProvider: $traceProvider" ")";
  }

  Map toJson() {
    throw new bindings.MojoCodecError(
        'Object containing handles cannot be encoded to JSON.');
  }
}

const int _traceProviderRegistryMethodRegisterTraceProviderName = 0;

class _TraceProviderRegistryServiceDescription implements service_describer.ServiceDescription {
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

abstract class TraceProviderRegistry {
  static const String serviceName = "tracing.TraceProviderRegistry";

  static service_describer.ServiceDescription _cachedServiceDescription;
  static service_describer.ServiceDescription get serviceDescription {
    if (_cachedServiceDescription == null) {
      _cachedServiceDescription = new _TraceProviderRegistryServiceDescription();
    }
    return _cachedServiceDescription;
  }

  static TraceProviderRegistryProxy connectToService(
      bindings.ServiceConnector s, String url, [String serviceName]) {
    TraceProviderRegistryProxy p = new TraceProviderRegistryProxy.unbound();
    String name = serviceName ?? TraceProviderRegistry.serviceName;
    if ((name == null) || name.isEmpty) {
      throw new core.MojoApiError(
          "If an interface has no ServiceName, then one must be provided.");
    }
    s.connectToService(url, p, name);
    return p;
  }
  void registerTraceProvider(tracing_mojom.TraceProviderInterface traceProvider);
}

abstract class TraceProviderRegistryInterface
    implements bindings.MojoInterface<TraceProviderRegistry>,
               TraceProviderRegistry {
  factory TraceProviderRegistryInterface([TraceProviderRegistry impl]) =>
      new TraceProviderRegistryStub.unbound(impl);

  factory TraceProviderRegistryInterface.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint,
      [TraceProviderRegistry impl]) =>
      new TraceProviderRegistryStub.fromEndpoint(endpoint, impl);

  factory TraceProviderRegistryInterface.fromMock(
      TraceProviderRegistry mock) =>
      new TraceProviderRegistryProxy.fromMock(mock);
}

abstract class TraceProviderRegistryInterfaceRequest
    implements bindings.MojoInterface<TraceProviderRegistry>,
               TraceProviderRegistry {
  factory TraceProviderRegistryInterfaceRequest() =>
      new TraceProviderRegistryProxy.unbound();
}

class _TraceProviderRegistryProxyControl
    extends bindings.ProxyMessageHandler
    implements bindings.ProxyControl<TraceProviderRegistry> {
  TraceProviderRegistry impl;

  _TraceProviderRegistryProxyControl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  _TraceProviderRegistryProxyControl.fromHandle(
      core.MojoHandle handle) : super.fromHandle(handle);

  _TraceProviderRegistryProxyControl.unbound() : super.unbound();

  String get serviceName => TraceProviderRegistry.serviceName;

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
    return "_TraceProviderRegistryProxyControl($superString)";
  }
}

class TraceProviderRegistryProxy
    extends bindings.Proxy<TraceProviderRegistry>
    implements TraceProviderRegistry,
               TraceProviderRegistryInterface,
               TraceProviderRegistryInterfaceRequest {
  TraceProviderRegistryProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint)
      : super(new _TraceProviderRegistryProxyControl.fromEndpoint(endpoint));

  TraceProviderRegistryProxy.fromHandle(core.MojoHandle handle)
      : super(new _TraceProviderRegistryProxyControl.fromHandle(handle));

  TraceProviderRegistryProxy.unbound()
      : super(new _TraceProviderRegistryProxyControl.unbound());

  factory TraceProviderRegistryProxy.fromMock(TraceProviderRegistry mock) {
    TraceProviderRegistryProxy newMockedProxy =
        new TraceProviderRegistryProxy.unbound();
    newMockedProxy.impl = mock;
    return newMockedProxy;
  }

  static TraceProviderRegistryProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For TraceProviderRegistryProxy"));
    return new TraceProviderRegistryProxy.fromEndpoint(endpoint);
  }


  void registerTraceProvider(tracing_mojom.TraceProviderInterface traceProvider) {
    if (impl != null) {
      impl.registerTraceProvider(traceProvider);
      return;
    }
    if (!ctrl.isBound) {
      ctrl.proxyError("The Proxy is closed.");
      return;
    }
    var params = new _TraceProviderRegistryRegisterTraceProviderParams();
    params.traceProvider = traceProvider;
    ctrl.sendMessage(params,
        _traceProviderRegistryMethodRegisterTraceProviderName);
  }
}

class _TraceProviderRegistryStubControl
    extends bindings.StubMessageHandler
    implements bindings.StubControl<TraceProviderRegistry> {
  TraceProviderRegistry _impl;

  _TraceProviderRegistryStubControl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [TraceProviderRegistry impl])
      : super.fromEndpoint(endpoint, autoBegin: impl != null) {
    _impl = impl;
  }

  _TraceProviderRegistryStubControl.fromHandle(
      core.MojoHandle handle, [TraceProviderRegistry impl])
      : super.fromHandle(handle, autoBegin: impl != null) {
    _impl = impl;
  }

  _TraceProviderRegistryStubControl.unbound([this._impl]) : super.unbound();

  String get serviceName => TraceProviderRegistry.serviceName;



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
      case _traceProviderRegistryMethodRegisterTraceProviderName:
        var params = _TraceProviderRegistryRegisterTraceProviderParams.deserialize(
            message.payload);
        _impl.registerTraceProvider(params.traceProvider);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }

  TraceProviderRegistry get impl => _impl;
  set impl(TraceProviderRegistry d) {
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
    return "_TraceProviderRegistryStubControl($superString)";
  }

  int get version => 0;
}

class TraceProviderRegistryStub
    extends bindings.Stub<TraceProviderRegistry>
    implements TraceProviderRegistry,
               TraceProviderRegistryInterface,
               TraceProviderRegistryInterfaceRequest {
  TraceProviderRegistryStub.unbound([TraceProviderRegistry impl])
      : super(new _TraceProviderRegistryStubControl.unbound(impl));

  TraceProviderRegistryStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [TraceProviderRegistry impl])
      : super(new _TraceProviderRegistryStubControl.fromEndpoint(endpoint, impl));

  TraceProviderRegistryStub.fromHandle(
      core.MojoHandle handle, [TraceProviderRegistry impl])
      : super(new _TraceProviderRegistryStubControl.fromHandle(handle, impl));

  static TraceProviderRegistryStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For TraceProviderRegistryStub"));
    return new TraceProviderRegistryStub.fromEndpoint(endpoint);
  }


  void registerTraceProvider(tracing_mojom.TraceProviderInterface traceProvider) {
    return impl.registerTraceProvider(traceProvider);
  }
}



