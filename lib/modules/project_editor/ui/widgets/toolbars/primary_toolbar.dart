import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:solpha/modules/models/score/score.dart';
import 'package:solpha/modules/project_editor/cubit/score/score_cubit_cubit.dart';
import 'package:solpha/modules/project_editor/cubit/toggle_edit_play_mode/toggle_edit_play_mode_cubit.dart';
import 'package:solpha/modules/project_editor/cubit/toggle_keyboard_visibility.dart/toggle_keyboard_visibility_cubit.dart';

class PrimaryToolbar extends StatelessWidget implements PreferredSizeWidget {
  const PrimaryToolbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScoreCubit, ScoreCubitState>(
      builder: (context, state) {
        var tracks = state.score.tracks;
        var noOfTracks = tracks.length;
        return AppBar(
          title: Text('Tracks'),
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
                    child: ToolbarOption(title: 'Undo'),
                    onTap: () async {},
                  ),
                  PopupMenuItem(
                    child: ToolbarOption(title: 'Redo'),
                    onTap: () {},
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
  }

  @override
  Size get preferredSize {
    return Size.fromHeight(kToolbarHeight);
  }
}

class ToolbarOption extends StatelessWidget {
  final String title;
  final Widget? trailing;

  const ToolbarOption({
    Key? key,
    required this.title,
    this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text(title),
          if (trailing != null) trailing!,
        ],
      ),
    );
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

            case KeyboardVisibility.hiddenForSytemUI:
              return Icon(Icons.keyboard_alt_outlined);
          }
        },
      ),
    );
  }
}
