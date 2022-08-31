import 'package:flutter/material.dart';
import 'package:form_builder_validators/localization/l10n.dart';
import 'package:solpha/modules/hive_db/util/hive_initializer.dart';
import 'package:solpha/modules/scores_management/score_list/ui/page/score_list_page.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveInitializer.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
