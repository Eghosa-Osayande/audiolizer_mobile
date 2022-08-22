part of 'note.dart';

class DurationNote extends Note with EquatableMixin {
  final DurationMarker marker;
  

  DurationNote(
    Track track, {
    required this.marker,
  }) : super._(track);

  @override
  List<Object?> get props => [
        marker
      ];

  @override
  bool? get stringify => true;

  Result<double, GenericException> combineWith(DurationNote other) {
    var result = marker.beatBetween(other.marker);
    if (result == -0.5 || result == 0) {
      return Failure(GenericException('Invalid time'));
    }
    return Success(result.abs());
  }
}
