import 'package:flutter/material.dart';
import 'package:form_builder_validators/localization/l10n.dart';
import 'package:solpha/modules/models/score/score.dart';
import 'package:solpha/modules/os_share_intent/services/share_intent_service.dart';
import 'package:solpha/modules/score_editor/ui/page/score_editor.dart';
import 'package:solpha/modules/scores_management/score_list/ui/page/score_list_page.dart';

class SolphaApp extends StatefulWidget {
  const SolphaApp({Key? key}) : super(key: key);

  @override
  State<SolphaApp> createState() => _SolphaAppState();
}

class _SolphaAppState extends State<SolphaApp> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  @override
  void initState() {
    super.initState();
    ShareIntentService.instance.handleAnyInitialSharedMedia();
    ShareIntentService.instance.sharedSolphaFileEventStream.listen(onSharedSolphaFileEvent);
  }

  void onSharedSolphaFileEvent(Score score) {
    navigatorKey.currentState?.push(ScoreEditorPage.route(score));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
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
