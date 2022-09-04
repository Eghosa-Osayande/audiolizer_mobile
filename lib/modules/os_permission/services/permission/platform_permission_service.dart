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
}
