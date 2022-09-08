import 'package:audiolizer/modules/firebase/firebase_service.dart';
import 'package:audiolizer/modules/home/home_feed/models/home_feed_model.dart';
import 'package:audiolizer/modules/home/home_feed/repo/home_feed_repo.dart';
import 'package:result_type/result_type.dart';

class HomeFeedFireBaseDBRepo implements HomeFeedRepo {
  @override
  Future<Result<List<HomeFeedModel>, String>> readAll() async {
    final ref = FirebaseService.instance.firebaseDB.ref();
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
}
