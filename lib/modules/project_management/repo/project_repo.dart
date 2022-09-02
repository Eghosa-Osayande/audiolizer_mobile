import 'dart:async';

import 'package:hive/hive.dart';
import 'package:rxdart/rxdart.dart';
import 'package:solpha/modules/app_services_controller/services_config.dart';
import 'package:solpha/modules/models/project/project_model.dart';
import 'package:solpha/modules/models/score/score.dart';

class ProjectRepo {
  static ProjectRepo? _instance;

  ProjectRepo._();

  factory ProjectRepo._create() {
    _instance ??= (AppServicesConfig.isTest) ? ProjectRepo._() : ProjectRepo._();
    _instance?._listenToDatabaseChanges();
    return _instance!;
  }

  static ProjectRepo get instance => ProjectRepo._create();

  Future<Box<Project>> _getProjectsBox() async => await Hive.openBox<Project>('projectBox');

  _listenToDatabaseChanges() async {
    _projectsSubject.add((await readAll()));
    (await _getProjectsBox()).watch().listen((event) async {
      _projectsSubject.add((await readAll()));
    });
  }

  final BehaviorSubject<List<Project>> _projectsSubject = BehaviorSubject();
  Stream<List<Project>> get projectListStream => _projectsSubject.stream;

  Future<List<Project>> readAll() async {
    var box = await _getProjectsBox();
    return box.values.toList().reversed.toList()
      ..sort(
        (b, a) => a.updatedAt.compareTo(b.updatedAt),
      );
  }

  Future<Project> put(Project project) async {
    var box = await _getProjectsBox();
    await box.add(project);
    return project;
  }

  Future<void> delete(Project project) async {
    await project.delete();
  }
}
