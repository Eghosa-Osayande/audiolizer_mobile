part of '../note.dart';

extension DurationNoteX on DurationNote {
  Result<double, GenericException> beatsBetween(DurationNote other) {
    var result = marker.beatsBetween(other.marker);
    if (result == -0.5 || result == 0) {
      return Failure(GenericException('Invalid time'));
    }
    return Success(result.abs());
  }

  Note _makeCopyX() {
    return DurationNote(marker: marker, createdAt: DateTime.now().toUtc());
  }

  String _displayStringX() {
    return marker.symbol;
  }

 
}
