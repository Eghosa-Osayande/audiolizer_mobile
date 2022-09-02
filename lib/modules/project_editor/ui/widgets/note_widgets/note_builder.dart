import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solpha/modules/models/notes/note.dart';
import 'package:solpha/modules/project_editor/ui/widgets/note_widgets/note_theme.dart';

class NoteBuilder extends StatelessWidget {
  final Note note;

  final NoteTheme noteTheme;

  const NoteBuilder({
    Key? key,
    required this.note,
    required this.noteTheme,
  }) : super(key: key);

  Widget buildNote(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      NoteThemeProvider.of(context).notifyChildSize(context.size);
    });
    return BlocBuilder<NoteThemeProvider, NoteTheme>(
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 2),
          child: Text(
            note.displayString(),
            style: noteTheme.getStyle(note),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var child = buildNote(context);
    return child;
  }
}
