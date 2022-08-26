import 'package:rxdart/rxdart.dart';
import 'package:solpha/modules/models/notes/note.dart';
import 'package:solpha/modules/os_toast/services/platform_toast_service.dart';

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

 List<Note>? popCopiedNotes() {
    var copies = _notes;
    _notes = null;
    return copies;
  }
}
