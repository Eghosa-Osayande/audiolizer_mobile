import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solpha/modules/models/notes/enums/duration_markers.dart';
import 'package:solpha/modules/models/notes/note.dart';
import 'package:solpha/modules/score_editor/cubit/edit_track_notes/edit_track_note_cubit.dart';
import 'package:solpha/modules/score_editor/ui/widgets/solfa_text_field/solfa_input_controller.dart';

class SolfaTextField extends StatefulWidget {
  SolfaTextField({Key? key}) : super(key: key);

  @override
  State<SolfaTextField> createState() => _SolfaTextFieldState();
}

class _SolfaTextFieldState extends State<SolfaTextField> {
  final SolfaEditingController _controller = SolfaEditingController(text: ":d''':");

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      maxLines: null,
      readOnly: true,
      showCursor: true,
      onTap: () {
        // print('hi');
        // var track = context.read<EditTrackNotesCubit>().track;
        // var newNote = Note.duration(track, marker: DurationMarker.full);
        // _controller.insertDuration(newNote);
        print(_controller.text);
      },
    );
  }
}
