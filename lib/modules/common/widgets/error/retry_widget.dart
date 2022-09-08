import 'package:audiolizer/modules/themes/colors/app_colors.dart';
import 'package:flutter/material.dart';

class RetryWidget extends StatelessWidget {
  final String actionName;

  final String message;
  final Widget? messageWidget;

  final Function? onRetry;
  final Color? messageColor;

  const RetryWidget({
    Key? key,
    this.onRetry,
    this.message = "You're offline\n Check your internet connection",
    this.messageWidget,
    this.actionName = "Try Again",
    this.messageColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget child = (messageWidget == null)
        ? Text(
            message,
            style: TextStyle(
              color: AppColors.instance.iconLight,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          )
        : messageWidget!;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          child,
          TextButton(
            child: Text(actionName),
            onPressed: () {
              onRetry?.call();
            },
          ),
        ],
      ),
    );
  }
}
