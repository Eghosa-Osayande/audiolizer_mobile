import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:solpha/modules/models/notes/enums/duration_markers.dart';

class EnumTypeAdapter<T> extends TypeAdapter<T> {
  EnumTypeAdapter({required this.typeId, required this.values});

  @override
  final int typeId;

  final List<T> values;

  Map<String, T> get _getMap {
    Map<String, T> result = {};
    for (dynamic element in values) {
      result[element.name] = element;
    }
    return result;
  }

  @override
  T read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _getMap[(fields[0] as String)]!;
  }

  @override
  void write(BinaryWriter writer, dynamic obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) => identical(this, other) || other is EnumTypeAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}
