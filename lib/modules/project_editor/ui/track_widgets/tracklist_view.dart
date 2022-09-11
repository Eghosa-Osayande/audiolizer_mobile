import 'dart:collection';

import 'package:audiolizer/modules/models/track/track.dart';
import 'package:audiolizer/modules/project_editor/cubit/toggle_auto_scroll/toggle_auto_scroll.dart';
import 'package:audiolizer/modules/project_editor/ui/track_widgets/bar_group.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class TrackListView extends StatelessWidget {
  const TrackListView({
    Key? key,
    required this.trackBarCount2,
    required this.tracks,
  }) : super(key: key);

  final int trackBarCount2;
  final LinkedList<Track> tracks;

  @override
  Widget build(BuildContext context) {
    var itemScrollController = BlocProvider.of<ToggleAutoScrollCubit>(context).itemScrollController;
    var postionedScroll = ScrollablePositionedList.builder(
      itemCount: trackBarCount2,
      itemBuilder: barGroupBuilder,
      itemScrollController: itemScrollController,
      padding: EdgeInsets.only(
        bottom: 100,
      ),
    );

    var customScroll = CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            barGroupBuilder,
            childCount: trackBarCount2,
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(height: 100),
        ),
      ],
    );
   return (1 == 1) ? postionedScroll : customScroll;
  }

  Widget barGroupBuilder(BuildContext context, barIndex) {
    var bars = List.generate(
      tracks.length,
      (trackIndex) {
        var bar = tracks.toList()[trackIndex].bars.toList()[barIndex];
        return bar;
      },
    );
    return BarGroupWidget(
      barIndex: barIndex,
      bars: bars,
    );
  }
}
