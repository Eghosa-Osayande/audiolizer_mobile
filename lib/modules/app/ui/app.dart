import 'package:audiolizer/modules/app_update/app_update_service.dart';
import 'package:audiolizer/modules/firebase/firebase_service.dart';
import 'package:audiolizer/modules/hive_db/util/hive_initializer.dart';
import 'package:audiolizer/modules/onboarding/repo/onboarding_repo.dart';
import 'package:audiolizer/modules/onboarding/ui/onboarding_page.dart';
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
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  const AudiolizerApp({Key? key}) : super(key: key);

  @override
  State<AudiolizerApp> createState() => _AudiolizerAppState();
}

class _AudiolizerAppState extends State<AudiolizerApp> {
  @override
  void initState() {
    super.initState();

    init();
  }

  Future<void> init() async {
    await HiveInitializer.init();
    await FirebaseService.init();

    Future.delayed(
      Duration(milliseconds: 4000),
      () async {
        if (await OnBoardingRepo.instance.shouldDoOnBoarding()) {
          await AudiolizerApp.navigatorKey.currentState?.push(OnBoardingPage.route());
        }
        AppUpdateService.instance.checkUpdate();
        AudiolizerApp.navigatorKey.currentState?.pushReplacement(HomePage.route());
        ShareProjectService.instance.handleAnyInitialSharedProject();
        ShareProjectService.instance.sharedProjectEventStream.listen(onRecievedShareProjectEvent);
      },
    );
  }

  void onRecievedShareProjectEvent(Project project) {
    AudiolizerApp.navigatorKey.currentState?.push(ProjectEditorPage.route(project));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: AudiolizerApp.navigatorKey,
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
