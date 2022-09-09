import 'package:audiolizer/modules/firebase/firebase_service.dart';
import 'package:audiolizer/modules/home/home_feed/models/home_feed_model.dart';
import 'package:audiolizer/modules/home/home_feed/repo/home_feed_repo.dart';
import 'package:result_type/result_type.dart';

class HomeFeedFireBaseDBRepo implements HomeFeedRepo {
  @override
  Future<Result<List<HomeFeedModel>, String>> getHomeFeed() async {
    return FirebaseService.instance.getHomeFeed();
  }
}
