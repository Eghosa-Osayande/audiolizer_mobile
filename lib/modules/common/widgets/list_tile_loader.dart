import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';


class ListTileLoader extends StatelessWidget {
  const ListTileLoader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16,horizontal: 16),
      child: Row(
        children: [
           SkeletonAvatar(
            style: SkeletonAvatarStyle(height: 50, width: 50),
          ),
          Expanded(
            child: SizedBox(child: SkeletonParagraph(style: SkeletonParagraphStyle(lines: 2))),
          ),
         
        ],
      ),
    );
  }
}
