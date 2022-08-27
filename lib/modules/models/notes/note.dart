import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:midi_util/midi_util.dart';
import 'package:result_type/result_type.dart';
import 'package:rxdart/rxdart.dart';
import 'package:solpha/modules/exceptions/exceptions.dart';
import 'package:solpha/modules/models/notes/config_notes_x.dart';
import 'package:solpha/modules/models/notes/enums/duration_markers.dart';
import 'package:solpha/modules/models/notes/enums/solfege.dart';
import 'package:solpha/modules/models/score/key_signature.dart';
import 'package:solpha/modules/models/score/time_signature.dart';
import 'package:solpha/modules/models/track/track.dart';

part 'duration_note_x.dart';
part 'music_note_x.dart';
part 'score_config_note.dart';
part 'track_config_note.dart';
part 'white_space_note.dart';

part 'note.freezed.dart';
part 'note.g.dart';

// this.map(
//       music: (music) {},
//       duration: (duration) {},
//       whiteSpace: (whiteSpace) {},
//       trackConfig: (trackConfig) {},
//       scoreConfig: (scoreConfig) {},
//     );

@unfreezed
abstract class Note with _$Note, EquatableMixin {
  @JsonSerializable(explicitToJson: true)
  const Note._();
  @JsonSerializable(explicitToJson: true)
  factory Note.music({
    required Solfege solfa,
    required int octave,
    required DateTime createdAt,
    double? startAt,
    double? endAt,
    @Default(0) double duration,
    @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
    @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
    double? startAtInSeconds,
  }) = MusicNote;
  @JsonSerializable(explicitToJson: true)
  factory Note.duration({
    required DurationMarker marker,
    required DateTime createdAt,
    double? startAt,
    double? endAt,
    @Default(0) double duration,
    @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
    @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
    double? startAtInSeconds,
  }) = DurationNote;
  @JsonSerializable(explicitToJson: true)
  factory Note.whiteSpace({
    required DateTime createdAt,
    double? startAt,
    double? endAt,
    @Default(0) double duration,
    @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
    @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
    double? startAtInSeconds,
  }) = WhiteSpaceNote;
  @JsonSerializable(explicitToJson: true)
  factory Note.trackConfig(
    int volume,
    int program, {
      required DateTime createdAt,
    double? startAt,
    double? endAt,
    @Default(0) double duration,
    @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
    @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
    double? startAtInSeconds,
  }) = TrackConfigNote;
  @JsonSerializable(explicitToJson: true)
  factory Note.scoreConfig({
    required DateTime createdAt,
    required int bpm,
    required TimeSignature timeSignature,
    required KeySignature keySignature,
    required int tonicPitchNumber,
    required String scoreTitle,
    double? startAt,
    double? endAt,
    @Default(0) double duration,
    @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
    @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
    double? startAtInSeconds,
  }) = ScoreConfigNote;

  factory Note.fromJson(Map<String, dynamic> json) => _$NoteFromJson(json);

  bool get isDuration => this is DurationNote;
  bool get isMusic => this is MusicNote;

  Future<void> commit(
    Track track,
    MIDIFile midiFile,
  ) async {
    map(
      music: (music) {
        music
          .._commitX(track, midiFile)
          .._commit();
      },
      duration: (duration) {
        duration._commit();
      },
      whiteSpace: (whiteSpace) {
        whiteSpace._commit();
      },
      trackConfig: (trackConfig) {
        trackConfig
          .._commitX(track, midiFile)
          .._commit();
      },
      scoreConfig: (scoreConfig) {
        scoreConfig
          .._commitX(track, midiFile)
          .._commit();
      },
    );
  }

  void _commit() {
    num bpm = intialScoreConfigNote!.bpm;
    if (startAt != null) {
      startAtInSeconds = (60 / bpm) * (startAt!);
    }
  }

  Note makeCopy() {
    return map<Note>(
      music: (music) {
        return music._makeCopyX();
      },
      duration: (duration) {
        return duration._makeCopyX();
      },
      whiteSpace: (whiteSpace) {
        return whiteSpace._makeCopyX();
      },
      trackConfig: (trackConfig) {
        return trackConfig._makeCopyX();
      },
      scoreConfig: (scoreConfig) {
        return scoreConfig._makeCopyX();
      },
    );
  }

  String displayString() {
    return map<String>(
      music: (music) {
        return music._displayStringX();
      },
      duration: (duration) {
        return duration._displayStringX();
      },
      whiteSpace: (whiteSpace) {
        return whiteSpace._displayStringX();
      },
      trackConfig: (trackConfig) {
        return trackConfig._displayStringX();
      },
      scoreConfig: (scoreConfig) {
        return scoreConfig._displayStringX();
      },
    );
  }

  @override
  List<Object?> get props =>[createdAt];
}
