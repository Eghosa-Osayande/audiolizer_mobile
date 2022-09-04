import 'dart:async';

import 'package:hive/hive.dart';
import 'package:rxdart/rxdart.dart';
import 'package:audiolizer/modules/app_services_controller/services_config.dart';
import 'package:audiolizer/modules/models/project/project_model.dart';
import 'package:audiolizer/modules/models/score/score.dart';

class VolumeNavigationRepo {
  static VolumeNavigationRepo? _instance;

  VolumeNavigationRepo._();

  factory VolumeNavigationRepo._create() {
    _instance ??= (AppServicesConfig.isTest) ? VolumeNavigationRepo._() : VolumeNavigationRepo._();
    _instance?._listenToDatabaseChanges();
    return _instance!;
  }

  static VolumeNavigationRepo get instance => VolumeNavigationRepo._create();

  Future<Box<bool>> _getBox() async => await Hive.openBox<bool>('volNav');

  _listenToDatabaseChanges() async {
    _projectsSubject.add((await read()));
    (await _getBox()).watch().listen((event) async {
      _projectsSubject.add((await read()));
    });
  }

  final BehaviorSubject<bool> _projectsSubject = BehaviorSubject();
  Stream<bool> get watchVolumeNavigation => _projectsSubject.stream;

  Future<bool> read() async {
    var box = await _getBox();
    return box.get('key') ?? false;
  }

  Future<void> put(bool value) async {
    var box = await _getBox();
    await box.put('key', value);
  }
}
