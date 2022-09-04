import 'package:flutter/material.dart';

class ToolbarOption extends StatelessWidget {
  final String title;
  final Widget? trailing;

  const ToolbarOption({
    Key? key,
    required this.title,
    this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text(title),
          Spacer(),
          if (trailing != null) trailing!,
        ],
      ),
    );
  }
}
