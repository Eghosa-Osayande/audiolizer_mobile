import 'dart:collection';

import 'package:audiolizer/modules/models/track/track.dart';
import 'package:audiolizer/modules/project_editor/ui/track_widgets/bar_group.dart';
import 'package:flutter/material.dart';

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
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, barIndex) {
              var bars = List.generate(
                tracks.length,
                (trackIndex) {
                  var bar = tracks.toList()[trackIndex].bars.toList()[barIndex];
                  return bar;
                },
              );
              // var r = bars.map((e) => e.startAt).toList();
              // print('starts=>$r');
              return BarGroupWidget(
                barIndex: barIndex,
                bars: bars,
              );
            },
            childCount: trackBarCount2,
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(height: 100),
        ),
      ],
    );
  }
}
