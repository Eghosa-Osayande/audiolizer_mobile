import 'dart:async';
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:solpha/modules/models/notes/note.dart';
import 'package:solpha/modules/models/track/track.dart';

class EditHistory {
  final Track track;
  

  final List<EditActionPair> _redoList = [];
  final List<EditActionPair> _undoList = [];

  int get undoCount => _undoList.length;
  int get redoCount => _redoList.length;

  EditHistory(this.track);

  appendUndo(EditActionPair event) {
    _redoList.clear();
    _undoList.add(event);
  }

  undo() {
    if (_undoList.isNotEmpty) {
      _undoList.last.undo();
      var last = _undoList.removeLast();
      _redoList.add(
        last,
      );

   
    }
  }

  redo() {
    if (_redoList.isNotEmpty) {
      _redoList.last.redo();
      var last = _redoList.removeLast();
      _undoList.add(
        last,
      );

     
    }
  }
}

class EditActionPair {
  final VoidCallback undo;
  final VoidCallback redo;

  const EditActionPair({
    required this.undo,
    required this.redo,
  });
}
