enum Solfege {
  //d
  d(0, 'd'),
  de(1, 'de'),
  ra(1, 'ra'),

  //r
  r(2, 'r'),
  re(3, 're'),
  ma(3, 'ma'),

  //m
  m(4, 'm'),

  //f
  f(5, 'f'),
  fe(6, 'fe'),
  sa(6, 'sa'),

  //s
  s(7, 's'),
  se(8, 'se'),
  la(8, 'la'),

  //l
  l(9, 'l'),
  le(10, 'le'),
  ta(10, 'ta'),

  //t
  t(11, 't'),

  //other
  silent(12, 'X'),
  sustain(13, '-');

  final int offset;
  final String symbol;
  const Solfege(this.offset, this.symbol);
}

