// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bar.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$Bard _$$BardFromJson(Map<String, dynamic> json) => _$Bard(
      createdAt: DateTime.parse(json['createdAt'] as String),
      solfaEditingController: solfaEditingControllerFromJson(
          json['solfaEditingController'] as List<Note>),
      lyrics: json['lyrics'] as String? ?? '',
      startAt: (json['startAt'] as num?)?.toDouble(),
      endAt: (json['endAt'] as num?)?.toDouble(),
      duration: (json['duration'] as num?)?.toDouble() ?? 0,
      intialScoreConfigNote: json['intialScoreConfigNote'] == null
          ? null
          : ScoreConfigNote.fromJson(
              json['intialScoreConfigNote'] as Map<String, dynamic>),
      intialTrackConfigNote: json['intialTrackConfigNote'] == null
          ? null
          : TrackConfigNote.fromJson(
              json['intialTrackConfigNote'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$BardToJson(_$Bard instance) => <String, dynamic>{
      'createdAt': instance.createdAt.toIso8601String(),
      'solfaEditingController':
          solfaEditingControllerToJson(instance.solfaEditingController),
      'lyrics': instance.lyrics,
      'startAt': instance.startAt,
      'endAt': instance.endAt,
      'duration': instance.duration,
      'intialScoreConfigNote': instance.intialScoreConfigNote?.toJson(),
      'intialTrackConfigNote': instance.intialTrackConfigNote?.toJson(),
    };
