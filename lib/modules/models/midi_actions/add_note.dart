import 'package:midi_util/src/midi_file.dart';
import 'package:solpha/modules/exceptions/exceptions.dart';
import 'package:solpha/modules/models/midi_actions/midi_action.dart';
import 'package:solpha/modules/models/notes/music_note.dart';
import 'package:solpha/modules/models/notes/note.dart';

class AddNote implements MidiAction {
  final MusicNote note;
  const AddNote(this.note);
  @override
  void run(MIDIFile midiFile) {
    if (note.startAt == null) {
      note.setError(GenericException('Compute this note'));
      return;
    }
    if (note.isSustained) {
      return;
    }

    var duration = note.duration;

    var track = note.track;
    var position = note.startAt!;
    var pitch = note.computeMidiNoteNumber();
    print([
      note.solfa.symbol + '${note.octave}',
      position,
      duration
    ]);
    midiFile.addNote(
      track: track.trackNumber,
      channel: track.trackNumber,
      pitch: note.isSilent ? 0 : pitch,
      time: position,
      duration: duration,
      volume: note.isSilent ? 0 : (note.volume ?? track.volume),
    );
  }
}
