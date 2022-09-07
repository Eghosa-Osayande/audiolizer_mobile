import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:audiolizer/modules/models/bar/bar.dart';
import 'package:audiolizer/modules/models/notes/note.dart';
import 'package:audiolizer/modules/models/project/project_model.dart';
import 'package:audiolizer/modules/models/track/track.dart';

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

  void addBarWhenEmpty() {
    // var index = track.toList().indexOf(bar);

    for (var track in project.score.tracks) {
      if (track.isEmpty) {
        track.add(
          Bar(
            createdAt: DateTime.now().toUtc(),
            //  startAt: 0,
            notes: [],
          ),
        );
      }
    }
    emit(SolfaKeyBoardInputEvent(SolfaKeyBoardInputEventName.addBar, []));
    return;
  }

  deleteBars(List<Bar> bars) {
    var prev;
    for (var bar in bars) {
      prev = bar.previous;
      bar.unlink();
    }
    emit(SolfaKeyBoardInputEvent(SolfaKeyBoardInputEventName.deleteBar, [], barToFocus: prev));
  }

  void selectAll() {
    emit(SolfaKeyBoardInputEvent(SolfaKeyBoardInputEventName.selectAll, []));
  }
}

class SolfaKeyBoardInputEvent extends Equatable {
  final SolfaKeyBoardInputEventName name;
  final List<Note> note;
  final Bar? barToFocus;
  final createdAt = DateTime.now();

  SolfaKeyBoardInputEvent(this.name, this.note, {this.barToFocus});

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
  deleteBar,
  selectAll;
}
