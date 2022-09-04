import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solpha/modules/models/bar/bar.dart';
import 'package:solpha/modules/project_editor/service/audio_player_service.dart';
import 'package:solpha/modules/project_editor/ui/note_widgets/note_theme.dart';
import 'package:solpha/modules/project_editor/ui/solfa_text_field/solfa_text_field.dart';
import 'package:solpha/modules/themes/colors/app_colors.dart';

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

            return Container(
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(4),
              ),
              child: SolfaTextField(
                key: ObjectKey(bar),
                bar: bar,
              ),
            );
          }),
    );
  }
}
