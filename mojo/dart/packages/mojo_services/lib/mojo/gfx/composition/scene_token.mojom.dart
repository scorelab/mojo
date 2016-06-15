// WARNING: DO NOT EDIT. This file was generated by a program.
// See $MOJO_SDK/tools/bindings/mojom_bindings_generator.py.

library scene_token_mojom;
import 'package:mojo/bindings.dart' as bindings;




class SceneToken extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  int value = 0;

  SceneToken() : super(kVersions.last.size);

  SceneToken.init(
    int this.value
  ) : super(kVersions.last.size);

  static SceneToken deserialize(bindings.Message message) =>
      bindings.Struct.deserialize(decode, message);

  static SceneToken decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    SceneToken result = new SceneToken();

    var mainDataHeader = bindings.Struct.checkVersion(decoder0, kVersions);
    if (mainDataHeader.version >= 0) {
      
      result.value = decoder0.decodeUint32(8);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    const String structName = "SceneToken";
    String fieldName;
    try {
      fieldName = "value";
      encoder0.encodeUint32(value, 8);
    } on bindings.MojoCodecError catch(e) {
      bindings.Struct.fixErrorMessage(e, fieldName, structName);
      rethrow;
    }
  }

  String toString() {
    return "SceneToken("
           "value: $value" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["value"] = value;
    return map;
  }
}



