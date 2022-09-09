import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:audiolizer/modules/firebase/firebase_service.dart';
import 'package:file/memory.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';
import 'package:share_plus/share_plus.dart';
import 'package:audiolizer/modules/app_services_controller/services_config.dart';
import 'package:audiolizer/modules/models/project/project_model.dart';
import 'package:audiolizer/modules/models/score/score.dart';
import 'package:audiolizer/modules/os_path/services/path/platform_path_service.dart';
import 'package:audiolizer/modules/os_permission/services/permission/platform_permission_service.dart';
import 'package:audiolizer/modules/os_toast/services/platform_toast_service.dart';
import 'package:audiolizer/modules/project_management/repo/project_repo.dart';

class ShareProjectService {
  static ShareProjectService? _instance;

  ShareProjectService._();

  factory ShareProjectService._create() {
    if (_instance == null) {
      _instance = (AppServicesConfig.isTest) ? ShareProjectService._() : ShareProjectService._();
      _instance?._startListeningForIncomingShareIntent();
    }

    return _instance!;
  }

  static ShareProjectService get instance => ShareProjectService._create();

  final StreamController<Project> _sharedSolphaFileEventStream = StreamController.broadcast();

  Stream<Project> get sharedProjectEventStream => _sharedSolphaFileEventStream.stream;

  _startListeningForIncomingShareIntent() {
    ReceiveSharingIntent.getMediaStream().listen(_onShareIntentRecieved);
  }

  Future handleAnyInitialSharedProject() async {
    List<SharedMediaFile> result = await ReceiveSharingIntent.getInitialMedia();
    _onShareIntentRecieved(result);
  }

  void _onShareIntentRecieved(List<SharedMediaFile> value) async {
    if (value.isNotEmpty) {
      var filePath = value.first.path;
      await processFileFromPath(filePath);
    }
  }

  Future<void> processFileFromPath(String filePath) async {
    try {
      print(filePath);

      await _handleFile(File(filePath));
    } on FileSystemException catch (e) {
      print('storage permission required');
      bool hasPermission = await PlatformPermissionService.instance.handleStoragePermission();
      if (hasPermission) {
        processFileFromPath(filePath);
      } else {
        PlatformToastService.instance.showToast(msg: 'Permission not granted');
      }
    }
  }

  Future<void> _handleFile(File file) async {
    String scoreJson = await file.readAsString();

    try {
      Project importedScore = Project.fromJson(json.decode(scoreJson)).copyWith(
        updatedAt: DateTime.now(),
      );
      await ProjectRepo.instance.put(importedScore);
      _sharedSolphaFileEventStream.add(importedScore);
    } on Exception catch (e) {
      PlatformToastService.instance.showToast(msg: 'Loading file failed\nInvalidformat');
    }
  }

  Future<void> shareProject(Project project) async {
    FirebaseService.instance.logEvent(name: 'share_project');
    String shareData = json.encode(project.toJson());
    String root = await PlatformPathService.instance.getExportRootDirectory();

    File outputFile = File('$root/${project.title}.solfa');
    await outputFile.create(recursive: true);
    var result = await outputFile.writeAsString(shareData);
    Share.shareFiles([
      result.path
    ]);
  }

  Future<void> shareProjectAsMidi(Project project) async {
    var result = await project.score.commit();
    if (result?.isSuccess ?? false) {
      FirebaseService.instance.logEvent(name: 'share_midi');
      String root = await PlatformPathService.instance.getExportRootDirectory();

      File outputFile = File('$root/${project.title}_audiolizer.mid');
      await outputFile.create(recursive: true);
      var r = await outputFile.writeAsBytes(await (result!.success.readAsBytes()));
      Share.shareFiles([
        r.path
      ]);
    } else {
      PlatformToastService.instance.showToast(
        msg: 'Failed to create MIDI file because errors exist in this project',
      );
    }
  }
}
