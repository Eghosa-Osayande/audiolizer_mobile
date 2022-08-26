import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SolfaTextFieldSelectionControls extends MaterialTextSelectionControls {
  SolfaTextFieldSelectionControls({
    this.onPaste,
    this.onCopy,
    this.onCut,
  });

  ValueChanged<TextSelectionDelegate>? onPaste;
  ValueChanged<TextSelectionDelegate>? onCopy;
  ValueChanged<TextSelectionDelegate>? onCut;

  @override
  Future<void> handlePaste(final TextSelectionDelegate delegate) async {
    onPaste?.call(delegate);
    // delegate.hideToolbar();
    return super.handlePaste(delegate);
  }

  @override
  Widget buildToolbar(
    BuildContext context,
    Rect globalEditableRegion,
    double textLineHeight,
    Offset selectionMidpoint,
    List<TextSelectionPoint> endpoints,
    TextSelectionDelegate delegate,
    ClipboardStatusNotifier? clipboardStatus,
    Offset? lastSecondaryTapDownPosition,
  ) {
    const double _kHandleSize = 22.0;

    // Padding between the toolbar and the anchor.
    const double _kToolbarContentDistanceBelow = _kHandleSize - 2.0;
    const double _kToolbarContentDistance = 8.0;
    final TextSelectionPoint startTextSelectionPoint = endpoints[0];
    final TextSelectionPoint endTextSelectionPoint = endpoints.length > 1 ? endpoints[1] : endpoints[0];
    final Offset anchorAbove = Offset(
      globalEditableRegion.left + selectionMidpoint.dx,
      globalEditableRegion.top + startTextSelectionPoint.point.dy - textLineHeight - _kToolbarContentDistance,
    );
    final Offset anchorBelow = Offset(
      globalEditableRegion.left + selectionMidpoint.dx,
      globalEditableRegion.top + endTextSelectionPoint.point.dy + _kToolbarContentDistanceBelow,
    );
    return TextSelectionToolbar(
      anchorAbove: anchorAbove,
      anchorBelow: anchorBelow,
      children: [
        TextButton(
          onPressed: () {
            onCut?.call(delegate);
            super.handleCut(delegate);
          },
          child: Text('Cut'),
        ),
        TextButton(
          onPressed: () {
            onCopy?.call(delegate);
            super.handleCopy(delegate);
          },
          child: Text('Copy'),
        ),
        TextButton(
          onPressed: () {
            onPaste?.call(delegate);
            super.handlePaste(delegate);
          },
          child: Text('Paste'),
        ),
      ],
    );
  }
}
