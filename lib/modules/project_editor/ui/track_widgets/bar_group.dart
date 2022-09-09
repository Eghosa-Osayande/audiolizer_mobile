import 'package:audiolizer/modules/themes/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:audiolizer/modules/models/bar/bar.dart';
import 'package:audiolizer/modules/models/track/track.dart';

import 'package:audiolizer/modules/project_editor/cubit/keyboard_event/keyboard_event.dart';
import 'package:audiolizer/modules/project_editor/cubit/play_score/play_score_cubit.dart';
import 'package:audiolizer/modules/project_editor/ui/track_widgets/track_bar.dart';

class BarGroupWidget extends StatelessWidget {
  const BarGroupWidget({
    Key? key,
    required this.barIndex,
    required this.bars,
  }) : super(key: key);

  final int barIndex;
  final List<Bar> bars;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1,color: AppColors.instance.iconLight),
        color: Colors.red.withOpacity(0.2),
        borderRadius: BorderRadius.circular(4),
      ),
      margin: EdgeInsets.all(4),
      padding: EdgeInsets.all(4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${barIndex + 1}'),
          SizedBox(
            width: 4,
          ),
          Expanded(
            child: Column(
              children: [
                ...List.generate(bars.length, (index) {
                  var bar = bars[index];
                  return SizedBox(
                    child: TrackBarWidget(
                      key: ObjectKey(bar),
                      bar: bar,
                      index: index,
                    ),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
