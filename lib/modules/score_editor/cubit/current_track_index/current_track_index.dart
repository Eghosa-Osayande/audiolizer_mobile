part of 'current_track_index_cubit.dart';

class CurrentTrackIndex with EquatableMixin {
  final int index;
  final Track track;
  const CurrentTrackIndex(this.index, this.track);

  @override
  List<Object?> get props => [
        index
      ];
}
