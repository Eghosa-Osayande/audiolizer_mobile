import 'package:audiolizer/modules/home/home_feed/repo/home_feed_repo.dart';
import 'package:audiolizer/modules/home/home_feed/models/home_feed_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:result_type/result_type.dart';

class HomeFeedCubit extends Cubit<Result<List<HomeFeedModel>, String>?> {

  HomeFeedCubit() : super(null);

  Future<void> loadFeed() async {
    var result = await HomeFeedRepo.instance.readAll();
    emit(result);
  }
}
