import 'dart:async';

import 'package:hive/hive.dart';
import 'package:rxdart/rxdart.dart';
import 'package:solpha/modules/app_services_controller/services_config.dart';
import 'package:solpha/modules/models/project/project_model.dart';
import 'package:solpha/modules/models/score/score.dart';

class ToggleMetronemeRepo {
  static ToggleMetronemeRepo? _instance;

  ToggleMetronemeRepo._();

  factory ToggleMetronemeRepo._create() {
    _instance ??= (AppServicesConfig.isTest) ? ToggleMetronemeRepo._() : ToggleMetronemeRepo._();
    _instance?._listenToDatabaseChanges();
    return _instance!;
  }

  static ToggleMetronemeRepo get instance => ToggleMetronemeRepo._create();

  Future<Box<bool>> _getBox() async => await Hive.openBox<bool>('metro');

  _listenToDatabaseChanges() async {
    _projectsSubject.add((await read()));
    (await _getBox()).watch().listen((event) async {
      _projectsSubject.add((await read()));
    });
  }

  final BehaviorSubject<bool> _projectsSubject = BehaviorSubject();
  Stream<bool> get watchMetronemeEnabledValue => _projectsSubject.stream;

  Future<bool> read() async {
    var box = await _getBox();
    return box.get('key') ?? false;
  }

  Future<void> put(bool value) async {
    var box = await _getBox();
    await box.put('key', value);
  }
}
