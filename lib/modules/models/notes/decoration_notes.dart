import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:solpha/modules/models/track/track.dart';

import 'note.dart';

class SpacingNote extends Note with EquatableMixin {
  final NoteSpacing type;
  SpacingNote(
    Track track,
    this.type,
  ) : super(track);

  Widget build(BuildContext context) {
    switch (type) {
      case NoteSpacing.whiteSpace:
        return SizedBox(
          width: 20,
        );

      case NoteSpacing.newLine:
        return Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
                child: SizedBox(
              width: 1,
            ))
          ],
        );
    }
  }
   @override
  Note makeCopy([Track? track]) {
    // TODO: implement makeCopy
    return SpacingNote(track??this.track, type);
  }
}

enum NoteSpacing {
  whiteSpace,
  newLine;
}
