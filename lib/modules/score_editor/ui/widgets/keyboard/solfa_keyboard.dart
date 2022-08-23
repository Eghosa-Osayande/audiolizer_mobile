// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:solpha/modules/score_editor/ui/widgets/keyboard/utility_row.dart';

import 'octave_board.dart';

class SolfaKeyboard extends StatelessWidget {
  const SolfaKeyboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, box) {
      return SizedBox(
        height: 190,
        child: Column(
          children: [
            TopRow(),
            Expanded(
              child: CustomScrollView(
                scrollDirection: Axis.horizontal,
                center: ValueKey('mid'),
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return SizedBox(
                          width: box.maxWidth,
                          child: OctaveBoard(
                            octave: (index + 1) * -1,
                          ),
                        );
                      },
                      childCount: 3,
                    ),
                  ),
                  SliverList(
                    key: ValueKey('mid'),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return SizedBox(
                          width: box.maxWidth,
                          child: OctaveBoard(
                            octave: index,
                          ),
                        );
                      },
                      childCount: 4,
                    ),
                  ),
                ],
              ),
            ),
            BottomRow(),
          ],
        ),
      );
    });
  }
}
