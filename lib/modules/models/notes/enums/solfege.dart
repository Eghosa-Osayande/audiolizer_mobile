enum Solfege {
  //d
  doh(0, 'd'),
  de(1, 'de'),
  ra(1, 'rah'),

  //r
  ray(2, 'r'),
  re(3, 're'),
  mah(3, 'ma'),

  //m
  me(4, 'm'),

  //f
  fah(5, 'f'),
  fe(6, 'fe'),
  sol(6, 'sol'),

  //s
  soh(7, 's'),
  se(8, 'se'),
  lay(8, 'lay'),

  //l
  lah(9, 'l'),
  le(10, 'le'),
  tay(10, 'tay'),

  //t
  ti(11, 't'),

  //other
  silent(12, 'x'),
  sustain(13, '-');

  final int offset;
  final String symbol;
  const Solfege(this.offset, this.symbol);
}
