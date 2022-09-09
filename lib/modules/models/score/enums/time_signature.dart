import 'package:freezed_annotation/freezed_annotation.dart';

enum TimeSignature {
  t_4_4(
    numerator: 4,
    denominator: 4,
    displayString: '4/4',
  ),
  t_3_4(
    numerator: 3,
    denominator: 4,
    displayString: '3/4',
  ),
  t_2_4(
    numerator: 2,
    denominator: 4,
    displayString: '2/4',
  ),
  t_6_8(
    numerator: 6,
    denominator: 8,
    displayString: '6/8',
  ),
  t_9_8(
    numerator: 9,
    denominator: 8,
    displayString: '9/8',
  ),
  t_12_8(
    numerator: 12,
    denominator: 8,
    displayString: '12/8',
  ),
  t_7_8(
    numerator: 7,
    denominator: 8,
    displayString: '7/8',
  ),
  t_5_4(
    numerator: 5,
    denominator: 4,
    displayString: '5/4',
  ),
  t_11_4(
    numerator: 11,
    denominator: 4,
    displayString: '11/4',
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
