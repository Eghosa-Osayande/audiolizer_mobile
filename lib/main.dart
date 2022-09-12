import 'package:audiolizer/modules/firebase/firebase_service.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:audiolizer/modules/app/ui/app.dart';
import 'package:audiolizer/modules/hive_db/util/hive_initializer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseService.init();

  runApp(const AudiolizerApp());
  // runApp(
  //   DevicePreview(
  //     enabled: !kReleaseMode,
  //     builder: (context) => const AudiolizerApp(),
  //   ),
  // );
}
