import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solpha/modules/score_editor/cubit/toggle_keyboard_visibility.dart/toggle_keyboard_visibility_cubit.dart';
import 'package:solpha/modules/score_editor/ui/widgets/track_widgets/track_scaffold.dart';

class ScoreEditorBody extends StatelessWidget {
  const ScoreEditorBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        var keyboardState = BlocProvider.of<ToggleKeyboardVisibilityCubit>(context).state;
        switch (keyboardState) {
          case KeyboardVisibility.visible:
            BlocProvider.of<ToggleKeyboardVisibilityCubit>(context).toggle();
            return false;
          case KeyboardVisibility.hidden:

          case KeyboardVisibility.hiddenForSytemUI:
            return true;
        }
      },
      child: TrackScaffold(),
    );
  }
}
