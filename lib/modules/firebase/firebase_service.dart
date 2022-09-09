import 'package:audiolizer/firebase_options.dart';
import 'package:audiolizer/modules/app_services_controller/services_config.dart';
import 'package:audiolizer/modules/app_update/models/config.dart';
import 'package:audiolizer/modules/home/home_feed/models/home_feed_model.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:result_type/result_type.dart';

class FirebaseService {
  static FirebaseService? _instance;

  FirebaseService._();

  factory FirebaseService._create() {
    _instance ??= (AppServicesConfig.isTest) ? FirebaseService._() : FirebaseService._();
    return _instance!;
  }

  static FirebaseService get instance => FirebaseService._create();

  static Future<void> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  static late final FirebaseDatabase _firebaseDB = FirebaseDatabase.instance;

  static late final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  Future<Result<List<HomeFeedModel>, String>> getHomeFeed() async {
    final ref = _firebaseDB.ref();
    try {
      final snapshot = await ref.child('feed').get();
      if (snapshot.exists) {
        var value = snapshot.value;
        if (value != null) {
          return Success(List.from(value as List).map((e) {
            Map<String, dynamic> map = Map<String, dynamic>.from(e);
            return HomeFeedModel.fromJson(map);
          }).toList());
        } else {
          return Failure('An error occured fetching your feed');
        }
      } else {
        return Failure('An error occured fetching your feed');
      }
    } on Exception catch (e) {
      return Failure('An error occured fetching your feed');
    }
  }

  Future<void> logEvent({required String name, Map<String, dynamic>? parameters}) async {
    await FirebaseAnalytics.instance.logEvent(
      name: name,
      parameters: parameters,
    );
  }

  Future<Result<AppRemoteConfig, String>> getAppUpdate() async {
    final ref = _firebaseDB.ref();
    try {
      final snapshot = await ref.child('config').get();
      if (snapshot.exists) {
        var value = snapshot.value;
        if (value != null) {
          return Success(
            AppRemoteConfig.fromJson(
              Map<String, dynamic>.from(value as Map),
            ),
          );
        } else {
          return Failure('An error occured fetching your feed');
        }
      } else {
        return Failure('An error occured fetching your feed');
      }
    } on Exception catch (e) {
      return Failure('An error occured fetching your feed');
    }
  }
}
