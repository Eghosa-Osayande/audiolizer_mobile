enum MidiProgram {
  keyboard(0, "Acoustic Grand Piano"),
  guitar40(24, 'Acoustic Guitar (nylon)'),
  choirAh(52, 'Choir Aahs'),
  voiceOh(53, 'Voice Oohs'),
  trumpet(56, 'Trumpet'),
  violin(40, 'Violin'),
  cello(42, 'Cello'),
  altoSax(65, 'Alto Sax'),
  flute(73, 'Flute'),
  agogo(113, 'Agogô'),
  synthDrum(118, 'Synth Drum'),
  pizzicato(45, 'Pizzicato Strings');

  final int value;
  final String displayString;

  const MidiProgram(this.value, this.displayString);


  static Map<int, MidiProgram> get programMap => {
        MidiProgram.keyboard.value: MidiProgram.keyboard,
        MidiProgram.guitar40.value: MidiProgram.guitar40,
        MidiProgram.choirAh.value: MidiProgram.choirAh,
        MidiProgram.voiceOh.value: MidiProgram.voiceOh,
        MidiProgram.violin.value: MidiProgram.violin,
        MidiProgram.cello.value: MidiProgram.cello,
        MidiProgram.altoSax.value: MidiProgram.altoSax,
        MidiProgram.flute.value: MidiProgram.flute,
      };

  static MidiProgram getProgram(int value) {
    return programMap[value] ?? MidiProgram.keyboard;
  }
}
