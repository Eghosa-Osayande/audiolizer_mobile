import 'dart:collection';

import 'package:result_type/result_type.dart';
import 'package:solpha/modules/exceptions/exceptions.dart';
import 'package:solpha/modules/models/midi_actions/add_key_signature.dart';
import 'package:solpha/modules/models/midi_actions/add_program_change.dart';
import 'package:solpha/modules/models/midi_actions/add_tempo.dart';
import 'package:solpha/modules/models/midi_actions/add_time_signature.dart';
import 'package:solpha/modules/models/notes/note.dart';
import 'package:solpha/modules/models/score/score.dart';

class Track extends LinkedList<Note> {
  final Score score;
  final int trackNumber;
  final int volume;
  final int program;

  Track({
    required this.score,
    required this.trackNumber,
    required this.program,
    required this.volume,
  });

  @override
  Result<bool, GenericException> add(Note entry) {
    // TODO: validate

    if (entry.list != null) {
      entry.unlink();
    }

    super.add(entry);
    return Success(true);
  }



  void computeNotes() {
    var midiFile = score.midiFile;
    var timeSignature = score.intialSettings.timeSignature;
    var keySignature = score.intialSettings.keySignature;

    AddTempo(track: this,tempo: score.intialSettings.bpm).run(midiFile);
    AddProgramChange(track: this, program: program).run(midiFile);
    AddTimeSignature(track: this, timeSignature: timeSignature).run(midiFile);
    AddKeySignature(track: this, keySignature: keySignature).run(midiFile);

    var totalBeats = fold<double>(0, (previousPosition, note) {
      return note.map<double>(
        music: (musicNote) {
          return musicNote.compute(previousPosition);
        },
        duration: (durationNote) {
          return previousPosition;
        },
      );
    });
    // print(where((n) {
    //   if (n.hasError) {
    //     print(n.errorMessage);
    //   }
    //   return n.hasError;
    // }));
    print(totalBeats);
  }
}
