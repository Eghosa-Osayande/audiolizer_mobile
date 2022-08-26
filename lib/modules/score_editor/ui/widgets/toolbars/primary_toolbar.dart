import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solpha/modules/score_editor/cubit/current_track_index/current_track_index_cubit.dart';
import 'package:solpha/modules/score_editor/cubit/score/score_cubit_cubit.dart';
import 'package:solpha/modules/score_editor/cubit/toggle_edit_play_mode/toggle_edit_play_mode_cubit.dart';
import 'package:solpha/modules/score_editor/cubit/toggle_keyboard_visibility.dart/toggle_keyboard_visibility_cubit.dart';

class PrimaryToolbar extends StatelessWidget implements PreferredSizeWidget {
  const PrimaryToolbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentTrackIndexCubit, int>(
      builder: (context, currentIndex) {
        return BlocBuilder<ScoreCubit, ScoreCubitState>(
          builder: (context, state) {
            var tracks = state.score.tracks;
            var noOfTracks = tracks.length;
            return AppBar(
              title: Text('Track ${currentIndex + 1}'),
              actions: [
                IconButton(
                  onPressed: () {
                    BlocProvider.of<ScoreCubit>(context).play();
                  },
                  icon: BlocBuilder<ToggleEditPlayModeCubit, ToggleEditPlayModeState>(
                    builder: (context, state) {
                      switch (state) {
                        case ToggleEditPlayModeState.edit:
                          return Icon(Icons.play_arrow);

                        case ToggleEditPlayModeState.playing:
                          return Icon(Icons.pause);
                      }
                    },
                  ),
                ),
                
                PopupMenuButton(
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(
                        child: ListTile(
                          title: Text('Undo'),
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                      PopupMenuItem(
                        child: ListTile(
                          title: Text('Redo'),
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                     
                    ];
                  },
                  icon: Icon(
                    Icons.more_vert,
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Size get preferredSize {
    return Size.fromHeight(kToolbarHeight);
  }
}

class KeyboardVisibilityToggler extends StatelessWidget {
  const KeyboardVisibilityToggler({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        BlocProvider.of<ToggleKeyboardVisibilityCubit>(context).toggle();
      },
      icon: BlocBuilder<ToggleKeyboardVisibilityCubit, KeyboardVisibility>(
        builder: (context, state) {
          switch (state) {
            case KeyboardVisibility.visible:
              return Icon(Icons.keyboard);

            case KeyboardVisibility.hidden:
              return Icon(Icons.keyboard_alt_outlined);
          }
        },
      ),
    );
  }
}
