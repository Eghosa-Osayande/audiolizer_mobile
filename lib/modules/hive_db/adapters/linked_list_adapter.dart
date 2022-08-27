import 'dart:collection';

import 'package:hive/hive.dart';

class LinkedListAdapter<T extends LinkedListEntry<T>,V extends LinkedList<T>> extends TypeAdapter<V> {
  @override
  final int typeId;

  LinkedListAdapter({required this.typeId});

  @override
  V read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    var linkedList = LinkedList<T>() as V;
    linkedList.addAll(fields[0] as List<T>);
    return linkedList;
  }

  @override
  void write(BinaryWriter writer, LinkedList<T> obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.toList());
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) => identical(this, other) || other is LinkedListAdapter<T,V> && runtimeType == other.runtimeType && typeId == other.typeId;
}
