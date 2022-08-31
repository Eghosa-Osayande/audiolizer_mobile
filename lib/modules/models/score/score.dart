import 'dart:io';

import 'package:file/memory.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:midi_util/midi_util.dart';
import 'package:result_type/result_type.dart';
import 'package:solpha/modules/models/notes/note.dart';
import 'package:solpha/modules/models/track/track.dart';

part 'score.freezed.dart';
// part 'score.g.dart';



@unfreezed
class Score extends HiveObject with _$Score {
  Score._();

  factory Score({
    required ScoreConfigNote intialConfigNote,
    required List<Track> tracks,
    required MIDIFile midiFile,
  }) = _Score;

  // factory Score.fromJson(Map<String, dynamic> json) => _$ScoreFromJson(json);

  factory Score.fromJson(Map<String, dynamic> json) {
    return Score(
      intialConfigNote: ScoreConfigNote.fromJson(json['intialConfigNote'] as Map<String, dynamic>),
      tracks: (json['tracks'] as List<dynamic>).map((e) => Track.fromJson(e as Map<String, dynamic>)).toList(),
      midiFile: MIDIFile(numTracks: 10),
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'intialConfigNote': intialConfigNote.toJson(),
        'tracks': tracks.map((track) => track.toJson()).toList(),
        'midiFile': '',
      };

  void _resetMidiFile() {
    midiFile = MIDIFile(numTracks: 10);
  }

  int get trackBarCount {
    if (tracks.isNotEmpty) {
      return tracks.first.bars.length;
    }
    return 0;
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

    File outputFile = MemoryFileSystem().file('${DateTime.now().toUtc()}.mid');
    await midiFile.writeFile(outputFile);

    return Success(outputFile);
  }
}
