// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Track _$$_TrackFromJson(Map<String, dynamic> json) => _$_Track(
      trackNumber: json['trackNumber'] as int,
      volume: json['volume'] as int,
      program: json['program'] as int,
      bars: linkedListfromJson(json['bars'] as List<Bar>),
      intialScoreConfigNote: ScoreConfigNote.fromJson(
          json['intialScoreConfigNote'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_TrackToJson(_$_Track instance) => <String, dynamic>{
      'trackNumber': instance.trackNumber,
      'volume': instance.volume,
      'program': instance.program,
      'bars': linkedListToJson(instance.bars),
      'intialScoreConfigNote': instance.intialScoreConfigNote.toJson(),
    };
