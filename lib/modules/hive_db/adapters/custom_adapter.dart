import 'dart:convert' as conv;

import 'package:hive/hive.dart';



class CustomTypeAdapter<T> extends TypeAdapter<T> {
  CustomTypeAdapter({required this.typeId, required this.decode, required this.encode, });

  @override
  final int typeId;
  final T Function(dynamic value) decode;
  final dynamic Function(T obj) encode;

  @override
  T read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return decode(fields[0]);
  }

  @override
  void write(BinaryWriter writer, T obj) {
    var encodedObj = encode(obj);
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(encodedObj);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CustomTypeAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}
