import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:solpha/modules/score_editor/ui/widgets/note_widgets/note_theme.dart';

mixin AutoSizeTextMixin<T extends StatefulWidget> on State<T> {
  late double textSpanWidth;


  Widget buildAutoSizedText(
    BuildContext context,
    Widget textField,
    TextEditingController controller,
  ) {
    return LayoutBuilder(builder: (context, size) {
      var result = calculateFontSize(
        size,
        controller.buildTextSpan(
          context: context,
          withComposing: true,
        ),
        1,
      );

      var fontSize = result[0] as double;
      var textFits = result[1] as bool;

      NoteThemeProvider.of(context).setFontSize(fontSize);
      return SizedBox(
        width: (1 == 1) ? double.infinity : max(fontSize, textSpanWidth * MediaQuery.of(context).textScaleFactor),
        child: textField,
      );
    });
  }

  List calculateFontSize(BoxConstraints size, TextSpan span, int? maxLines) {
    num minFontSize = 16;

    TextStyle style = NoteThemeProvider.of(context).state.style;
    double stepGranularity = 1;

    var userScale = MediaQuery.textScaleFactorOf(context);

    int left;
    int right;

    num defaultFontSize = 20;
    //style.fontSize.clamp(minFontSize, maxFontSize);
    var defaultScale = defaultFontSize * userScale / 20;
    // style.fontSize!;
    if (_checkTextFits(span, defaultScale, maxLines, size)) {
      return [
        defaultFontSize * userScale,
        true
      ];
    }

    left = (minFontSize / stepGranularity).floor();
    right = (defaultFontSize / stepGranularity).ceil();

    var lastValueFits = false;
    while (left <= right) {
      var mid = (left + (right - left) / 2).toInt();
      double scale;
      scale = mid * userScale * stepGranularity / style.fontSize!;

      if (_checkTextFits(span, scale, maxLines, size)) {
        left = mid + 1;
        lastValueFits = true;
      } else {
        right = mid - 1;
        if (maxLines == null) left = right - 1;
      }
    }

    if (!lastValueFits) {
      right += 1;
    }

    double fontSize;
    fontSize = right * userScale * stepGranularity;

    return [
      fontSize,
      lastValueFits
    ];
  }

  bool _checkTextFits(TextSpan text, double scale, int? maxLines, BoxConstraints constraints) {
    InputDecoration decoration = InputDecoration();
    bool wrapWords = (1 == 1) ? false : true;
    TextAlign textAlign = TextAlign.start;
    double? minWidth = (1 == 1) ? 10 : null;

    double constraintWidth = constraints.maxWidth;
    double constraintHeight = constraints.maxHeight;

    if (decoration.contentPadding != null) {
      constraintWidth -= decoration.contentPadding!.horizontal;
      constraintHeight -= decoration.contentPadding!.vertical;
    }

    var tp = TextPainter(
      text: TextSpan(
        recognizer: text.recognizer,
        children: text.children,
        semanticsLabel: text.semanticsLabel,
        style: NoteThemeProvider.of(context).state.constantStyle,
      ),
      textAlign: textAlign,
      textScaleFactor: scale,
      textDirection: TextDirection.ltr,
      maxLines: maxLines,
    );

    tp.setPlaceholderDimensions(
      text.children!
          .map((e) => PlaceholderDimensions(
                size: NoteThemeProvider.of(context).size,
                alignment: PlaceholderAlignment.bottom,
              ))
          .toList(),
    );

    tp.layout(maxWidth: constraintWidth);
    double _width = (decoration.contentPadding != null) ? tp.width + decoration.contentPadding!.horizontal : tp.width;

    double _height = (decoration.contentPadding != null) ? tp.height + decoration.contentPadding!.vertical : tp.height;

    textSpanWidth = max(_width, minWidth ?? 0);

    if (maxLines == null) {
      if (_height >= constraintHeight) {
        return false;
      } else {
        return true;
      }
    } else {
      if (_width >= constraintWidth) {
        return false;
      } else {
        return true;
      }
    }
  }
}
