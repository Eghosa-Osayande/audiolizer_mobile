import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:midi_util/midi_util.dart';

enum KeySignature {
  cmajor(
    accidentalCount: 0,
    accidentalMode: AccidentalMode.MAJOR,
    accidentalType: AccidentalType.SHARPS,
    midiNumber: 24,
  ), gmajor(
    accidentalCount: 1,
    accidentalMode: AccidentalMode.MAJOR,
    accidentalType: AccidentalType.SHARPS,
    midiNumber: 31,
  );

  final int accidentalCount;
  final int accidentalMode;
  final int accidentalType;
  final int midiNumber;
  const KeySignature({
    required this.accidentalCount,
    required this.accidentalType,
    required this.accidentalMode,
    required this.midiNumber,
  });
}
