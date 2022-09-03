import 'dart:io';

import 'package:file/memory.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:midi_util/midi_util.dart';
import 'package:result_type/result_type.dart';
import 'package:solpha/modules/models/bar/bar.dart';
import 'package:solpha/modules/models/notes/enums/duration_markers.dart';
import 'package:solpha/modules/models/notes/enums/solfege.dart';
import 'package:solpha/modules/models/notes/note.dart';
import 'package:solpha/modules/models/score/enums/key_signature.dart';
import 'package:solpha/modules/models/score/enums/time_signature.dart';
import 'package:solpha/modules/models/track/enums/midi_program.dart';
import 'package:solpha/modules/models/track/track.dart';
import 'dart:collection';

part 'score.freezed.dart';
// part 'score.g.dart';

@unfreezed
class Score extends LinkedList<Track> with HiveObjectMixin, _$Score {
  Score._();

  factory Score({
    required int bpm,
    required TimeSignature timeSignature,
    required KeySignature keySignature,
    required int tonicPitchNumber,
    required String scoreTitle,
    required DateTime updatedAt,
    MIDIFile? midiFile,
  }) = _Score;

  // factory Score.fromJson(Map<String, dynamic> json) => _$ScoreFromJson(json);

  factory Score.fromJson(Map<String, dynamic> json) {
    var score = Score(
        bpm: json['bpm'] as int,
        timeSignature: TimeSignature.values[json['timeSignature'] as int],
        keySignature: KeySignature.values[json['keySignature'] as int],
        tonicPitchNumber: json['tonicPitchNumber'] as int,
        scoreTitle: json['scoreTitle'] as String,
        updatedAt: DateTime.fromMicrosecondsSinceEpoch(
          json['updatedAt'] as int,
        ));
    var tracks = (json['tracks'] as List<dynamic>).map((e) => Track.fromJson(e as Map<String, dynamic>)).toList();
    score.addAll(tracks);
    return score;
  }

  LinkedList<Track> get tracks => this;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'bpm': bpm,
        'timeSignature': timeSignature.index,
        'keySignature': keySignature.index,
        'tonicPitchNumber': tonicPitchNumber,
        'scoreTitle': scoreTitle,
        'tracks': tracks.map((track) => track.toJson()).toList(),
        'updatedAt': updatedAt.microsecondsSinceEpoch
      };

  String get updatedAtString {
    final DateFormat formatter = DateFormat.jm().add_yMd();
    return '${formatter.format(updatedAt)}';
  }

  void _resetMidiFile() {
    midiFile = MIDIFile(numTracks: 10);
  }

  int get trackBarCount {
    if (tracks.isNotEmpty) {
      return tracks.first.bars.length;
    }
    return 0;
  }

  Future<void> addMetronemeTrack(int maxBeats) async {
    var metro = Track(
      trackNumber: 7,
      program: MidiProgram.pizzicato,
      volume: 127,
      name: 'metroneme,',
    );

    List.generate(maxBeats, (index) {
      var bar = Bar(createdAt: DateTime.now(), notes: [
        DurationNote(
          marker: DurationMarker.full,
          createdAt: DateTime.now().toUtc(),
        )
      ]);

      bar.notes.add(
        MusicNote(
          solfa: Solfege.d,
          octave: 0,
          createdAt: DateTime.now().toUtc(),
        ),
      );
      bar.notes.add(
        DurationNote(
          marker: DurationMarker.full,
          createdAt: DateTime.now().toUtc(),
        ),
      );
      metro.add(bar);
    });

    metro.computeNotes();
    this.add(metro);
    await metro.commit(midiFile!, isMetroneme: true);
    metro.unlink();
  }

  Future<Result<File, Track>?> commit({bool useMetroneme = false}) async {
    _resetMidiFile();

    int maxBeats = 0;
    for (var track in tracks) {
      var result = track.computeNotes();

      if (result.isSuccess) {
        if (useMetroneme) {
          var ceil = track.trackLengthInBeats.ceil();
          print(ceil);
          maxBeats = (ceil > maxBeats) ? ceil : maxBeats;
        }

        continue;
      } else {
        return Failure(track);
      }
    }
    await addMetronemeTrack(maxBeats);

    for (var track in tracks) {
      await track.commit(midiFile!);
    }

    File outputFile = MemoryFileSystem().file('${DateTime.now().toUtc()}.mid');
    await midiFile!.writeFile(outputFile);

    return Success(outputFile);
  }
}
