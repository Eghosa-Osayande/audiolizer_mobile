import 'dart:io';
import 'dart:math' as math;

import 'package:file/memory.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:midi_util/midi_util.dart';
import 'package:result_type/result_type.dart';
import 'package:audiolizer/modules/models/bar/bar.dart';
import 'package:audiolizer/modules/models/notes/enums/duration_markers.dart';
import 'package:audiolizer/modules/models/notes/enums/solfege.dart';
import 'package:audiolizer/modules/models/notes/note.dart';
import 'package:audiolizer/modules/models/score/enums/key_signature.dart';
import 'package:audiolizer/modules/models/score/enums/time_signature.dart';
import 'package:audiolizer/modules/models/track/enums/midi_program.dart';
import 'package:audiolizer/modules/models/track/track.dart';
import 'dart:collection';

part 'score.freezed.dart';
// part 'score.g.dart';

@unfreezed
class Score extends LinkedList<Track> with HiveObjectMixin, _$Score, ErrorObjectMixin<Track> {
  Score._();

  factory Score({
    required int bpm,
    required TimeSignature timeSignature,
    required KeySignature keySignature,
    required int tonicPitchNumber,
    required String scoreTitle,
    required DateTime updatedAt,
    Map<int, int>? timeBarIndexMap,
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

  int ensureUniformTracksLength() {
    List<int> trackLengths = this.map((track) => track.length).toList();

    var max = [
      1,
      ...trackLengths
    ].reduce(math.max);

    for (var track in this) {
      var trackLength = track.length;
      if (trackLength < max) {
        List.generate(
          max - trackLength,
          (index) => track.add(
            Bar(
              createdAt: DateTime.now().toUtc(),
              notes: [],
            ),
          ),
        );
      }
    }
    return max;
  }

  List<List<Bar>> getBarGroups() {
    var tracksLength = ensureUniformTracksLength();
    var trackList = tracks.toList();
    var barGroups = List.generate(
      tracksLength,
      (barIndex) {
        List<Bar> barGroup = trackList.map((track) => track.bars.toList()[barIndex]).toList();

        return barGroup;
      },
    );
    return barGroups;
  }

  void _resetMidiFile() {
    midiFile = MIDIFile(numTracks: 11);
  }

  int get trackBarCount {
    if (tracks.isNotEmpty) {
      return tracks.first.bars.length;
    }
    return 0;
  }

  Future<void> addMetronemeTrack(int maxBeats) async {
    var metro = Track(
      trackNumber: 10,
      program: MidiProgram.pizzicato,
      volume: 127,
      name: 'metroneme',
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

    errorObj = null;

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
        errorObj = track;
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

  Future<Result<CommitSingleBarSuccess, Track>?> commitSingleBar(
    Bar bar,
    int barGroupIndex, {
    bool useMetroneme = false,
  }) async {
    var file = await commit(useMetroneme: useMetroneme);
    if (file?.isSuccess ?? false) {
      if (tracks.isNotEmpty) {
        double startAtInSeconds = tracks.first.bars.toList()[barGroupIndex].notes.first.startAtInSeconds!;
        return Success(CommitSingleBarSuccess(file!.success, startAtInSeconds));
      }
    }

    return file != null ? Failure(file.failure) : null;
  }
}

class CommitSingleBarSuccess {
  final double startAt;
  final File file;
  const CommitSingleBarSuccess(this.file, this.startAt);
}
