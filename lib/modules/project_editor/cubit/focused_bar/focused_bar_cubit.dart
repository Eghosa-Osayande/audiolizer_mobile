import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:audiolizer/modules/models/bar/bar.dart';
import 'package:rxdart/rxdart.dart';

class FocusedBarCubit extends Cubit<Bar?> {
  FocusedBarCubit() : super(null);

  final BehaviorSubject<int> _barGroupIndexStream = BehaviorSubject<int>();

  Stream<int> get barGroupIndexStream => _barGroupIndexStream.stream;

  void setBarGroupIndex(int index) {
    _barGroupIndexStream.add(index);
  }

  focusBar(Bar bar) {
    emit(bar);
  }

  unfocusBar() {
    emit(null);
  }
}
