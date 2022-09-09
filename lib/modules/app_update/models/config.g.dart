// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppRemoteConfig _$$_AppRemoteConfigFromJson(Map<String, dynamic> json) =>
    _$_AppRemoteConfig(
      version: json['version'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
      url: json['url'] as String,
      allow: (json['allow'] as List<dynamic>).map((e) => e as int).toList(),
      semiAllow:
          (json['semiAllow'] as List<dynamic>).map((e) => e as int).toList(),
      noAllow: (json['noAllow'] as List<dynamic>).map((e) => e as int).toList(),
    );

Map<String, dynamic> _$$_AppRemoteConfigToJson(_$_AppRemoteConfig instance) =>
    <String, dynamic>{
      'version': instance.version,
      'title': instance.title,
      'body': instance.body,
      'url': instance.url,
      'allow': instance.allow,
      'semiAllow': instance.semiAllow,
      'noAllow': instance.noAllow,
    };
