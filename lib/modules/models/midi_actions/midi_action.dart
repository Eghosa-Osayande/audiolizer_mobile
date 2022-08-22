import 'package:midi_util/midi_util.dart';

abstract class MidiAction {
  void run(MIDIFile midiFile) {}
}
