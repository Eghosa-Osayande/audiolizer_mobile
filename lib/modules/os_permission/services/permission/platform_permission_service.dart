import 'dart:async';

import 'package:permission_handler/permission_handler.dart';
import 'package:audiolizer/modules/app_services_controller/services_config.dart';

class PlatformPermissionService {
  static PlatformPermissionService? _instance;

  PlatformPermissionService._();

  factory PlatformPermissionService._create() {
    _instance ??= (AppServicesConfig.isTest) ? PlatformPermissionService._() : PlatformPermissionService._();
    return _instance!;
  }

  static PlatformPermissionService get instance => PlatformPermissionService._create();

  final StreamController<int> _permissionRequestedStream = StreamController.broadcast();

  Stream<int> get permissionRequestedStream => _permissionRequestedStream.stream;

  /// requests for user's storage permission
  /// returns true if granted else false
  Future<bool> handleStoragePermission() async {
    var status = await Permission.storage.request();
    if (status.isGranted) {
      return true;
    } else if (status.isPermanentlyDenied) {
      await openAppSettings();
    }
    return false;
  }

  Stream<bool> checkPermissionStream(Permission permission) async* {
    var status = await permission.status;
    if (status.isGranted) {
      yield true;
    } else if (status.isPermanentlyDenied) {
      var result = await openAppSettings();
      yield result;
    } else {
      yield false;
    }
  }

  Future<void> request(Permission permission) async {
    var r = await Permission.storage.request();
    _permissionRequestedStream.add(DateTime.now().millisecondsSinceEpoch);
  }
}
