// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bar.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$Bard _$$BardFromJson(Map<String, dynamic> json) => _$Bard(
      createdAt: DateTime.parse(json['createdAt'] as String),
      notes: (json['notes'] as List<dynamic>)
          .map((e) => Note.fromJson(e as Map<String, dynamic>))
          .toList(),
      lyrics: json['lyrics'] as String? ?? '',
      startAt: (json['startAt'] as num?)?.toDouble(),
      endAt: (json['endAt'] as num?)?.toDouble(),
      duration: (json['duration'] as num?)?.toDouble() ?? 0,
    )
      ..errorObj = json['errorObj'] == null
          ? null
          : Note.fromJson(json['errorObj'] as Map<String, dynamic>)
      ..errorIndex = json['errorIndex'] as int?
      ..errorMessage = json['errorMessage'] as String;

Map<String, dynamic> _$$BardToJson(_$Bard instance) => <String, dynamic>{
      'errorObj': instance.errorObj?.toJson(),
      'errorIndex': instance.errorIndex,
      'errorMessage': instance.errorMessage,
      'createdAt': instance.createdAt.toIso8601String(),
      'notes': instance.notes.map((e) => e.toJson()).toList(),
      'lyrics': instance.lyrics,
      'startAt': instance.startAt,
      'endAt': instance.endAt,
      'duration': instance.duration,
    };
