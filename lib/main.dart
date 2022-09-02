import 'package:flutter/material.dart';
import 'package:solpha/modules/app/ui/app.dart';
import 'package:solpha/modules/hive_db/util/hive_initializer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveInitializer.init();
  runApp(const SolphaApp());
}
