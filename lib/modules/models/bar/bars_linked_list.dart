import 'dart:collection';

import 'package:hive/hive.dart';
import 'package:solpha/modules/hive_db/util/hive_adapter_ids.dart';
import 'package:solpha/modules/models/bar/bar.dart';

class BarsLinkedlist extends LinkedList<Bar> {
   BarsLinkedlist([List<Bar> value=const[]]) {
    clear();
    addAll(value);
  }
}