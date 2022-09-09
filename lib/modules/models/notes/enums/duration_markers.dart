import 'package:json_annotation/json_annotation.dart';

enum DurationMarker {
  @JsonValue(1)
  seperator(0.5, '||'),
  @JsonValue(2)
  full(0.5, ':'),
  @JsonValue(3)
  // half(0, '\u2022'),
  half(0, '.'),
  @JsonValue(4)
  quarter(-0.25, ',');

  final double value;
  final String symbol;
  const DurationMarker(this.value, this.symbol);

  double beatsBetween(DurationMarker other) {
    var result = value + other.value;
    return result;
  }
}
