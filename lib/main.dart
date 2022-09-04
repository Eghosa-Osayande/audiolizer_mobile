import 'package:flutter/material.dart';
import 'package:audiolizer/modules/app/ui/app.dart';
import 'package:audiolizer/modules/hive_db/util/hive_initializer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveInitializer.init();
  runApp(const SolphaApp());
}
