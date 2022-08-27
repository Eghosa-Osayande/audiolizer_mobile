// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'track.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Track _$TrackFromJson(Map<String, dynamic> json) {
  return _Track.fromJson(json);
}

/// @nodoc
mixin _$Track {
  int get trackNumber => throw _privateConstructorUsedError;
  set trackNumber(int value) => throw _privateConstructorUsedError;
  int get volume => throw _privateConstructorUsedError;
  set volume(int value) => throw _privateConstructorUsedError;
  int get program => throw _privateConstructorUsedError;
  set program(int value) => throw _privateConstructorUsedError;
  @JsonKey(toJson: linkedListToJson, fromJson: linkedListfromJson)
  BarsLinkedlist get bars => throw _privateConstructorUsedError;
  @JsonKey(toJson: linkedListToJson, fromJson: linkedListfromJson)
  set bars(BarsLinkedlist value) => throw _privateConstructorUsedError;
  ScoreConfigNote get intialScoreConfigNote =>
      throw _privateConstructorUsedError;
  set intialScoreConfigNote(ScoreConfigNote value) =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TrackCopyWith<Track> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrackCopyWith<$Res> {
  factory $TrackCopyWith(Track value, $Res Function(Track) then) =
      _$TrackCopyWithImpl<$Res>;
  $Res call(
      {int trackNumber,
      int volume,
      int program,
      @JsonKey(toJson: linkedListToJson, fromJson: linkedListfromJson)
          BarsLinkedlist bars,
      ScoreConfigNote intialScoreConfigNote});
}

/// @nodoc
class _$TrackCopyWithImpl<$Res> implements $TrackCopyWith<$Res> {
  _$TrackCopyWithImpl(this._value, this._then);

  final Track _value;
  // ignore: unused_field
  final $Res Function(Track) _then;

  @override
  $Res call({
    Object? trackNumber = freezed,
    Object? volume = freezed,
    Object? program = freezed,
    Object? bars = freezed,
    Object? intialScoreConfigNote = freezed,
  }) {
    return _then(_value.copyWith(
      trackNumber: trackNumber == freezed
          ? _value.trackNumber
          : trackNumber // ignore: cast_nullable_to_non_nullable
              as int,
      volume: volume == freezed
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as int,
      program: program == freezed
          ? _value.program
          : program // ignore: cast_nullable_to_non_nullable
              as int,
      bars: bars == freezed
          ? _value.bars
          : bars // ignore: cast_nullable_to_non_nullable
              as BarsLinkedlist,
      intialScoreConfigNote: intialScoreConfigNote == freezed
          ? _value.intialScoreConfigNote
          : intialScoreConfigNote // ignore: cast_nullable_to_non_nullable
              as ScoreConfigNote,
    ));
  }
}

/// @nodoc
abstract class _$$_TrackCopyWith<$Res> implements $TrackCopyWith<$Res> {
  factory _$$_TrackCopyWith(_$_Track value, $Res Function(_$_Track) then) =
      __$$_TrackCopyWithImpl<$Res>;
  @override
  $Res call(
      {int trackNumber,
      int volume,
      int program,
      @JsonKey(toJson: linkedListToJson, fromJson: linkedListfromJson)
          BarsLinkedlist bars,
      ScoreConfigNote intialScoreConfigNote});
}

/// @nodoc
class __$$_TrackCopyWithImpl<$Res> extends _$TrackCopyWithImpl<$Res>
    implements _$$_TrackCopyWith<$Res> {
  __$$_TrackCopyWithImpl(_$_Track _value, $Res Function(_$_Track) _then)
      : super(_value, (v) => _then(v as _$_Track));

  @override
  _$_Track get _value => super._value as _$_Track;

  @override
  $Res call({
    Object? trackNumber = freezed,
    Object? volume = freezed,
    Object? program = freezed,
    Object? bars = freezed,
    Object? intialScoreConfigNote = freezed,
  }) {
    return _then(_$_Track(
      trackNumber: trackNumber == freezed
          ? _value.trackNumber
          : trackNumber // ignore: cast_nullable_to_non_nullable
              as int,
      volume: volume == freezed
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as int,
      program: program == freezed
          ? _value.program
          : program // ignore: cast_nullable_to_non_nullable
              as int,
      bars: bars == freezed
          ? _value.bars
          : bars // ignore: cast_nullable_to_non_nullable
              as BarsLinkedlist,
      intialScoreConfigNote: intialScoreConfigNote == freezed
          ? _value.intialScoreConfigNote
          : intialScoreConfigNote // ignore: cast_nullable_to_non_nullable
              as ScoreConfigNote,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Track extends _Track {
  _$_Track(
      {required this.trackNumber,
      required this.volume,
      required this.program,
      @JsonKey(toJson: linkedListToJson, fromJson: linkedListfromJson)
          required this.bars,
      required this.intialScoreConfigNote})
      : super._();

  factory _$_Track.fromJson(Map<String, dynamic> json) =>
      _$$_TrackFromJson(json);

  @override
  int trackNumber;
  @override
  int volume;
  @override
  int program;
  @override
  @JsonKey(toJson: linkedListToJson, fromJson: linkedListfromJson)
  BarsLinkedlist bars;
  @override
  ScoreConfigNote intialScoreConfigNote;

  @override
  String toString() {
    return 'Track(trackNumber: $trackNumber, volume: $volume, program: $program, bars: $bars, intialScoreConfigNote: $intialScoreConfigNote)';
  }

  @JsonKey(ignore: true)
  @override
  _$$_TrackCopyWith<_$_Track> get copyWith =>
      __$$_TrackCopyWithImpl<_$_Track>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TrackToJson(
      this,
    );
  }
}

abstract class _Track extends Track {
  factory _Track(
      {required int trackNumber,
      required int volume,
      required int program,
      @JsonKey(toJson: linkedListToJson, fromJson: linkedListfromJson)
          required BarsLinkedlist bars,
      required ScoreConfigNote intialScoreConfigNote}) = _$_Track;
  _Track._() : super._();

  factory _Track.fromJson(Map<String, dynamic> json) = _$_Track.fromJson;

  @override
  int get trackNumber;
  set trackNumber(int value);
  @override
  int get volume;
  set volume(int value);
  @override
  int get program;
  set program(int value);
  @override
  @JsonKey(toJson: linkedListToJson, fromJson: linkedListfromJson)
  BarsLinkedlist get bars;
  @JsonKey(toJson: linkedListToJson, fromJson: linkedListfromJson)
  set bars(BarsLinkedlist value);
  @override
  ScoreConfigNote get intialScoreConfigNote;
  set intialScoreConfigNote(ScoreConfigNote value);
  @override
  @JsonKey(ignore: true)
  _$$_TrackCopyWith<_$_Track> get copyWith =>
      throw _privateConstructorUsedError;
}
