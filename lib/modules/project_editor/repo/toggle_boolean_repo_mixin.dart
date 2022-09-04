import 'dart:async';

import 'package:hive/hive.dart';
import 'package:rxdart/rxdart.dart';
import 'package:audiolizer/modules/app_services_controller/services_config.dart';
import 'package:audiolizer/modules/models/project/project_model.dart';
import 'package:audiolizer/modules/models/score/score.dart';

class ToggleBooleanRepoMixin {

  String get boxName => '';

  Future<Box<bool>> _getBox() async => await Hive.openBox<bool>(boxName);

  listenToDatabaseChanges() async {
    _valueSubject.add((await read()));
    (await _getBox()).watch().listen((event) async {
      _valueSubject.add((await read()));
    });
  }

  final BehaviorSubject<bool> _valueSubject = BehaviorSubject();
  Stream<bool> get watchValue => _valueSubject.stream;

  Future<bool> read() async {
    var box = await _getBox();
    return box.get('key') ?? false;
  }

  Future<void> put(bool value) async {
    var box = await _getBox();
    await box.put('key', value);
  }
}
