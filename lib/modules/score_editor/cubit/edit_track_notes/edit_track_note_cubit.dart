import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:solpha/modules/models/notes/decoration_notes.dart';
import 'package:solpha/modules/models/notes/note.dart';
import 'package:solpha/modules/models/track/track.dart';
import 'package:solpha/modules/score_editor/ui/widgets/keyboard/note_key_models.dart';
import 'package:solpha/modules/score_editor/ui/widgets/keyboard/solfa_keyboard.dart';

part 'edit_track_note_state.dart';

class EditTrackNotesCubit extends Cubit<EditTrackNotesState> {
  final Track track;

  EditTrackNotesCubit(this.track) : super(EditTrackNotesState.random(track));

  Note? _currentNote;

  void addMusicNote(MusicNoteButton data) {
    var newNote = Note.music(track, solfa: data.solfa, octave: data.octave);
    if (_currentNote != null) {
      _currentNote!.insertAfter(newNote);
    } else {
      track.add(newNote);
    }
    print(track.length);
    _currentNote = newNote;

    emit(EditTrackNotesState.random(track, currentNote: _currentNote));
  }

  void addDurationNote(DurationNoteButton data) {
    var newNote = Note.duration(track, marker: data.marker);
    if (_currentNote != null) {
      _currentNote!.insertAfter(newNote);
    } else {
      track.add(newNote);
    }

    _currentNote = newNote;
    emit(EditTrackNotesState.random(track, currentNote: _currentNote));
  }

  void deleteNote() {
    if (_currentNote == null) {
      if (track.isNotEmpty) {
        _currentNote = track.last;
        emit(EditTrackNotesState.random(track, currentNote: _currentNote));
      }
    }
    var oldNote = _currentNote;
    _currentNote = _currentNote?.previous;
    oldNote?.unlink();

    emit(EditTrackNotesState.random(track, currentNote: _currentNote));
  }

  void addSpace() {
    var newNote = SpacingNote(track, NoteSpacing.whiteSpace);
    if (_currentNote != null) {
      _currentNote!.insertAfter(newNote);
    } else {
      track.add(newNote);
    }

    _currentNote = newNote;
    emit(EditTrackNotesState.random(track, currentNote: _currentNote));
  }

  void setCurrentNote(Note note) {
    _currentNote = note;
    emit(EditTrackNotesState.random(track, currentNote: _currentNote));
  }

  void addNewLine() {
    var newNote = SpacingNote(track, NoteSpacing.newLine);
    if (_currentNote != null) {
      _currentNote!.insertAfter(newNote);
    } else {
      track.add(newNote);
    }

    _currentNote = newNote;
    emit(EditTrackNotesState.random(track, currentNote: _currentNote));
  }
}
