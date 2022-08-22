import 'package:solpha/modules/models/score/key_signature.dart';
import 'package:solpha/modules/models/score/time_signature.dart';

class ScoreSettings {
  final int bpm;
  final TimeSignature timeSignature;
  final KeySignature keySignature;
  final int tonicPitchNumber;
  
  int? _tonicMidiNumber;

  int get tonicMidiNumber {
    _tonicMidiNumber ??= keySignature.midiNumber + ((tonicPitchNumber - 1) * 12);
    return _tonicMidiNumber!;
  }

  ScoreSettings({
    required this.bpm,
    required this.timeSignature,
    required this.keySignature,
    this.tonicPitchNumber = 4,
  });
}
