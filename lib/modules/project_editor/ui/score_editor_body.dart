import 'package:audiolizer/modules/app/ui/app.dart';
import 'package:audiolizer/modules/project_editor/cubit/play_score/play_score_cubit.dart';
import 'package:audiolizer/modules/project_editor/service/audio_player_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:audiolizer/modules/project_editor/cubit/edit_project/edit_project_cubit.dart';
import 'package:audiolizer/modules/project_editor/cubit/keyboard_event/keyboard_event.dart';
import 'package:audiolizer/modules/project_editor/cubit/reload_project/reload_project.dart';
import 'package:audiolizer/modules/project_editor/cubit/toggle_keyboard_visibility.dart/toggle_keyboard_visibility_cubit.dart';
import 'package:audiolizer/modules/project_editor/ui/track_widgets/track_scaffold.dart';

class ScoreEditorBody extends StatefulWidget {
  const ScoreEditorBody({Key? key}) : super(key: key);

  @override
  State<ScoreEditorBody> createState() => _ScoreEditorBodyState();
}

class _ScoreEditorBodyState extends State<ScoreEditorBody> with RouteAware, WidgetsBindingObserver {
  ModalRoute? route;
  @override
  void initState() {
    super.initState();
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
    //   SystemUiOverlay.top,
    //   SystemUiOverlay.bottom
    // ]);
    WidgetsBinding.instance.removeObserver(this);
    if (route != null) {
      AudiolizerApp.routeObserver.unsubscribe(
        this,
      );
    }
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    route = ModalRoute.of(context);
    if (route != null) {
      AudiolizerApp.routeObserver.subscribe(this, route!);
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    handleLifeCycleStateChange(state);
  }

  void handleLifeCycleStateChange(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.resumed:
        break;
      case AppLifecycleState.inactive:

      case AppLifecycleState.paused:

      case AppLifecycleState.detached:
        AudioPlayerService.instance.stop();
        break;
    }
  }

  @override
  void didPop() {
    AudioPlayerService.instance.stop();
  }

  @override
  void didPushNext() {
    AudioPlayerService.instance.stop();
  }

  @override
  Widget build(BuildContext context) {
    if (route != null) {
      route = ModalRoute.of(context);
      AudiolizerApp.routeObserver.subscribe(this, route!);
    }
    return WillPopScope(
      onWillPop: () async {
        var keyboardState = BlocProvider.of<ToggleSolfaKeyboardVisibilityCubit>(context).state;
        switch (keyboardState) {
          case SolfaKeyboardVisibility.visible:
            BlocProvider.of<ToggleSolfaKeyboardVisibilityCubit>(context).toggle();
            return false;
          case SolfaKeyboardVisibility.hidden:
            return true;
        }
      },
      child: BlocBuilder<ReloadProjectCubit, ReloadProjectCubitState>(
        builder: (context, state) {
          return TrackScaffold();
        },
      ),
    );
  }
}
