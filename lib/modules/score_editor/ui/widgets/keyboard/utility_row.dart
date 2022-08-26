// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:solpha/modules/models/notes/enums/duration_markers.dart';
import 'package:solpha/modules/models/notes/enums/solfege.dart';

import 'button_models.dart';
import 'button_widget.dart';

class BottomRow extends StatelessWidget {
  const BottomRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red.shade900,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
              flex: 1,
              child: ButtonWidget(
                data: NewLineButton(),
              )),
          Expanded(
              flex: 1,
              child: ButtonWidget(
                data: MusicNoteButton(octave: 0, solfa: Solfege.silent),
              )),
          Expanded(
              flex: 3,
              child: ButtonWidget(
                data: SpaceBarButton(),
              )),
          Expanded(
              flex: 1,
              child: ButtonWidget(
                data: MusicNoteButton(octave: 0, solfa: Solfege.sustain),
              )),
          Expanded(
              flex: 1,
              child: ButtonWidget(
                data: DeleteNoteButton(),
              )),
        ],
      ),
    );
  }
}

class TopRow extends StatelessWidget {
  const TopRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var markers = [
      DurationNoteButton(marker: DurationMarker.full),
      DurationNoteButton(marker: DurationMarker.half),
      DurationNoteButton(marker: DurationMarker.quarter),
      DurationNoteButton(marker: DurationMarker.seperator),
    ];
    return Container(
      color: Colors.red.shade900,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: markers.map((e) => Expanded(child: ButtonWidget(data: e))).toList(),
      ),
    );
  }
}
