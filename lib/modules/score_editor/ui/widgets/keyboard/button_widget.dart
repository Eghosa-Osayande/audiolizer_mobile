// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solpha/modules/score_editor/ui/widgets/keyboard/button_models.dart';
import 'package:charcode/charcode.dart';

class ButtonWidget extends StatefulWidget {
  final ButtonModel data;
  final double? height;
  const ButtonWidget({
    Key? key,
    this.data = const ButtonModel(),
    this.height,
  }) : super(key: key);

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  GlobalKey<TooltipState> tooltipKey = GlobalKey<TooltipState>();

  double initialWidth = 30;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTapCancel: () {
        tooltipKey.currentState?.deactivate();
      },
      onTapDown: (details) {
        tooltipKey.currentState?.ensureTooltipVisible();
      },
      onTapUp: (details) {
        tooltipKey.currentState?.deactivate();
        widget.data.action(context);
      },
      child: Tooltip(
        key: tooltipKey,
        triggerMode: TooltipTriggerMode.manual,
        preferBelow: false,
        padding: EdgeInsets.zero,
        margin: EdgeInsets.zero,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.white, width: 1),
        ),
        richMessage: WidgetSpan(
          child: buildBody(),
        ),
        child: buildBody(),
      ),
    );
  }

  Widget buildBody() {
    double height = widget.height ?? 35;
    return SizedBox(
      height: height,
      width: initialWidth,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: widget.data.icon() ??
              Text(
                widget.data.displayString(),
                style: GoogleFonts.zillaSlab(fontSize: 16),
              ),
        ),
      ),
    );
  }
}