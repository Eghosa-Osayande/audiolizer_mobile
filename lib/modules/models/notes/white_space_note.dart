import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:solpha/modules/models/track/track.dart';

import 'note.dart';

class WhiteSpaceNote extends Note with EquatableMixin {
  



  @override
  Note makeCopy([Track? track]) {
    return WhiteSpaceNote();
  }
   @override
  String displayString() {
    return ' ';
  }
}
