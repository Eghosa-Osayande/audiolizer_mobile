import 'dart:collection';
import 'dart:io';

import 'package:file/memory.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:midi_util/midi_util.dart';
import 'package:result_type/result_type.dart';
import 'package:solpha/modules/hive_db/util/hive_adapter_ids.dart';
import 'package:solpha/modules/models/bar/bar.dart';
import 'package:solpha/modules/models/notes/config_notes_x.dart';
import 'package:solpha/modules/models/notes/enums/duration_markers.dart';
import 'package:solpha/modules/models/notes/enums/solfege.dart';
import 'package:solpha/modules/models/notes/note.dart';
import 'package:solpha/modules/models/bar/bars_linked_list.dart';
import 'package:solpha/modules/models/track/track.dart';

part 'score.freezed.dart';

part 'score.g.dart';

String midifileToJson(MIDIFile value) {
  return '';
}

MIDIFile midifilefromJson(List<Bar> value) {
  return MIDIFile(numTracks: 10);
}

@unfreezed
class Score with _$Score {
  @JsonSerializable(explicitToJson: true)
  Score._();
  @JsonSerializable(explicitToJson: true)
  // @HiveType(typeId: AppHiveIds.score, adapterName: 'ScoreModelAdapter')
  factory Score({
    // @HiveField(0) 
    required ScoreConfigNote intialConfigNote,
    // @HiveField(1)
    required List<Track> tracks,
    @JsonKey(toJson: midifileToJson, fromJson: midifilefromJson) required MIDIFile midiFile,
  }) = _Score;

  factory Score.fromJson(Map<String, dynamic> json) => _$ScoreFromJson(json);

  void _resetMidiFile() {
    midiFile = MIDIFile(numTracks: 10);
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
