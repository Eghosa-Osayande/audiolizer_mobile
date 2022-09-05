import 'package:rxdart/rxdart.dart';
import 'package:audiolizer/modules/models/notes/note.dart';
import 'package:audiolizer/modules/os_toast/services/platform_toast_service.dart';

class SolfaClipboardService {
  static final SolfaClipboardService _instance = SolfaClipboardService._();

  SolfaClipboardService._();
  factory SolfaClipboardService.__() {
    return _instance;
  }

  static SolfaClipboardService get instance => SolfaClipboardService.__();

  List<Note>? _notes;

  copyNotes(List<Note> notes) {
    _notes = notes;
    PlatformToastService.instance.showToast(msg: 'Notes copied');
  }

  List<Note>? getCopiedNotes() {
   
   var copies= _notes?.map((e) => Note.fromJson(e.toJson())).toList();
    return copies;
  }
}
