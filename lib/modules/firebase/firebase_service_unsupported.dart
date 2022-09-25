import 'package:audiolizer/modules/app_update/models/config.dart';
import 'package:audiolizer/modules/firebase/firebase_service.dart';
import 'package:audiolizer/modules/home/home_feed/models/home_feed_model.dart';
import 'package:flutter/material.dart';
import 'package:result_type/result_type.dart';

class FirebaseServiceUnsupported implements FirebaseService {
  Future<Result<List<HomeFeedModel>, String>> getHomeFeed() async {
    return Failure('An error occured fetching your feed');
  }

  Future<void> logEvent({required String name, Map<String, dynamic>? parameters}) async {}

  RouteObserver getAnalyticsObserver() {
    return RouteObserver();
  }

  Future<Result<AppRemoteConfig, String>> getAppUpdate() async {
    return Failure('An error occured fetching your feed');
  }
}
