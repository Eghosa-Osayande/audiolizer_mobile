import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:form_builder_validators/localization/l10n.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';
import 'package:solpha/modules/hive_db/util/hive_initializer.dart';
import 'package:solpha/modules/os_share_intent/services/share_intent_service.dart';
import 'package:solpha/modules/scores_management/score_list/ui/page/score_list_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveInitializer.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    ShareIntentService.instance.handleAnyInitialSharedMedia();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Solpha',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        FormBuilderLocalizations.delegate,
      ],
      theme: ThemeData(
        primarySwatch: Colors.red,
        primaryColor: Colors.red.shade900,
        brightness: Brightness.dark,
      ),
      home: const ScorelistPage(),
    );
  }
}
