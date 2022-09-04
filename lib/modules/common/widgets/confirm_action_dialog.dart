import 'package:flutter/material.dart';

Future<bool?> showConfirmDialog(
  BuildContext context,
  String title, {
  String body = '',
  String noText = 'NO',
  String yesText = 'YES',
}) async {
  return await showDialog(
    context: context,
    builder: (context) {
      return ConfirmActionDialog(
        title: title,
        body: body,
        noText: noText,
        yesText: yesText,
      );
    },
  );
}

class ConfirmActionDialog extends StatelessWidget {
  final String title;
  final String body;
  final String noText;
  final String yesText;

  const ConfirmActionDialog({
    Key? key,
    required this.title,
    required this.body,
    required this.noText,
    required this.yesText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(body),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context, false);
          },
          child: Text(noText),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context, true);
          },
          child: Text(yesText),
        ),
      ],
    );
  }
}
