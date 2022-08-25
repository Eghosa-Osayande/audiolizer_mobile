import 'package:flutter/material.dart';
import 'package:solpha/modules/models/notes/note.dart';
import 'package:solpha/modules/score_editor/ui/widgets/note_widgets/note_builder.dart';

class SolfaEditingController extends TextEditingController {
  final List<Note> notes = [];

  SolfaEditingController({
    String? text,
  }) : super.fromValue(
          text == null ? TextEditingValue.empty : TextEditingValue(text: text),
        );

  insertDuration(Note duration) {
[].replaceRange(start, end, replacements)
// final text = _controller.text;
  final textSelection = selection;
  final newText = text.replaceRange(
    textSelection.start,
    textSelection.end,
    myText,
  );
  final myTextLength = myText.length;
  _controller.text = newText;
  _controller.selection = textSelection.copyWith(
    baseOffset: textSelection.start + myTextLength,
    extentOffset: textSelection.start + myTextLength,
  );


    notes.add(duration);
    text = notes.map((e) => '-').toList().join();
    notifyListeners();
  }

  @override
  TextSpan buildTextSpan({required BuildContext context, TextStyle? style, required bool withComposing}) {
    print([
      'boted',
      notes.length
    ]);
    return TextSpan(
      children: List.generate(
        notes.length,
        (index) => WidgetSpan(
          child: AbsorbPointer(
            absorbing: true,
            child: NoteBuilder(
              note: notes[index],
            ),
          ),
        ),
      ),
      style: style,
    );

    TextRange? matchedRange;

    if (text.contains('\uffff')) {
      matchedRange = _findMatchedRange(text);
    }

    if (matchedRange != null) {
      return TextSpan(
        children: [
          TextSpan(text: matchedRange.textBefore(text)),
          const WidgetSpan(child: FlutterLogo()),
          TextSpan(text: matchedRange.textAfter(text)),
        ],
        style: style,
      );
    }

    return TextSpan(text: text, style: style);
  }

  TextRange _findMatchedRange(String text) {
    final RegExp matchPattern = RegExp(RegExp.escape('\uffff'));
    late TextRange matchedRange;

    for (final Match match in matchPattern.allMatches(text)) {
      matchedRange = TextRange(start: match.start, end: match.end);
    }

    return matchedRange;
  }
}
