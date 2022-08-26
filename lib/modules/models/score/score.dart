import 'dart:io';

import 'package:file/memory.dart';
import 'package:flutter/cupertino.dart';
import 'package:midi_util/midi_util.dart';
import 'package:result_type/result_type.dart';
import 'package:solpha/modules/models/notes/config_notes.dart';
import 'package:solpha/modules/models/notes/enums/duration_markers.dart';
import 'package:solpha/modules/models/notes/enums/solfege.dart';
import 'package:solpha/modules/models/notes/note.dart';
import 'package:solpha/modules/models/track/track.dart';

class Score {
  final ScoreConfigNote intialConfigNote;

  final List<Track> tracks = [];

  MIDIFile midiFile = MIDIFile(numTracks: 10);

  void _resetMidiFile() {
    midiFile = MIDIFile(numTracks: 10);
  }

  Score({required this.intialConfigNote});

  bool createTrack({
    int program = 48,
    int volume = 100,
    int? trackNumber,
  }) {
    if (tracks.length < 10) {
      tracks.add(Track(
        intialScoreConfigNote: intialConfigNote,
        trackNumber: tracks.length,
        program: program,
        volume: volume,
      ));

      return true;
    }
    return false;
  }

  Future<Result<File, Track>?> commit() async {
    _resetMidiFile();

    for (var track in tracks) {
      
      var result = track.computeNotes();
     
      if (result.isSuccess) {
        // track.addMetronemeTrack(midiFile);
        continue;
      } else {
        return Failure(track);
      }
    }

    for (var track in tracks) {
      await track.commit(midiFile);
    }

    File outputFile = MemoryFileSystem().file('${DateTime.now().millisecondsSinceEpoch}.mid');
    await midiFile.writeFile(outputFile);
   

    return Success(outputFile);
  }
}
