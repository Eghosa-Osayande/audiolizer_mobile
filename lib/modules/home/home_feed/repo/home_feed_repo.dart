import 'package:audiolizer/modules/app_services_controller/services_config.dart';
import 'package:audiolizer/modules/home/home_feed/models/home_feed_model.dart';
import 'package:audiolizer/modules/home/home_feed/repo/home_feed_firebase_db.dart';
import 'package:result_type/result_type.dart';

abstract class HomeFeedRepo {
  static HomeFeedRepo? _instance;

  HomeFeedRepo._();

  factory HomeFeedRepo._create() {
    _instance ??= (AppServicesConfig.isTest) ? HomeFeedFireBaseDBRepo() : HomeFeedFireBaseDBRepo();

    return _instance!;
  }

  static HomeFeedRepo get instance => HomeFeedRepo._create();

  Future<Result<List<HomeFeedModel>, String>> readAll();
}
