part of 'current_track_cubit.dart';

class CurrentTrackIndex with EquatableMixin {
  final int index;
  const CurrentTrackIndex(this.index);

  @override
  List<Object?> get props => [
        index
      ];
}
