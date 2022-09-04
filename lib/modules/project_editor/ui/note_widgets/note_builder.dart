import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:audiolizer/modules/models/notes/note.dart';
import 'package:audiolizer/modules/project_editor/ui/note_widgets/note_theme.dart';

class NoteBuilder extends StatefulWidget {
  final Note note;

  final NoteTheme noteTheme;

  const NoteBuilder({
    Key? key,
    required this.note,
    required this.noteTheme,
  }) : super(key: key);

  @override
  State<NoteBuilder> createState() => _NoteBuilderState();
}

class _NoteBuilderState extends State<NoteBuilder> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      NoteThemeProvider.of(context).notifyChildSize(context.size);
    });
  }



  Widget buildNote(BuildContext context) {
    return BlocBuilder<NoteThemeProvider, NoteTheme>(
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 2),
          child: Text(
            widget.note.displayString(),
            style: widget.noteTheme.getStyle(widget.note),
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
