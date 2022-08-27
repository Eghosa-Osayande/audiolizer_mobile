// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MusicNote _$$MusicNoteFromJson(Map<String, dynamic> json) => _$MusicNote(
      solfa: $enumDecode(_$SolfegeEnumMap, json['solfa']),
      octave: json['octave'] as int,
      createdAt: DateTime.parse(json['createdAt'] as String),
      startAt: (json['startAt'] as num?)?.toDouble(),
      endAt: (json['endAt'] as num?)?.toDouble(),
      duration: (json['duration'] as num?)?.toDouble() ?? 0,
      startAtInSeconds: (json['startAtInSeconds'] as num?)?.toDouble(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$MusicNoteToJson(_$MusicNote instance) =>
    <String, dynamic>{
      'solfa': _$SolfegeEnumMap[instance.solfa]!,
      'octave': instance.octave,
      'createdAt': instance.createdAt.toIso8601String(),
      'startAt': instance.startAt,
      'endAt': instance.endAt,
      'duration': instance.duration,
      'startAtInSeconds': instance.startAtInSeconds,
      'runtimeType': instance.$type,
    };

const _$SolfegeEnumMap = {
  Solfege.d: 1,
  Solfege.de: 2,
  Solfege.ra: 3,
  Solfege.r: 4,
  Solfege.re: 5,
  Solfege.ma: 6,
  Solfege.m: 7,
  Solfege.f: 8,
  Solfege.fe: 9,
  Solfege.sa: 10,
  Solfege.s: 11,
  Solfege.se: 12,
  Solfege.la: 13,
  Solfege.l: 14,
  Solfege.le: 15,
  Solfege.ta: 16,
  Solfege.t: 17,
  Solfege.silent: 18,
  Solfege.sustain: 19,
};

_$DurationNote _$$DurationNoteFromJson(Map<String, dynamic> json) =>
    _$DurationNote(
      marker: $enumDecode(_$DurationMarkerEnumMap, json['marker']),
      createdAt: DateTime.parse(json['createdAt'] as String),
      startAt: (json['startAt'] as num?)?.toDouble(),
      endAt: (json['endAt'] as num?)?.toDouble(),
      duration: (json['duration'] as num?)?.toDouble() ?? 0,
      startAtInSeconds: (json['startAtInSeconds'] as num?)?.toDouble(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$DurationNoteToJson(_$DurationNote instance) =>
    <String, dynamic>{
      'marker': _$DurationMarkerEnumMap[instance.marker]!,
      'createdAt': instance.createdAt.toIso8601String(),
      'startAt': instance.startAt,
      'endAt': instance.endAt,
      'duration': instance.duration,
      'startAtInSeconds': instance.startAtInSeconds,
      'runtimeType': instance.$type,
    };

const _$DurationMarkerEnumMap = {
  DurationMarker.seperator: 1,
  DurationMarker.full: 2,
  DurationMarker.half: 3,
  DurationMarker.quarter: 4,
};

_$WhiteSpaceNote _$$WhiteSpaceNoteFromJson(Map<String, dynamic> json) =>
    _$WhiteSpaceNote(
      createdAt: DateTime.parse(json['createdAt'] as String),
      startAt: (json['startAt'] as num?)?.toDouble(),
      endAt: (json['endAt'] as num?)?.toDouble(),
      duration: (json['duration'] as num?)?.toDouble() ?? 0,
      startAtInSeconds: (json['startAtInSeconds'] as num?)?.toDouble(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$WhiteSpaceNoteToJson(_$WhiteSpaceNote instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt.toIso8601String(),
      'startAt': instance.startAt,
      'endAt': instance.endAt,
      'duration': instance.duration,
      'startAtInSeconds': instance.startAtInSeconds,
      'runtimeType': instance.$type,
    };

_$TrackConfigNote _$$TrackConfigNoteFromJson(Map<String, dynamic> json) =>
    _$TrackConfigNote(
      json['volume'] as int,
      json['program'] as int,
      createdAt: DateTime.parse(json['createdAt'] as String),
      startAt: (json['startAt'] as num?)?.toDouble(),
      endAt: (json['endAt'] as num?)?.toDouble(),
      duration: (json['duration'] as num?)?.toDouble() ?? 0,
      startAtInSeconds: (json['startAtInSeconds'] as num?)?.toDouble(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$TrackConfigNoteToJson(_$TrackConfigNote instance) =>
    <String, dynamic>{
      'volume': instance.volume,
      'program': instance.program,
      'createdAt': instance.createdAt.toIso8601String(),
      'startAt': instance.startAt,
      'endAt': instance.endAt,
      'duration': instance.duration,
      'startAtInSeconds': instance.startAtInSeconds,
      'runtimeType': instance.$type,
    };

_$ScoreConfigNote _$$ScoreConfigNoteFromJson(Map<String, dynamic> json) =>
    _$ScoreConfigNote(
      createdAt: DateTime.parse(json['createdAt'] as String),
      bpm: json['bpm'] as int,
      timeSignature: $enumDecode(_$TimeSignatureEnumMap, json['timeSignature']),
      keySignature: $enumDecode(_$KeySignatureEnumMap, json['keySignature']),
      tonicPitchNumber: json['tonicPitchNumber'] as int,
      scoreTitle: json['scoreTitle'] as String,
      startAt: (json['startAt'] as num?)?.toDouble(),
      endAt: (json['endAt'] as num?)?.toDouble(),
      duration: (json['duration'] as num?)?.toDouble() ?? 0,
      startAtInSeconds: (json['startAtInSeconds'] as num?)?.toDouble(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ScoreConfigNoteToJson(_$ScoreConfigNote instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt.toIso8601String(),
      'bpm': instance.bpm,
      'timeSignature': _$TimeSignatureEnumMap[instance.timeSignature]!,
      'keySignature': _$KeySignatureEnumMap[instance.keySignature]!,
      'tonicPitchNumber': instance.tonicPitchNumber,
      'scoreTitle': instance.scoreTitle,
      'startAt': instance.startAt,
      'endAt': instance.endAt,
      'duration': instance.duration,
      'startAtInSeconds': instance.startAtInSeconds,
      'runtimeType': instance.$type,
    };

const _$TimeSignatureEnumMap = {
  TimeSignature.t_4_4: 0,
  TimeSignature.t_2_4: 1,
};

const _$KeySignatureEnumMap = {
  KeySignature.cmajor: 0,
  KeySignature.gmajor: 1,
};
