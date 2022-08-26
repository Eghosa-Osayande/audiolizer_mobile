import 'package:equatable/equatable.dart';
import 'package:result_type/result_type.dart';
import 'package:solpha/modules/exceptions/exceptions.dart';
import 'package:solpha/modules/models/track/track.dart';

import 'enums/duration_markers.dart';
import 'note.dart';

class DurationNote extends Note with EquatableMixin {
  final DurationMarker marker;

  DurationNote({
    required this.marker,
  }) : super();

  @override
  List<Object?> get props => [
        marker,
        super.createdAt
      ];

  @override
  bool? get stringify => true;

  Result<double, GenericException> beatsBetween(DurationNote other) {
    var result = marker.beatsBetween(other.marker);
    if (result == -0.5 || result == 0) {
      return Failure(GenericException('Invalid time'));
    }
    return Success(result.abs());
  }

  @override
  Note makeCopy() {
    return DurationNote(marker: marker);
  }

  @override
  String displayString() {
    return marker.symbol;
  }
}
