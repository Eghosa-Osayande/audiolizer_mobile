import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:solpha/modules/models/bar/bar.dart';
import 'package:solpha/modules/models/track/track.dart';
import 'package:solpha/modules/project_editor/cubit/score/score_cubit_cubit.dart';
import 'package:solpha/modules/project_editor/ui/track_widgets/track_bar.dart';

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
    return Slidable(
      // startActionPane: ActionPane(
      //   motion: BehindMotion(),
      //   children: [
      //     SlidableAction(
      //       onPressed: (_) {},
      //       backgroundColor: Color(0xFF7BC043),
      //       foregroundColor: Colors.white,
      //       icon: Icons.copy,
      //       // label: 'Copy',
      //     ),
      //     SlidableAction(
      //       onPressed: (_) {},
      //       backgroundColor: Color(0xFF0392CF),
      //       foregroundColor: Colors.white,
      //       icon: Icons.cut,
      //       // label: 'Cut',
      //     ),
      // SlidableAction(
      //   onPressed: (_) {},
      //   backgroundColor: Color(0xFF0392CF),
      //   foregroundColor: Colors.white,
      //   icon: Icons.paste,
      //   // label: 'Paste',
      // ),
      //   ],
      // ),
      endActionPane: ActionPane(
        extentRatio: 0.25,
        motion: DrawerMotion(),
        children: [
          SlidableAction(
            onPressed: (_) {
              BlocProvider.of<ScoreCubit>(context).deleteBars(bars);
            },
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            // label: 'Delete',
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(border: Border.all(width: 2), borderRadius: BorderRadius.circular(4)),
        margin: EdgeInsets.all(4),
        padding: EdgeInsets.all(4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('$barIndex'),
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
      ),
    );
  }
}
