// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'score.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Score _$$_ScoreFromJson(Map<String, dynamic> json) => _$_Score(
      intialConfigNote: ScoreConfigNote.fromJson(
          json['intialConfigNote'] as Map<String, dynamic>),
      tracks: (json['tracks'] as List<dynamic>)
          .map((e) => Track.fromJson(e as Map<String, dynamic>))
          .toList(),
      midiFile: midifilefromJson(json['midiFile'] as List<Bar>),
    );

Map<String, dynamic> _$$_ScoreToJson(_$_Score instance) => <String, dynamic>{
      'intialConfigNote': instance.intialConfigNote.toJson(),
      'tracks': instance.tracks.map((e) => e.toJson()).toList(),
      'midiFile': midifileToJson(instance.midiFile),
    };
