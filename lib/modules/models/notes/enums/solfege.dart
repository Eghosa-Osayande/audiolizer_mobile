import 'package:freezed_annotation/freezed_annotation.dart';



enum Solfege {
  //d
  @JsonValue(1)
  d(0, 'd'),
  @JsonValue(2)
  de(1, 'de'),
  @JsonValue(3)
  ra(1, 'ra'),

  //r
  @JsonValue(4)
  r(2, 'r'),
  @JsonValue(5)
  re(3, 're'),
  @JsonValue(6)
  ma(3, 'ma'),

  //m
  @JsonValue(7)
  m(4, 'm'),

  //f
  @JsonValue(8)
  f(5, 'f'),
  @JsonValue(9)
  fe(6, 'fe'),
  @JsonValue(10)
  sa(6, 'sa'),

  //s
  @JsonValue(11)
  s(7, 's'),
  @JsonValue(12)
  se(8, 'se'),
  @JsonValue(13)
  la(8, 'la'),

  //l
  @JsonValue(14)
  l(9, 'l'),
  @JsonValue(15)
  le(10, 'le'),
  @JsonValue(16)
  ta(10, 'ta'),

  //t
  @JsonValue(17)
  t(11, 't'),

  //other
  @JsonValue(18)
  silent(12, 'X'),
  @JsonValue(19)
  sustain(13, '-');

  final int offset;
  final String symbol;
  const Solfege(this.offset, this.symbol);
}
