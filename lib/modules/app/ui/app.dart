import 'package:flutter/material.dart';
import 'package:form_builder_validators/localization/l10n.dart';
import 'package:solpha/modules/models/project/project_model.dart';
import 'package:solpha/modules/models/score/score.dart';
import 'package:solpha/modules/os_share_intent/services/share_intent_service.dart';
import 'package:solpha/modules/project_editor/ui/page/score_editor.dart';

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

  void onSharedSolphaFileEvent(Project project) {
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
      home: const Center(),
    );
  }
}
