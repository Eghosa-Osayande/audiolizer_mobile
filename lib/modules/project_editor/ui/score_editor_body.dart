import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solpha/modules/project_editor/cubit/edit_project/edit_project_cubit.dart';
import 'package:solpha/modules/project_editor/cubit/keyboard_event/keyboard_event.dart';
import 'package:solpha/modules/project_editor/cubit/toggle_keyboard_visibility.dart/toggle_keyboard_visibility_cubit.dart';
import 'package:solpha/modules/project_editor/ui/track_widgets/track_scaffold.dart';

class ScoreEditorBody extends StatefulWidget {
  const ScoreEditorBody({Key? key}) : super(key: key);

  @override
  State<ScoreEditorBody> createState() => _ScoreEditorBodyState();
}

class _ScoreEditorBodyState extends State<ScoreEditorBody> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
      SystemUiOverlay.top,
      SystemUiOverlay.bottom
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        var keyboardState = BlocProvider.of<ToggleSolfaKeyboardVisibilityCubit>(context).state;
        switch (keyboardState) {
          case SolfaKeyboardVisibility.visible:
            BlocProvider.of<ToggleSolfaKeyboardVisibilityCubit>(context).toggle();
            return false;
          case SolfaKeyboardVisibility.hidden:

          case SolfaKeyboardVisibility.hiddenForSytemUI:
            return true;
        }
      },
      child: TrackScaffold(),
    );
  }
}
