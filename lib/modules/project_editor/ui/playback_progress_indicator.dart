import 'package:audiolizer/modules/models/track/track.dart';
import 'package:audiolizer/modules/project_editor/cubit/edit_lyrics/edit_lyrics_cubit.dart';
import 'package:audiolizer/modules/project_editor/cubit/toggle_keyboard_visibility.dart/toggle_keyboard_visibility_cubit.dart';
import 'package:audiolizer/modules/project_editor/cubit/toggle_playback_progress_visibility/toggle_playback_progress_visibility.dart';
import 'package:audiolizer/modules/project_editor/cubit/view_mode/view_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:audiolizer/modules/models/bar/bar.dart';
import 'package:audiolizer/modules/project_editor/service/audio_player_service.dart';
import 'package:audiolizer/modules/project_editor/ui/note_widgets/note_theme.dart';
import 'package:audiolizer/modules/project_editor/ui/solfa_text_field/solfa_text_field.dart';
import 'package:audiolizer/modules/themes/colors/app_colors.dart';

class PlaybackProgressIndicator extends StatelessWidget {
  final Widget child;
  final Bar bar;

  const PlaybackProgressIndicator({
    Key? key,
    required this.bar,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Duration>(
        key: ValueKey(AudioPlayerService.instance.playCount),
        stream: AudioPlayerService.instance.onPositionChanged,
        builder: (context, snapshot) {
          int? position = snapshot.data?.inSeconds;
          Color color = Colors.transparent;

          if (position != null && bar.startAtInSeconds() != null) {
            if (position >= (bar.startAtInSeconds()!)) {
              color = Colors.green;
            }
          } else {
            
          }
          // print('du=>${}<==>${note.convertBeatPositionToSeconds()}');

          return BlocBuilder<TogglePlayBackProgressCubit, bool>(
            builder: (context, showPlayBack) {
              return Container(
                decoration: BoxDecoration(
                  color: showPlayBack ? color : Colors.transparent,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: child,
              );
            },
          );
        });
  }
}
