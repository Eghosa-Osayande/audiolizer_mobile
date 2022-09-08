// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:audiolizer/modules/project_editor/ui/keyboard/button_models.dart';
import 'package:charcode/charcode.dart';

class ButtonWidget extends StatefulWidget {
  final ButtonModel data;

  final double? height;

  final Color buttonBGColor;
  final Color textColor;

  const ButtonWidget({
    Key? key,
    this.data = const ButtonModel(),
    this.height,
    this.buttonBGColor = Colors.black,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  GlobalKey<TooltipState> tooltipKey = GlobalKey<TooltipState>();

  double initialWidth = 30;

  Timer? timer;
  Timer? startTimer;

  Duration delay = const Duration(milliseconds: 2000);

  void continuousWork() {
    widget.data.action(context);
  }

  void onJobEnd() {
    if (widget.data.canLongPress) {
      debugPrint("Job END");
      startTimer?.cancel();
      timer?.cancel();
      timer = null;
    }
  }

  void onJobStart() async {
    if (widget.data.canLongPress) {
      if (timer != null) return;
      startTimer ??= Timer(
        Duration(milliseconds: 2000),
        () {
          debugPrint("Job started");
          timer = Timer.periodic(delay, (timer) {
            continuousWork();
          });
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapCancel: () {
        tooltipKey.currentState?.deactivate();
        onJobEnd();
      },
      onTapDown: (details) {
        onJobStart();
        tooltipKey.currentState?.ensureTooltipVisible();
      },
      onTapUp: (details) {
        tooltipKey.currentState?.deactivate();
        continuousWork();
        onJobEnd();
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
          color: widget.buttonBGColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: widget.data.icon(context) ??
              Text(
                widget.data.displayString(),
                style: GoogleFonts.zillaSlab(
                  fontSize: 16,
                  color: widget.textColor,
                ),
              ),
        ),
      ),
    );
  }
}
