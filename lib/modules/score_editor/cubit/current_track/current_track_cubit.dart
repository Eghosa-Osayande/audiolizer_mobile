import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:solpha/modules/models/track/track.dart';

part 'current_track_state.dart';

class CurrentTrackCubit extends Cubit<int> {
  CurrentTrackCubit( int index) : super(index);

  void setCurrentTrack( int index) {
    emit(index);
  }
}
