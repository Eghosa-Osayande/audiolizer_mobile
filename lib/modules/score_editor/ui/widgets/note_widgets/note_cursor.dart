import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solpha/modules/models/notes/note.dart';
import 'package:solpha/modules/score_editor/cubit/edit_track_notes/edit_track_note_cubit.dart';
import 'package:solpha/modules/score_editor/cubit/selected_notes/selected_notes_cubit.dart';
import 'package:solpha/modules/score_editor/ui/widgets/note_widgets/note_builder.dart';
import 'package:solpha/modules/score_editor/ui/widgets/note_widgets/note_dimensions.dart';

class NoteCursor extends StatefulWidget {
  final Note note;
  final Widget Function(BuildContext context, bool isFocused) builder;

  const NoteCursor({
    Key? key,
    required this.note,
    required this.builder,
  }) : super(key: key);

  @override
  State<NoteCursor> createState() => _NoteCursorState();
}

class _NoteCursorState extends State<NoteCursor> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color? selectedColor;
    var selectedNotesCubit = context.watch<SelectedNotesCubit>();
    bool isSelected = selectedNotesCubit.selectedNotes.containsKey(
      widget.note.createdAt,
    );

    selectedColor = isSelected ? Colors.blue : null;

    return BlocListener<SelectedNotesCubit, SelectedNotesState>(
      listener: (context, state) {
        if (selectedNotesCubit.state.enabled && selectedNotesCubit.cursorNote != null) {
          context.read<EditTrackNotesCubit>().setCurrentNote(selectedNotesCubit.cursorNote!);
        }
      },
      child: BlocConsumer<EditTrackNotesCubit, EditTrackNotesState>(
        listenWhen: (previous, current) => previous.currentNote != current.currentNote,
        listener: (context, editTrackNotesState) {
          bool isFocused = editTrackNotesState.currentNote == widget.note;
          if (isFocused) {
            Scrollable.ensureVisible(context, alignmentPolicy: ScrollPositionAlignmentPolicy.keepVisibleAtEnd);
          }
        },
        builder: (context, state) {
          bool isFocused = state.currentNote == widget.note;

          return GestureDetector(
            onTap: () {
              if (selectedNotesCubit.state.enabled) {
                selectedNotesCubit.deselectAll();
              }
              context.read<EditTrackNotesCubit>().setCurrentNote(widget.note);
            },
            
            child: SelectNoteRenderWidget(
              note: widget.note,
              child: Container(
                decoration: BoxDecoration(color: selectedColor),
                child: Stack(
                  children: [
                    widget.builder.call(
                      context,
                      isFocused,
                    ),
                    if (isFocused)
                      Positioned(
                        right: 0,
                        child: Cursor(),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class Cursor extends StatefulWidget {
  const Cursor({
    Key? key,
  }) : super(key: key);

  @override
  State<Cursor> createState() => _CursorState();
}

class _CursorState extends State<Cursor> {
  bool show = true;
  Timer? timer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      Timer.periodic(
        Duration(milliseconds: 700),
        (timer) => toggle(),
      );
    });
  }

  toggle() {
    if (mounted)
      setState(() {
        show = !show;
      });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return (show)
        ? Container(
            color: Colors.white,
            child: SizedBox(
              width: 2,
              height: kNoteHeight,
            ),
          )
        : SizedBox();
  }
}

class SelectNoteRenderWidget extends SingleChildRenderObjectWidget {
  final Note note;

  SelectNoteRenderWidget({required Widget child, required this.note, Key? key}) : super(child: child, key: key);

  @override
  SelectNoteRenderProxy createRenderObject(BuildContext context) {
    return SelectNoteRenderProxy(note);
  }

  @override
  void updateRenderObject(BuildContext context, SelectNoteRenderProxy renderObject) {
    renderObject..note = note;
  }
}

class SelectNoteRenderProxy extends RenderProxyBox {
  Note note;
  SelectNoteRenderProxy(this.note);
}
