import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:solpha/modules/models/notes/note.dart';
import 'package:solpha/modules/models/track/track.dart';
import 'package:solpha/modules/score_editor/cubit/edit_track_notes/edit_history.dart';

part 'edit_track_note_state.dart';

class EditTrackNotesCubit extends Cubit<EditTrackNotesState> {
  final Track track;

  Note? _currentNote;

  late final EditHistory _editHistory = EditHistory(track);

  EditTrackNotesCubit(this.track)
      : super(EditTrackNotesState.random(
          track,
          redoCount: 0,
          undoCount: 0,
        ));

  @override
  Future<void> close() {
    return super.close();
  }

  void addNote(Note newNote) {
    _addNote(newNote);

    _editHistory.appendUndo(EditActionPair(
      undo: () {
        _deleteNote(newNote);
      },
      redo: () {
        _addNote(newNote);
      },
    ));
  }

  void _addNote(Note newNote) {
    if (_currentNote != null) {
      _currentNote!.insertAfter(newNote);
    } else {
      track.add(newNote);
    }

    _currentNote = newNote;
    emit(EditTrackNotesState.random(
      track,
      currentNote: _currentNote,
      redoCount: _editHistory.redoCount,
      undoCount: _editHistory.undoCount,
    ));
  }

  void deleteNote([Note? note]) {
    Note? oldNote = _deleteNote(note);

    _editHistory.appendUndo(EditActionPair(
      undo: () {
        if (oldNote != null) {
          _addNote(oldNote);
        }
      },
      redo: () {
        _deleteNote(oldNote);
      },
    ));
  }

  Note? _deleteNote(Note? note) {
    if (note != null) {
      setCurrentNote(note);
    }
    if (_currentNote == null) {
      if (track.isNotEmpty) {
        _currentNote = track.last;
        emit(EditTrackNotesState.random(
          track,
          currentNote: _currentNote,
          redoCount: _editHistory.redoCount,
          undoCount: _editHistory.undoCount,
        ));
      }
    }
    var oldNote = _currentNote;
    _currentNote = _currentNote?.previous;
    oldNote?.unlink();
    emit(EditTrackNotesState.random(
      track,
      currentNote: _currentNote,
      redoCount: _editHistory.redoCount,
      undoCount: _editHistory.undoCount,
    ));
    return oldNote;
  }

  void setCurrentNote(Note note) {
    _currentNote = note;
    emit(EditTrackNotesState.random(
      track,
      currentNote: _currentNote,
      redoCount: _editHistory.redoCount,
      undoCount: _editHistory.undoCount,
    ));
  }

  undo() {
    _editHistory.undo();

    emit(EditTrackNotesState.random(
      track,
      currentNote: _currentNote,
      redoCount: _editHistory.redoCount,
      undoCount: _editHistory.undoCount,
    ));
  }

  redo() {
    _editHistory.redo();

    emit(EditTrackNotesState.random(
      track,
      currentNote: _currentNote,
      redoCount: _editHistory.redoCount,
      undoCount: _editHistory.undoCount,
    ));
  }
}
