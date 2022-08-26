import 'package:bloc/bloc.dart';

class CanSeeLyricsCubit extends Cubit<LyricsViewMode> {
  CanSeeLyricsCubit() : super(LyricsViewMode.show);

  void toggle() {
    switch (state) {
      case LyricsViewMode.hide:
        emit(LyricsViewMode.show);
        break;
      case LyricsViewMode.show:
        emit(LyricsViewMode.hide);
        break;
    }
  }

  hide() {
    emit(LyricsViewMode.hide);
  }

  show() {
    emit(LyricsViewMode.show);
  }
}

enum LyricsViewMode {
  show,
  hide;

  const LyricsViewMode();
  bool get isVisible {
    return this == LyricsViewMode.show;
  }
}
