import 'package:freezed_annotation/freezed_annotation.dart';

enum TimeSignature {
  @JsonValue(0)
  t_4_4(
    numerator: 4,
    denominator: 4,
    displayString: '4/4',
  ),
   @JsonValue(1)
  t_2_4(
    numerator: 2,
    denominator: 4,
    displayString: '2/4',
  );

  final int numerator;
  final int denominator;
  final String displayString;

  const TimeSignature({
    required this.numerator,
    required this.denominator,
    required this.displayString,
  });
}
