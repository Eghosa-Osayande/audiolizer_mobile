import 'package:audiolizer/modules/models/track/track.dart';
import 'package:audiolizer/modules/project_editor/cubit/edit_lyrics/edit_lyrics_cubit.dart';
import 'package:audiolizer/modules/project_editor/cubit/focused_bar/focused_bar_cubit.dart';
import 'package:audiolizer/modules/project_editor/cubit/toggle_keyboard_visibility.dart/toggle_keyboard_visibility_cubit.dart';
import 'package:audiolizer/modules/project_editor/cubit/toggle_playback_progress_visibility/toggle_playback_progress_visibility.dart';
import 'package:audiolizer/modules/project_editor/cubit/view_mode/view_mode.dart';
import 'package:audiolizer/modules/project_editor/ui/playback_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:audiolizer/modules/models/bar/bar.dart';
import 'package:audiolizer/modules/project_editor/service/audio_player_service.dart';
import 'package:audiolizer/modules/project_editor/ui/note_widgets/note_theme.dart';
import 'package:audiolizer/modules/project_editor/ui/solfa_text_field/solfa_text_field.dart';
import 'package:audiolizer/modules/themes/colors/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

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
    var mode = (bar.list as Track).trackMode;
    if (!(bar.list as Track).isVisible) {
      return SizedBox();
    }
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NoteThemeProvider(),
        ),
      ],
      child: PlaybackProgressIndicator(
        key: ObjectKey(bar),
        bar: bar,
        child: Column(
          children: [
            if (mode == TrackMode.music)
              SolfaTextField(
                key: ObjectKey(bar),
                bar: bar,
              )
            else
              BarLyricsWidget(bar: bar)
          ],
        ),
      ),
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
    return BlocBuilder<ViewModeCubit, ViewModeState>(
      builder: (context, viewMode) {
        return AbsorbPointer(
          absorbing: !(viewMode == ViewModeState.edit),
          child: BlocBuilder<EditLyricsCubit, Bar?>(
            builder: (context, editBar) {
              if (editBar == bar) {
                return LyricInputWidget();
              } else {
                return LyricsViewWidget(bar: bar);
              }
            },
          ),
        );
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
    var lyrics = bar.lyrics.trim();

    return InkWell(
      onLongPress: () {
        BlocProvider.of<EditLyricsCubit>(context).editBarLyrics(bar);
        BlocProvider.of<ToggleSolfaKeyboardVisibilityCubit>(context).hide();
      },
      child: SizedBox(
        child: Align(
          alignment: Alignment.topLeft,
          child: TextFormField(
            enabled: false,
            readOnly: true,
            initialValue: lyrics,
            minLines: 1,
            maxLines: null,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(fontStyle: FontStyle.italic, fontSize: 14, height: 1.2),
            decoration: InputDecoration(
              hintText: "Press and hold to edit ${(bar.list as Track).name} lyrics",
              hintStyle: GoogleFonts.inter(fontStyle: FontStyle.italic, fontSize: 12),
              contentPadding: EdgeInsets.fromLTRB(0, 2, 0, 2),
            ),
          ),
        ),
      ),
    );
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
        return Row(
          children: [
            Expanded(
              child: TextFormField(
                enabled: (viewMode == ViewModeState.edit),
                focusNode: focus,
                textAlign: TextAlign.center,
                initialValue: BlocProvider.of<EditLyricsCubit>(context).state?.lyrics,
                textInputAction: TextInputAction.newline,
                maxLines: null,
                minLines: 1,
                onTap: () {
                  BlocProvider.of<ToggleSolfaKeyboardVisibilityCubit>(context).hide();
                },
                onChanged: (value) {
                  BlocProvider.of<EditLyricsCubit>(context).setLyrics(value);
                },
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.check),
            ),
          ],
        );
      },
    );
  }
}
