// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:solpha/modules/score_editor/cubit/toggle_keyboard_visibility.dart/toggle_keyboard_visibility_cubit.dart';
import 'package:solpha/modules/score_editor/ui/widgets/keyboard/utility_row.dart';

import 'octave_board.dart';

class SolfaKeyboard extends StatelessWidget {
  SolfaKeyboard({Key? key}) : super(key: key);

  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToggleKeyboardVisibilityCubit, KeyboardVisibility>(
      builder: (context, state) {
        if (state == KeyboardVisibility.hidden) {
          return SizedBox();
        }
        return LayoutBuilder(builder: (context, box) {
          return Stack(
            children: [
              Container(
                decoration: BoxDecoration(color: Colors.black54),
                child: SizedBox(
                  height: 185,
                  child: Column(
                    children: [
                      TopRow(),
                      Expanded(
                        child: Scrollbar(
                          thumbVisibility: true,
interactive: false,
                          controller: scrollController,
                          child: CustomScrollView(
                            controller: scrollController,
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
                      ),
                      BottomRow(),
                    ],
                  ),
                ),
              ),
            ],
          );
        });
      },
    );
  }
}
