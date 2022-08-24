import 'package:flutter/material.dart';
import 'package:solpha/modules/models/notes/note.dart';
import 'package:solpha/modules/score_editor/service/audio_player_service.dart';

class PlaybackProgress extends StatelessWidget {
  final Note note;
  final Widget child;
  PlaybackProgress({Key? key, required this.note, required this.child}) : super(key: key);

  Color? color;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Duration>(
      key: ValueKey(AudioPlayerService.instance.playCount),
      stream: AudioPlayerService.instance.onPositionChanged,
      builder: (context, snapshot) {
        int? position = snapshot.data?.inSeconds;
        if (position != null) {
          if (position >= note.startAtInSeconds()) {
            color = Colors.green;
          }
        }
        // print('du=>${}<==>${note.convertBeatPositionToSeconds()}');

        return Container(
          color: color,
          child: child,
        );
      },
    );
  }
}
