import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:file/memory.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';
import 'package:share_plus/share_plus.dart';
import 'package:solpha/modules/app_services_controller/services_config.dart';
import 'package:solpha/modules/models/project/project_model.dart';
import 'package:solpha/modules/models/score/score.dart';
import 'package:solpha/modules/os_path/services/path/platform_path_service.dart';
import 'package:solpha/modules/os_permission/services/permission/platform_permission_service.dart';
import 'package:solpha/modules/os_toast/services/platform_toast_service.dart';
import 'package:solpha/modules/project_management/repo/project_repo.dart';

class ShareIntentService {
  static ShareIntentService? _instance;

  ShareIntentService._();

  factory ShareIntentService._create() {
    if (_instance == null) {
      _instance = (AppServicesConfig.isTest) ? ShareIntentService._() : ShareIntentService._();
      _instance?._startListeningForIncomingShareIntent();
    }

    return _instance!;
  }

  static ShareIntentService get instance => ShareIntentService._create();

  final StreamController<Project> _sharedSolphaFileEventStream = StreamController.broadcast();

  Stream<Project> get sharedSolphaFileEventStream => _sharedSolphaFileEventStream.stream;

  _startListeningForIncomingShareIntent() {
    ReceiveSharingIntent.getMediaStream().listen(_onShareIntentRecieved);
  }

  Future handleAnyInitialSharedMedia() async {
    List<SharedMediaFile> result = await ReceiveSharingIntent.getInitialMedia();
  }

  void _onShareIntentRecieved(List<SharedMediaFile> value) async {
    try {
      var filePath = value.first.path;
      print(filePath);

      await _handleFile(File(filePath));
    } on FileSystemException catch (e) {
      print('storage permission required');
      bool hasPermission = await PlatformPermissionService.instance.handleStoragePermission();
      if (hasPermission) {
        _onShareIntentRecieved(value);
      } else {
        PlatformToastService.instance.showToast(msg: 'Permission not granted');
      }
    }
  }

  Future<void> _handleFile(File file) async {
    if (file.path.endsWith('.solpha')) {
      String scoreJson = await file.readAsString();

      try {
        Project importedScore = Project.fromJson(json.decode(scoreJson));
        await ProjectRepo.instance.put(importedScore);
        _sharedSolphaFileEventStream.add(importedScore);
      } on Exception catch (e) {
        PlatformToastService.instance.showToast(msg: 'Loading file failed\nInvalidformat');
      }
    } else {
      PlatformToastService.instance.showToast(msg: 'Invalid file format');
    }
  }

  Future<void> shareProject(Project project) async {
    String shareData = json.encode(project.toJson());
    String root = await PlatformPathService.instance.getExportRootDirectory();

    File outputFile = File('$root/${project.title}.solpha');
    await outputFile.create(recursive: true);
    var result = await outputFile.writeAsString(shareData);
    Share.shareFiles([
      result.path
    ]);
  }
}
