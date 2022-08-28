import 'package:hive/hive.dart';
import 'package:solpha/modules/models/score/score.dart';

final scoreRepo = ScoresRepo();

class ScoresRepo {
  Future<Box<Score>> getScoresBox() async => await Hive.openBox<Score>('scoresBox');

  Future<List<Score>> fetchAllScores() async {
    var box = await getScoresBox();
    return box.values.toList().reversed.toList();
  }

  Future<Score> addNewScore(Score score) async {
    var box = await getScoresBox();
    await box.add(score);
    return score;
  }
}
