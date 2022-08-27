import 'dart:convert' as conv;

import 'package:hive/hive.dart';

class FreezedTypeAdapter<T> extends TypeAdapter<T> {

  FreezedTypeAdapter({required this.typeId, required this.createObject});

  @override
  final int  typeId;
  final T Function(dynamic json) createObject;

  @override
  T read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    var jsonMap = conv.json.decode(fields[0]);

    return createObject(jsonMap);
  }

  @override
  void write(BinaryWriter writer, dynamic obj) {
    assert(obj is T);
    String jsonString = conv.json.encode(obj.toJson());
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(jsonString);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) => identical(this, other) || other is FreezedTypeAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}
