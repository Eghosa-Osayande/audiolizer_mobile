import 'package:audiolizer/modules/splash/ui/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_builder_validators/localization/l10n.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:audiolizer/modules/home/ui/home_page.dart';
import 'package:audiolizer/modules/models/project/project_model.dart';
import 'package:audiolizer/modules/models/score/score.dart';
import 'package:audiolizer/modules/os_share_intent/services/share_intent_service.dart';
import 'package:audiolizer/modules/project_editor/ui/page/score_editor.dart';
import 'package:audiolizer/modules/themes/colors/app_colors.dart';
import 'package:audiolizer/modules/themes/theme_utils.dart';

class AudiolizerApp extends StatefulWidget {
  static final RouteObserver routeObserver = RouteObserver();
  const AudiolizerApp({Key? key}) : super(key: key);

  @override
  State<AudiolizerApp> createState() => _AudiolizerAppState();
}

class _AudiolizerAppState extends State<AudiolizerApp> {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  @override
  void initState() {
    super.initState();
    precacheImage(
        AssetImage(
          'assets/images/logo_colored.png',
        ),
        context);
    Future.delayed(
      Duration(milliseconds: 4000),
      () {
        navigatorKey.currentState?.push(HomePage.route());
        ShareProjectService.instance.handleAnyInitialSharedProject();
      },
    );

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
      title: 'Audiolizer',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        FormBuilderLocalizations.delegate,
      ],
      navigatorObservers: [
        AudiolizerApp.routeObserver,
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
      home: const SplashPage(),
    );
  }
}
