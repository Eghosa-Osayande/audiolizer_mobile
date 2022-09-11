import 'package:audiolizer/modules/models/bar/bar.dart';
import 'package:audiolizer/modules/project_editor/cubit/current_bar_group_index/current_bar_group_index.dart';
import 'package:audiolizer/modules/project_editor/cubit/toggle_auto_scroll/toggle_auto_scroll.dart';
import 'package:audiolizer/modules/project_editor/cubit/toggle_playback_progress_visibility/toggle_playback_progress_visibility.dart';
import 'package:audiolizer/modules/project_editor/service/audio_player_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

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

          if (position != null) {
            var start = bar.startAtInSeconds();
            var end = bar.endAtInSeconds();
            if (start != null && end != null) {
              if (position >= start && position <= end) {
                SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                  var d = Duration(
                    milliseconds: (((end - start).abs()) * 1000).toInt() + 1000,
                  );
                  bool canScroll = BlocProvider.of<ToggleAutoScrollCubit>(context).state;
                  if (canScroll) {
                    ItemScrollController controller = BlocProvider.of<ToggleAutoScrollCubit>(context).itemScrollController;
                    int barGroupIndex = BlocProvider.of<CurrentBarGroupIndexCubit>(context).state;
                    controller.scrollTo(
                      index: barGroupIndex,
                      duration: d,
                    );
                  }
                });
                color = Colors.green;
              }
            }
          } else {}
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
