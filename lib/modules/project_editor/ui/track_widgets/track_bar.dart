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

class TrackBarWidget extends StatelessWidget {
  final int index;
  final Bar bar;

  const TrackBarWidget({
    Key? key,
    required this.bar,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NoteThemeProvider(),
        ),
      ],
      child: StreamBuilder<Duration>(
          key: ValueKey(AudioPlayerService.instance.playCount),
          stream: AudioPlayerService.instance.onPositionChanged,
          builder: (context, snapshot) {
            int? position = snapshot.data?.inSeconds;
            Color color = Colors.transparent;

            if (position != null && bar.startAt != null) {
              if (position >= (bar.startAt!)) {
                color = Colors.green;
              }
            }
            // print('du=>${}<==>${note.convertBeatPositionToSeconds()}');

            return BlocBuilder<TogglePlayBackProgressCubit, bool>(
              builder: (context, showPlayBack) {
                return Container(
                  decoration: BoxDecoration(
                    color: showPlayBack ? color : Colors.transparent,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Column(
                    children: [
                      SolfaTextField(
                        key: ObjectKey(bar),
                        bar: bar,
                      ),
                      BarLyricsWidget(bar: bar)
                    ],
                  ),
                );
              },
            );
          }),
    );
  }
}

class BarLyricsWidget extends StatelessWidget {
  const BarLyricsWidget({
    Key? key,
    required this.bar,
  }) : super(key: key);

  final Bar bar;

  @override
  Widget build(BuildContext context) {
    var isLyricsVisible = (bar.list as Track).isLyricsVisible;
    if (!isLyricsVisible) {
      return SizedBox();
    }
    return BlocBuilder<EditLyricsCubit, Bar?>(
      builder: (context, editBar) {
        if (editBar == bar) {
          return LyricInputWidget();
        } else {
          return LyricsViewWidget(bar: bar);
        }
      },
    );
  }
}

class LyricsViewWidget extends StatelessWidget {
  const LyricsViewWidget({
    Key? key,
    required this.bar,
  }) : super(key: key);

  final Bar bar;

  @override
  Widget build(BuildContext context) {
    var lyrics = bar.lyrics;

    if (lyrics.trim().isNotEmpty) {
      return Align(alignment: Alignment.topLeft, child: Text(lyrics));
    } else {
      return SizedBox();
    }
  }
}

class LyricInputWidget extends StatefulWidget {
  const LyricInputWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<LyricInputWidget> createState() => _LyricInputWidgetState();
}

class _LyricInputWidgetState extends State<LyricInputWidget> {
  final FocusNode focus = FocusNode();
  @override
  void initState() {
    super.initState();
    focus.addListener(focusListener);
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      focus.requestFocus();
    });
  }

  void focusListener() {
    if (!focus.hasPrimaryFocus) {
      BlocProvider.of<EditLyricsCubit>(context).disable();
    }
  }

  @override
  void dispose() {
    focus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewModeCubit, ViewModeState>(
      builder: (context, viewMode) {
        return TextFormField(
          enabled: (viewMode == ViewModeState.edit),
          focusNode: focus,
          initialValue: BlocProvider.of<EditLyricsCubit>(context).state?.lyrics,
          onTap: () {
            BlocProvider.of<ToggleSolfaKeyboardVisibilityCubit>(context).hide();
          },
          onChanged: (value) {
            BlocProvider.of<EditLyricsCubit>(context).setLyrics(value);
          },
        );
      },
    );
  }
}
