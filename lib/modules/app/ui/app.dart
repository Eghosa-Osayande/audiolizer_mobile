import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_builder_validators/localization/l10n.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solpha/modules/home/ui/home_page.dart';
import 'package:solpha/modules/models/project/project_model.dart';
import 'package:solpha/modules/models/score/score.dart';
import 'package:solpha/modules/os_share_intent/services/share_intent_service.dart';
import 'package:solpha/modules/project_editor/ui/page/score_editor.dart';
import 'package:solpha/modules/themes/colors/app_colors.dart';
import 'package:solpha/modules/themes/theme_utils.dart';

class SolphaApp extends StatefulWidget {
  const SolphaApp({Key? key}) : super(key: key);

  @override
  State<SolphaApp> createState() => _SolphaAppState();
}

class _SolphaAppState extends State<SolphaApp> {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  @override
  void initState() {
    super.initState();
    ShareProjectService.instance.handleAnyInitialSharedProject();
    ShareProjectService.instance.sharedProjectEventStream.listen(onRecievedShareProjectEvent);
  }

  void onRecievedShareProjectEvent(Project project) {
    navigatorKey.currentState?.push(ProjectEditorPage.route(project));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Audiolize',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        FormBuilderLocalizations.delegate,
      ],
      theme: ThemeData(
          primarySwatch: generateMaterialColor(AppColors.instance.primary),
          textTheme: GoogleFonts.interTextTheme(
            Theme.of(context).textTheme,
          ).apply(
            bodyColor: AppColors.instance.defaultTextColor,
            displayColor: AppColors.instance.defaultTextColor,
          ),
          brightness: Brightness.dark),
      home: const HomePage(),
    );
  }
}
