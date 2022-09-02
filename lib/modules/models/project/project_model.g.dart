// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Project _$$_ProjectFromJson(Map<String, dynamic> json) => _$_Project(
      title: json['title'] as String,
      description: json['description'] as String,
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      score: Score.fromJson(json['score'] as Map<String, dynamic>),
      scoreVersions: (json['scoreVersions'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            DateTime.parse(k), Score.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$$_ProjectToJson(_$_Project instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'updatedAt': instance.updatedAt.toIso8601String(),
      'score': instance.score,
      'scoreVersions': instance.scoreVersions
          .map((k, e) => MapEntry(k.toIso8601String(), e)),
    };
