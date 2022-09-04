import 'package:audiolizer/modules/models/bar/bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditLyricsCubit extends Cubit<Bar?> {
  EditLyricsCubit() : super(null);

  editBarLyrics(Bar bar) {
    emit(bar);
  }

  disable() {
    emit(null);
  }

  setLyrics(String value) {
    state?.lyrics = value;
  }
}
