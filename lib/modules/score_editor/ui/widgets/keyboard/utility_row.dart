// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:solpha/modules/models/notes/enums/duration_markers.dart';
import 'package:solpha/modules/models/notes/enums/solfege.dart';

import 'note_key_models.dart';
import 'note_key_widget.dart';

class BottomRow extends StatelessWidget {
  const BottomRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(flex: 1, child: NoteKey(data: NewLineButton(),)),
        Expanded(
            flex: 1,
            child: NoteKey(
              data: MusicNoteButton(octave: 0, solfa: Solfege.silent),
            )),
        Expanded(flex: 3, child: NoteKey(data: SpaceBarButton(),)),
        Expanded(
            flex: 1,
            child: NoteKey(
              data: MusicNoteButton(octave: 0, solfa: Solfege.sustain),
            )),
        Expanded(flex: 1, child: NoteKey(data: DeleteNoteButton(),)),
      ],
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: markers.map((e) => Expanded(child: NoteKey(data: e))).toList(),
    );
  }
}
