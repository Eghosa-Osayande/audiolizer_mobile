import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:midi_util/midi_util.dart';

enum KeySignature {
  c(
    accidentalCount: 0,
    accidentalMode: AccidentalMode.MAJOR,
    accidentalType: AccidentalType.SHARPS,
    midiNumber: 24,
    displayString: 'C',
  ),

  cs(
    accidentalCount: 1,
    accidentalMode: AccidentalMode.MAJOR,
    accidentalType: AccidentalType.SHARPS,
    midiNumber: 25,
    displayString: 'C#/Db',
  ),
  d(
    accidentalCount: 0,
    accidentalMode: AccidentalMode.MAJOR,
    accidentalType: AccidentalType.SHARPS,
    midiNumber: 26,
    displayString: 'D',
  ),

  ds(
    accidentalCount: 1,
    accidentalMode: AccidentalMode.MAJOR,
    accidentalType: AccidentalType.SHARPS,
    midiNumber: 27,
    displayString: 'D#/Eb',
  ),
  e(
    accidentalCount: 0,
    accidentalMode: AccidentalMode.MAJOR,
    accidentalType: AccidentalType.SHARPS,
    midiNumber: 28,
    displayString: 'E',
  ),

  f(
    accidentalCount: 1,
    accidentalMode: AccidentalMode.MAJOR,
    accidentalType: AccidentalType.SHARPS,
    midiNumber: 29,
    displayString: 'F',
  ),
  fs(
    accidentalCount: 0,
    accidentalMode: AccidentalMode.MAJOR,
    accidentalType: AccidentalType.SHARPS,
    midiNumber: 30,
    displayString: 'F#/Gb',
  ),

  g(
    accidentalCount: 1,
    accidentalMode: AccidentalMode.MAJOR,
    accidentalType: AccidentalType.SHARPS,
    midiNumber: 31,
    displayString: 'G',
  ),
  gs(
    accidentalCount: 0,
    accidentalMode: AccidentalMode.MAJOR,
    accidentalType: AccidentalType.SHARPS,
    midiNumber: 32,
    displayString: 'G#/Ab',
  ),

  a(
    accidentalCount: 1,
    accidentalMode: AccidentalMode.MAJOR,
    accidentalType: AccidentalType.SHARPS,
    midiNumber: 33,
    displayString: 'A',
  ),
  aS(
    accidentalCount: 1,
    accidentalMode: AccidentalMode.MAJOR,
    accidentalType: AccidentalType.SHARPS,
    midiNumber: 34,
    displayString: 'A#/Bb',
  ),
  b(
    accidentalCount: 1,
    accidentalMode: AccidentalMode.MAJOR,
    accidentalType: AccidentalType.SHARPS,
    midiNumber: 35,
    displayString: 'B',
  );

  final int accidentalCount;
  final int accidentalMode;
  final int accidentalType;
  final int midiNumber;
  final String displayString;
  const KeySignature({
    required this.accidentalCount,
    required this.accidentalType,
    required this.accidentalMode,
    required this.midiNumber,
    required this.displayString,
  });
}
