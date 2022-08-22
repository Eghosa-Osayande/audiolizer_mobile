enum TimeSignature {
  t_4_4(numerator: 4,denominator: 4);

  final int numerator;
  final int denominator;

  const TimeSignature({
    required this.numerator,
    required this.denominator,
  });
}
