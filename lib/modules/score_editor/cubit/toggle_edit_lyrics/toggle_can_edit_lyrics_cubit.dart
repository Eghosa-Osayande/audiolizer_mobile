import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:solpha/modules/models/bar/bar.dart';

class CanEditLyricsCubit extends Cubit<CanEditLyrics> {
  final Bar bar;
  CanEditLyricsCubit(this.bar)
      : super(
          CanEditLyrics(CanEditLyricsEnum.no, bar),
        );

  void toggle() {
    switch (state.canEdit) {
      case CanEditLyricsEnum.no:
         emit(CanEditLyrics(CanEditLyricsEnum.yes, bar));
        break;
      case CanEditLyricsEnum.yes:
       emit( CanEditLyrics(CanEditLyricsEnum.no, bar));
        break;
    }
  }

  no() {
   emit( CanEditLyrics(CanEditLyricsEnum.no, bar));
  }

  yes() {
    emit(CanEditLyrics(CanEditLyricsEnum.yes, bar));
  }



  addLyrics( String text) {
    bar.lyrics= text;
    emit(CanEditLyrics(CanEditLyricsEnum.no, bar));
  }
}

class CanEditLyrics with EquatableMixin {
  final CanEditLyricsEnum canEdit;
  final Bar bar;
  late final int id = DateTime.now().millisecondsSinceEpoch;

  CanEditLyrics(this.canEdit, this.bar);

  @override
  // TODO: implement props
  List<Object?> get props => [
        id
      ];
}

enum CanEditLyricsEnum {
  yes,
  no;

  const CanEditLyricsEnum();
  bool get isYes {
    return this == CanEditLyricsEnum.yes;
  }
}
