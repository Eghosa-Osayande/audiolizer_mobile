// To parse this JSON data, do
//
//     final homeFeedModel = homeFeedModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'config.freezed.dart';
part 'config.g.dart';

@freezed
class AppRemoteConfig with _$AppRemoteConfig {
    const factory AppRemoteConfig({
        required int version,
        required String title,
        required String body,
        required String url,
        required List<int> allow,
        required List<int> semiAllow,
        required List<int> noAllow,
    }) = _AppRemoteConfig;

    factory AppRemoteConfig.fromJson(Map<String, dynamic> json) => _$AppRemoteConfigFromJson(json);
}
