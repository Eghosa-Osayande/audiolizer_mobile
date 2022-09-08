import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'home_feed_model.freezed.dart';
part 'home_feed_model.g.dart';

@freezed
class HomeFeedModel with _$HomeFeedModel {
    const factory HomeFeedModel({
        required String title,
        required String description,
        required String url,
        required String avatar,
        required String user,
     
    }) = _HomeFeedModel;

    factory HomeFeedModel.fromJson(Map<String, dynamic> json) => _$HomeFeedModelFromJson(json);
}