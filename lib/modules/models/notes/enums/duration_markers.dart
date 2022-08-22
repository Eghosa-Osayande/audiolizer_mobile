
enum DurationMarker {
  seperator(0.5, '|'),
  full(0.5, ':'),
  half(0, '.'),
  quarter(-0.25, ',');

  final double value;
  final String symbol;
  const DurationMarker(this.value, this.symbol);

  double beatBetween(DurationMarker other) {
    var result = value + other.value;
    return result;
  }
}