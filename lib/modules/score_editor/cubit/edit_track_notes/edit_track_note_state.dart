part of 'edit_track_note_cubit.dart';

class EditTrackNotesState with EquatableMixin {
  final int id;
  final Track track;
  final Note? currentNote;
  final int undoCount;
  final int redoCount;
  const EditTrackNotesState(this.id, this.track, {this.currentNote, required this.undoCount, required this.redoCount});

  factory EditTrackNotesState.random(
    Track track, {
    Note? currentNote,
    required int undoCount,
    required int redoCount,
  }) {
    return EditTrackNotesState(
      DateTime.now().microsecondsSinceEpoch,
      track,
      currentNote: currentNote,
      redoCount: redoCount,
      undoCount: undoCount,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        id
      ];
}
