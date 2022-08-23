part of 'track_cubit.dart';

class TrackState with EquatableMixin {
  final int id;
  final Track track;
  final Note? currentNote;
  const TrackState(this.id, this.track, {this.currentNote});

  factory TrackState.random(Track track,{Note? currentNote}) {
    return TrackState(
      DateTime.now().microsecondsSinceEpoch,
      track,
      currentNote: currentNote
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        id
      ];
}
