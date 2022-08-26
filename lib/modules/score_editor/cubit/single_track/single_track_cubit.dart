import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:solpha/modules/models/track/track.dart';

class SingleTrackCubit extends Cubit<Track> {
  final Track track;
  SingleTrackCubit(this.track) : super(track);

 
}
