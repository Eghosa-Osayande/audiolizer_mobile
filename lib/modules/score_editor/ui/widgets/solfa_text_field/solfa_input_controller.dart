import 'dart:math';

import 'package:flutter/material.dart';
import 'package:solpha/modules/models/bar/bar.dart';
import 'package:solpha/modules/models/notes/enums/duration_markers.dart';
import 'package:solpha/modules/models/notes/enums/solfege.dart';
import 'package:solpha/modules/models/notes/note.dart';
import 'package:solpha/modules/score_editor/ui/widgets/note_widgets/note_builder.dart';
import 'package:solpha/modules/score_editor/ui/widgets/note_widgets/note_theme.dart';
import 'package:solpha/modules/score_editor/ui/widgets/solfa_text_field/solfa_clipboard_service.dart';

class SolfaEditingController extends TextEditingController {
  SolfaEditingController(this.notes)
      : super.fromValue(
          TextEditingValue.empty,
        ) {
    value = TextEditingValue(text: notes.map((e) => '-').toList().join());
    selection = TextSelection.collapsed(offset: value.text.length);
    notifyListeners();
  }

  final List<Note> notes;

  @override
  TextSpan buildTextSpan({required BuildContext context, TextStyle? style, required bool withComposing}) {
    var noteTheme = NoteThemeProvider.of(context).state;

    return TextSpan(
      children: notes.map(
        (Note note) {
          return WidgetSpan(
            style: noteTheme.constantStyle,
            child: AbsorbPointer(
              absorbing: true,
              child: NoteBuilder(
                noteTheme: noteTheme,
                note: note,
              ),
            ),
          );
        },
      ).toList(),
      style: noteTheme.constantStyle,
    );
  }

  void insertNotes(List<Note> newNotes) {
    print([
      selection.end,
      selection.start
    ]);
    String myText = newNotes.map((e) => '-').toList().join();

    final textSelection = selection;
    notes.replaceRange(
      textSelection.start,
      textSelection.end,
      newNotes,
    );
    final newText = text.replaceRange(
      textSelection.start,
      textSelection.end,
      myText,
    );

    final myTextLength = newNotes.length;

    text = newText;
    selection = textSelection.copyWith(
      baseOffset: textSelection.start + myTextLength,
      extentOffset: textSelection.start + myTextLength,
    );
    notifyListeners();
  }

  void backSpace() {
    var _controller = this;
    final text = _controller.text;
    final textSelection = _controller.selection;
    final selectionLength = textSelection.end - textSelection.start;
    // There is a selection.
    if (selectionLength > 0) {
      final newText = text.replaceRange(
        textSelection.start,
        textSelection.end,
        '',
      );
      notes.replaceRange(
        textSelection.start,
        textSelection.end,
        [],
      );
      _controller.text = newText;
      _controller.selection = textSelection.copyWith(
        baseOffset: textSelection.start,
        extentOffset: textSelection.start,
      );
      notifyListeners();
      return;
    }
    // The cursor is at the beginning.
    if (textSelection.start == 0) {
      return;
    }
    // Delete the previous character
    final previousCodeUnit = text.codeUnitAt(textSelection.start - 1);
    const offset = 1;
    final newStart = textSelection.start - offset;
    final newEnd = textSelection.start;
    final newText = text.replaceRange(
      newStart,
      newEnd,
      '',
    );
    notes.replaceRange(
      newStart,
      newEnd,
      [],
    );
    _controller.text = newText;
    _controller.selection = textSelection.copyWith(
      baseOffset: newStart,
      extentOffset: newStart,
    );
    notifyListeners();
  }

  void copySelectedNotes() {
    var copies = notes
        .sublist(
          selection.start,
          selection.end,
        )
        .map((e) => e.makeCopy())
        .toList();
    SolfaClipboardService.instance.copyNotes(copies);
    selection = TextSelection.collapsed(offset: selection.end);
    notifyListeners();
  }

  void cutSelectedNotes() {
    var copies = notes
        .sublist(
          selection.start,
          selection.end,
        )
        .map((e) => e.makeCopy())
        .toList();
    SolfaClipboardService.instance.copyNotes(copies);
    backSpace();
  }

  void pasteNotes() {
    var copies = SolfaClipboardService.instance.getCopiedNotes();
    if (copies != null) {
      insertNotes(copies);
    }
  }

  void moveCursorLeft() {
    if (selection.start > 0) {
      selection = TextSelection.collapsed(offset: selection.start - 1);
      notifyListeners();
    }
  }

  void moveCursorRight() {
    if (selection.start < text.length) {
      selection = TextSelection.collapsed(offset: selection.start + 1);
      notifyListeners();
    }
  }
}
