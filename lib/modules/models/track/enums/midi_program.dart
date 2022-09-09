enum MidiProgram {
  keyboard(0, "Acoustic Grand Piano"),

  guitar40(24, 'Acoustic Guitar (nylon)'),
  choirAh(52, 'Choir Aahs'),
  voiceOh(53, 'Voice Oohs'),
  trumpet(56, 'Trumpet'),
  violin(40, 'Violin'),
  cello(42, 'Cello'),
  pizzicato(45, 'Pizzicato Strings'),
  altoSax(65, 'Alto Sax'),
  flute(73, 'Flute'),
  agogo(113, 'Agogô'),
  synthDrum(118, 'Synth Drum');

  final int value;
  final String displayString;
  const MidiProgram(this.value, this.displayString);
}
