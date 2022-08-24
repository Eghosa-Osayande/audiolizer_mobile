part of 'edit_track_note_cubit.dart';

class EditTrackNotesState with EquatableMixin {
  final int id;
  final Track track;
  final Note? currentNote;
  const EditTrackNotesState(this.id, this.track, {this.currentNote});

  factory EditTrackNotesState.random(Track track, {Note? currentNote}) {
    return EditTrackNotesState(DateTime.now().microsecondsSinceEpoch, track, currentNote: currentNote);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        id
      ];
}
