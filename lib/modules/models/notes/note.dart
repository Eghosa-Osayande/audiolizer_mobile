import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:midi_util/midi_util.dart';
import 'package:result_type/result_type.dart';
import 'package:rxdart/rxdart.dart';
import 'package:audiolizer/modules/exceptions/exceptions.dart';
import 'package:audiolizer/modules/models/notes/config_notes_x.dart';
import 'package:audiolizer/modules/models/notes/enums/duration_markers.dart';
import 'package:audiolizer/modules/models/notes/enums/solfege.dart';
import 'package:audiolizer/modules/models/score/enums/key_signature.dart';
import 'package:audiolizer/modules/models/score/score.dart';
import 'package:audiolizer/modules/models/score/enums/time_signature.dart';
import 'package:audiolizer/modules/models/track/track.dart';

part 'extensions/duration_note_x.dart';
part 'extensions/music_note_x.dart';
part 'extensions/white_space_note_x.dart';

part 'note.freezed.dart';
part 'note.g.dart';

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
    double? startAtInSeconds,
  }) = MusicNote;

  @JsonSerializable(explicitToJson: true)
  factory Note.duration({
    required DurationMarker marker,
    required DateTime createdAt,
    double? startAt,
    double? endAt,
    @Default(0) double duration,
    double? startAtInSeconds,
  }) = DurationNote;

  @JsonSerializable(explicitToJson: true)
  factory Note.whiteSpace({
    required DateTime createdAt,
    double? startAt,
    double? endAt,
    @Default(0) double duration,
    double? startAtInSeconds,
  }) = WhiteSpaceNote;

  factory Note.fromJson(Map<String, dynamic> json) => _$NoteFromJson(json);

  bool get isDuration => this is DurationNote;
  bool get isMusic => this is MusicNote;

  Future<void> commit(Track track, MIDIFile midiFile, {bool isMetroneme = false}) async {
    map(
      music: (music) {
        music._commitX(track, midiFile, isMetroneme: isMetroneme);
      },
      duration: (duration) {},
      whiteSpace: (whiteSpace) {},
    );
    num bpm = track.score.bpm;
    if (startAt != null) {
      startAtInSeconds = ((60 / bpm) * (startAt!));
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
    );
  }

  @override
  List<Object?> get props => [
        createdAt
      ];
}
