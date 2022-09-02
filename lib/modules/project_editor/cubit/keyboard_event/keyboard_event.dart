import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solpha/modules/models/notes/note.dart';

class SolfaKeyBoardInputEventCubit extends Cubit<SolfaKeyBoardInputEvent?> {
  SolfaKeyBoardInputEventCubit() : super(null);

  void insertNotes(List<Note> list) {
    emit(SolfaKeyBoardInputEvent(SolfaKeyBoardInputEventName.insert, list));
  }

  void backSpace() {
      emit(SolfaKeyBoardInputEvent(SolfaKeyBoardInputEventName.delete, []));
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
  delete;
}
