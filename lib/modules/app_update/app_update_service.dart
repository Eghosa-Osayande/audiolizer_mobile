import 'package:audiolizer/modules/app/ui/app.dart';
import 'package:audiolizer/modules/app_services_controller/services_config.dart';
import 'package:audiolizer/modules/app_update/models/config.dart';
import 'package:audiolizer/modules/firebase/firebase_service.dart';
import 'package:audiolizer/modules/home/home_feed/services/webview_services.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class AppUpdateService {
  int get version => 1;
  static AppUpdateService? _instance;

  AppUpdateService._();

  factory AppUpdateService._create() {
    _instance ??= (AppServicesConfig.isTest) ? AppUpdateService._() : AppUpdateService._();
    return _instance!;
  }

  static AppUpdateService get instance => AppUpdateService._create();

  Future<Box> _getBox() async => await Hive.openBox('app_update');

  Future<bool> checkUpdate() async {
    var box = await _getBox();
    var update = await box.get('update');
    var updatedAt = await box.get(
      'updateAt',
    );
    // if (update != null && updatedAt != null) {
    //   var now = DateTime.now();
    //   var then = DateTime.fromMicrosecondsSinceEpoch(updatedAt);
    //   var diff = then.difference(now);
    //   if (diff.inHours.abs() < 24) {
    //     var cacheUpdate = AppRemoteConfig.fromJson(
    //       Map<String, dynamic>.from(update),
    //     );
    //     await _onUpdate(cacheUpdate);
    //     return true;
    //   }
    // }
    var cacheUpdate = AppRemoteConfig.fromJson(
      Map<String, dynamic>.from(update),
    );
    await _onUpdate(cacheUpdate);

    var r = await FirebaseService.instance.getAppUpdate();

    if (r.isSuccess) {
      var update = r.success;
      var box = await _getBox();
      await box.put('update', update.toJson());
      await box.put('updateAt', DateTime.now().microsecondsSinceEpoch);
      await _onUpdate(update);
      return true;
    } else {
      return false;
    }
  }

  Future<void> _onUpdate(AppRemoteConfig update) async {
    if (update.allow.contains(version)) {
      return;
    } else if (update.semiAllow.contains(version)) {
      await _showUpdateDialog(update, true);
    } else {
      await _showUpdateDialog(update, false);
    }
  }

  Future<void> _showUpdateDialog(AppRemoteConfig update, bool canDismiss) async {
    var context = AudiolizerApp.navigatorKey.currentContext;
    showDialog(
      context: context!,
      barrierDismissible: canDismiss,
      builder: (_) {
        return AlertDialog(
          title: Text(update.title),
          content: Text(update.body),
          actions: [
            if (canDismiss)
              TextButton(
                  onPressed: () {
                    Navigator.pop(_);
                  },
                  child: Text('Close')),
            TextButton(
                onPressed: () {
                  WebviewService.instance.open(url: Uri.parse(update.url));
                },
                child: Text('Continue'))
          ],
        );
      },
    );
  }
}
