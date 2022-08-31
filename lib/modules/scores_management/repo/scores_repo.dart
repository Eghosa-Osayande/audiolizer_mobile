import 'dart:async';

import 'package:hive/hive.dart';
import 'package:rxdart/rxdart.dart';
import 'package:solpha/modules/app_services_controller/services_config.dart';
import 'package:solpha/modules/models/score/score.dart';

class ScoresRepo {
  static ScoresRepo? _instance;

  ScoresRepo._();

  factory ScoresRepo._create() {
    _instance ??= (AppServicesConfig.isTest) ? ScoresRepo._() : ScoresRepo._();
    _instance?._listenToDatabaseChanges();
    return _instance!;
  }

  static ScoresRepo get instance => ScoresRepo._create();

  Future<Box<Score>> _getScoresBox() async => await Hive.openBox<Score>('scoresBox');

  _listenToDatabaseChanges() async {
    _scoresSubject.add((await readAll()));
    (await _getScoresBox()).watch().listen((event) async {
      _scoresSubject.add((await readAll()));
    });
  }

  final BehaviorSubject<List<Score>> _scoresSubject = BehaviorSubject();
  Stream<List<Score>> get scoreListStream => _scoresSubject.stream;

  Future<List<Score>> readAll() async {
    var box = await _getScoresBox();
    return box.values.toList().reversed.toList()..sort((b, a) => a.updatedAt.compareTo(b.updatedAt),);
  }

  Future<Score> put(Score score) async {
    var box = await _getScoresBox();
    await box.add(score);
    return score;
  }
}
