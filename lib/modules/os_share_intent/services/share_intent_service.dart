import 'dart:io';

import 'package:receive_sharing_intent/receive_sharing_intent.dart';
import 'package:solpha/modules/app_services_controller/services_config.dart';
import 'package:solpha/modules/os_permission/services/permission/platform_permission_service.dart';
import 'package:solpha/modules/os_toast/services/platform_toast_service.dart';

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

      await handleFile(File(filePath));
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

  Future<void> handleFile(File file) async {
    if (file.path.endsWith('.solpha')) {
      String scoreJson = await file.readAsString();
      print(scoreJson);
    } else {
      PlatformToastService.instance.showToast(msg: 'Invalid file format');
    }
  }
}
