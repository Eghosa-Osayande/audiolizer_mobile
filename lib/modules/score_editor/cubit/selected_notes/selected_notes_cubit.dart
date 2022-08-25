import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:solpha/modules/models/notes/note.dart';
import 'package:solpha/modules/models/track/track.dart';

part 'selected_notes_state.dart';

class SelectedNotesCubit extends Cubit<SelectedNotesState> {
  final Map<int, Note> selectedNotes = {};
  final Map<int, Note> _copiedNotes = {};
  Note? cursorNote;
  bool hasMovedForward = false;

  SelectedNotesCubit() : super(SelectedNotesState(false, 0));

  List<Note> get copiedNotesList {
    var result = _copiedNotes.values.toList();
    _copiedNotes.clear();
    return result;
  }

  set copiedNotesMap(Map<int, Note> cut) {
    _copiedNotes.clear();
    _copiedNotes.addAll(cut);
  }

  void _selectNote(Note note) {
    selectedNotes[note.createdAt] = note;
    bool enabled = selectedNotes.isNotEmpty;
    cursorNote = note;
    emit(SelectedNotesState(enabled, selectedNotes.length));
  }

  void toggleSelection(Note note) {
    if (selectedNotes.containsKey(note.createdAt)) {
      _deselectNote(note);
    } else {
      _selectNote(note);
    }
  }

  void _deselectNote(Note note) {
    selectedNotes.remove(note.createdAt);
    bool enabled = selectedNotes.isNotEmpty;
    emit(SelectedNotesState(enabled, selectedNotes.length));
  }

  void selectForward() {
    if (cursorNote != null) {
      if (selectedNotes.length == 1) {
        hasMovedForward = true;
        toggleSelection(cursorNote!.next!);
      } else if (!hasMovedForward) {
        var next = cursorNote!.next;
        var old = cursorNote;
        cursorNote = next;
        toggleSelection(old!);
      } else if (cursorNote!.next != null) {
        hasMovedForward = true;
        toggleSelection(cursorNote!.next!);
      }
    }
  }

  void selectBack() {
    if (cursorNote != null) {
      if (selectedNotes.length > 1 && hasMovedForward) {
        var prev = cursorNote!.previous;
        var old = cursorNote;
        cursorNote = prev;
        toggleSelection(old!);
      } else if (selectedNotes.length == 1) {
        hasMovedForward = false;
        var prev = cursorNote!.previous;

        toggleSelection(prev!);
      } else if (selectedNotes.length > 1 && !hasMovedForward) {
        hasMovedForward = false;
        var prev = cursorNote!.previous;

        toggleSelection(prev!);
      }
    }
  }

  void deselectAll() {
    selectedNotes.clear();
    cursorNote = null;
    hasMovedForward = false;
    emit(SelectedNotesState(false, 0));
  }

  void copyNotes([Track? track]) {
    _copiedNotes.clear();

    for (var note in selectedNotes.values) {
      var copied = note.makeCopy(track);
      _copiedNotes[copied.createdAt] = copied;
    }
    deselectAll();
  }

}
