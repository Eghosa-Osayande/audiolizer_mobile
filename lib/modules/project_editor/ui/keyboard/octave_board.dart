// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:solpha/modules/models/notes/enums/solfege.dart';

import 'button_models.dart';
import 'button_widget.dart';



class OctaveBoard extends StatelessWidget {
  final int octave;
  const OctaveBoard({
    Key? key,
    required this.octave,
  }) : super(key: key);

  final double kNoteHeight = 45;

  @override
  Widget build(BuildContext context) {
    var noteKey = ButtonWidget();
    var sharps = generateSharpOctave();
    var flat = generateFlatOctave();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(sharps.length, (index) {
            if (index == 0 || index == 7) {
              return Spacer(
                flex: 1,
              );
            }
            if (index == 3) {
              return Expanded(
                flex: 2,
                child: Opacity(
                  opacity: 0,
                  child: noteKey,
                ),
              );
            }

            return Expanded(
                flex: 2,
                child: ButtonWidget(
                  data: sharps[index],
                  height: kNoteHeight,
                ));
          }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.from(
            generateMainOctave().map(
              (note) {
                return Expanded(
                    flex: 2,
                    child: ButtonWidget(
                      data: note,
                      height: kNoteHeight,
                    ));
              },
            ).toList(),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(flat.length, (index) {
            if (index == 0 || index == 7) {
              return Spacer(
                flex: 1,
              );
            }
            if (index == 3) {
              return Expanded(
                flex: 2,
                child: Opacity(
                  opacity: 0,
                  child: noteKey,
                ),
              );
            }
            return Expanded(
              flex: 2,
              child: ButtonWidget(
                data: flat[index],
                height: kNoteHeight,
              ),
            );
          }),
        ),
      ],
    );
  }

  final kMainNote = const [
    Solfege.d,
    Solfege.r,
    Solfege.m,
    Solfege.f,
    Solfege.s,
    Solfege.l,
    Solfege.t,
  ];
  final kSharpNotes = const [
    Solfege.de,
    Solfege.de,
    Solfege.re,
    Solfege.fe,
    Solfege.fe,
    Solfege.se,
    Solfege.le,
    Solfege.le,
  ];
  final kFlatNotes = const [
    Solfege.ra,
    Solfege.ra,
    Solfege.ma,
    Solfege.sa,
    Solfege.sa,
    Solfege.la,
    Solfege.ta,
    Solfege.ta,
  ];

  List<MusicNoteButton> generateMainOctave() {
    return kMainNote.map((solfa) => MusicNoteButton(solfa: solfa, octave: octave)).toList();
  }

  List<MusicNoteButton> generateSharpOctave() {
    return kSharpNotes.map((solfa) => MusicNoteButton(solfa: solfa, octave: octave)).toList();
  }

  List<MusicNoteButton> generateFlatOctave() {
    return kFlatNotes.map((solfa) => MusicNoteButton(solfa: solfa, octave: octave)).toList();
  }
}
