import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:solpha/modules/models/bar/bar.dart';
import 'package:solpha/modules/models/track/track.dart';
import 'package:solpha/modules/score_editor/ui/widgets/solfa_text_field/solfa_input_controller.dart';

class SingleTrackCubit extends Cubit<Track> {
  final Track track;
  SingleTrackCubit(this.track) : super(track) {
    if (track.bars.isEmpty) {
      track.bars.addFirst(
        Bar(
          createdAt: DateTime.now().toUtc(),
          solfaEditingController: SolfaEditingController([]),
        ),
      );
      emit(track);
    }
  }
}
