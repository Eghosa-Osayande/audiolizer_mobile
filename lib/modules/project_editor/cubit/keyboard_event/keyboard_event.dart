import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solpha/modules/models/bar/bar.dart';
import 'package:solpha/modules/models/notes/note.dart';
import 'package:solpha/modules/models/project/project_model.dart';
import 'package:solpha/modules/models/track/track.dart';

class SolfaKeyBoardInputEventCubit extends Cubit<SolfaKeyBoardInputEvent?> {
  final Project project;
  SolfaKeyBoardInputEventCubit(this.project) : super(null);

  void insertNotes(List<Note> list) {
    emit(SolfaKeyBoardInputEvent(SolfaKeyBoardInputEventName.insert, list));
  }

  void backSpace() {
    emit(SolfaKeyBoardInputEvent(SolfaKeyBoardInputEventName.delete, []));
  }

  Bar addBar(Bar bar) {
    var track = (bar.list as Track);
    var index = track.toList().indexOf(bar);

    for (var track in project.score.tracks) {
      Bar bar = track.last;
      if (!index.isNegative) {
        bar = track.toList()[index];
      }

      bar.insertAfter(
        Bar(
          createdAt: DateTime.now().toUtc(),
          notes: [],
        ),
      );
    }
     emit(SolfaKeyBoardInputEvent(SolfaKeyBoardInputEventName.addBar, []));
    return bar.next!;
  }

  deleteBars(List<Bar> bars) {
    for (var bar in bars) {
      bar.unlink();
    }
     emit(SolfaKeyBoardInputEvent(SolfaKeyBoardInputEventName.deleteBar, []));
  }
}

class SolfaKeyBoardInputEvent extends Equatable {
  final SolfaKeyBoardInputEventName name;
  final List<Note> note;
  final createdAt = DateTime.now();

  SolfaKeyBoardInputEvent(this.name, this.note);

  @override
  // TODO: implement props
  List<Object?> get props => [
        createdAt
      ];
}

enum SolfaKeyBoardInputEventName {
  insert,
  delete,
  addBar,
  deleteBar;
}
