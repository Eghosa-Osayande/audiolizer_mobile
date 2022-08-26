import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solpha/modules/score_editor/cubit/current_track_index/current_track_index_cubit.dart';
import 'package:solpha/modules/score_editor/cubit/score/score_cubit_cubit.dart';
import 'package:solpha/modules/score_editor/cubit/single_track/single_track_cubit.dart';
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
            return true;
        }
      },
      child: BlocBuilder<ScoreCubit, ScoreCubitState>(
        builder: (context, scoreCubitState) {
          var tracks = scoreCubitState.score.tracks;

          return BlocProvider(
            create: (context) => CurrentTrackIndexCubit(
              0,
            ),
            child: BlocBuilder<CurrentTrackIndexCubit, int>(
              builder: (context, currentTrackIndex) {
                return IndexedStack(
                  index: currentTrackIndex,
                  children: tracks.map(
                    (track) {
                      return BlocProvider(
                        create: (context) => SingleTrackCubit(track),
                        child: TrackScaffold(),
                      );
                    },
                  ).toList(),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
