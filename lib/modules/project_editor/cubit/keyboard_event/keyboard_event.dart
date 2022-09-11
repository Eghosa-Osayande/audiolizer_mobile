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

  Bar addBarUp(Bar bar) {
    var track = (bar.list as Track);
    var index = track.toList().indexOf(bar);

    for (var track in project.score.tracks) {
      Bar bar = track.last;
      if (!index.isNegative) {
        bar = track.toList()[index];
      }

      bar.insertBefore(
        Bar(
          createdAt: DateTime.now().toUtc(),
          notes: [],
        ),
      );
    }
    emit(SolfaKeyBoardInputEvent(SolfaKeyBoardInputEventName.addBar, []));
    return bar.previous!;
  }

  void duplicateBars(List<Bar> bars) {
    int? index;
    Bar? prev;
    project.score.ensureUniformTracksLength();
    for (var bar in bars) {
      index ??= bar.list!.toList().indexOf(bar);
    }
    for (Track track in project.score) {
      var target = track.toList()[index!];
      var entry = Bar.fromJson(target.toJson())..createdAt = DateTime.now();
     
      target.insertAfter(entry);
       prev ??= entry;
    }

    emit(SolfaKeyBoardInputEvent(SolfaKeyBoardInputEventName.deleteBar, [], barToFocus: prev));
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
    Bar? prev;
    int? index;
    project.score.ensureUniformTracksLength();
    for (var bar in bars) {
      index ??= bar.list!.toList().indexOf(bar);
      prev ??= bar.previous;
    }
    for (Track track in project.score) {
      track.toList()[index!].unlink();
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
