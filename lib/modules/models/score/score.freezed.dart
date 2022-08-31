// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'score.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Score {
  int get bpm => throw _privateConstructorUsedError;
  set bpm(int value) => throw _privateConstructorUsedError;
  TimeSignature get timeSignature => throw _privateConstructorUsedError;
  set timeSignature(TimeSignature value) => throw _privateConstructorUsedError;
  KeySignature get keySignature => throw _privateConstructorUsedError;
  set keySignature(KeySignature value) => throw _privateConstructorUsedError;
  int get tonicPitchNumber => throw _privateConstructorUsedError;
  set tonicPitchNumber(int value) => throw _privateConstructorUsedError;
  String get scoreTitle => throw _privateConstructorUsedError;
  set scoreTitle(String value) => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  set updatedAt(DateTime value) => throw _privateConstructorUsedError;
  MIDIFile? get midiFile => throw _privateConstructorUsedError;
  set midiFile(MIDIFile? value) => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ScoreCopyWith<Score> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScoreCopyWith<$Res> {
  factory $ScoreCopyWith(Score value, $Res Function(Score) then) =
      _$ScoreCopyWithImpl<$Res>;
  $Res call(
      {int bpm,
      TimeSignature timeSignature,
      KeySignature keySignature,
      int tonicPitchNumber,
      String scoreTitle,
      DateTime updatedAt,
      MIDIFile? midiFile});
}

/// @nodoc
class _$ScoreCopyWithImpl<$Res> implements $ScoreCopyWith<$Res> {
  _$ScoreCopyWithImpl(this._value, this._then);

  final Score _value;
  // ignore: unused_field
  final $Res Function(Score) _then;

  @override
  $Res call({
    Object? bpm = freezed,
    Object? timeSignature = freezed,
    Object? keySignature = freezed,
    Object? tonicPitchNumber = freezed,
    Object? scoreTitle = freezed,
    Object? updatedAt = freezed,
    Object? midiFile = freezed,
  }) {
    return _then(_value.copyWith(
      bpm: bpm == freezed
          ? _value.bpm
          : bpm // ignore: cast_nullable_to_non_nullable
              as int,
      timeSignature: timeSignature == freezed
          ? _value.timeSignature
          : timeSignature // ignore: cast_nullable_to_non_nullable
              as TimeSignature,
      keySignature: keySignature == freezed
          ? _value.keySignature
          : keySignature // ignore: cast_nullable_to_non_nullable
              as KeySignature,
      tonicPitchNumber: tonicPitchNumber == freezed
          ? _value.tonicPitchNumber
          : tonicPitchNumber // ignore: cast_nullable_to_non_nullable
              as int,
      scoreTitle: scoreTitle == freezed
          ? _value.scoreTitle
          : scoreTitle // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      midiFile: midiFile == freezed
          ? _value.midiFile
          : midiFile // ignore: cast_nullable_to_non_nullable
              as MIDIFile?,
    ));
  }
}

/// @nodoc
abstract class _$$_ScoreCopyWith<$Res> implements $ScoreCopyWith<$Res> {
  factory _$$_ScoreCopyWith(_$_Score value, $Res Function(_$_Score) then) =
      __$$_ScoreCopyWithImpl<$Res>;
  @override
  $Res call(
      {int bpm,
      TimeSignature timeSignature,
      KeySignature keySignature,
      int tonicPitchNumber,
      String scoreTitle,
      DateTime updatedAt,
      MIDIFile? midiFile});
}

/// @nodoc
class __$$_ScoreCopyWithImpl<$Res> extends _$ScoreCopyWithImpl<$Res>
    implements _$$_ScoreCopyWith<$Res> {
  __$$_ScoreCopyWithImpl(_$_Score _value, $Res Function(_$_Score) _then)
      : super(_value, (v) => _then(v as _$_Score));

  @override
  _$_Score get _value => super._value as _$_Score;

  @override
  $Res call({
    Object? bpm = freezed,
    Object? timeSignature = freezed,
    Object? keySignature = freezed,
    Object? tonicPitchNumber = freezed,
    Object? scoreTitle = freezed,
    Object? updatedAt = freezed,
    Object? midiFile = freezed,
  }) {
    return _then(_$_Score(
      bpm: bpm == freezed
          ? _value.bpm
          : bpm // ignore: cast_nullable_to_non_nullable
              as int,
      timeSignature: timeSignature == freezed
          ? _value.timeSignature
          : timeSignature // ignore: cast_nullable_to_non_nullable
              as TimeSignature,
      keySignature: keySignature == freezed
          ? _value.keySignature
          : keySignature // ignore: cast_nullable_to_non_nullable
              as KeySignature,
      tonicPitchNumber: tonicPitchNumber == freezed
          ? _value.tonicPitchNumber
          : tonicPitchNumber // ignore: cast_nullable_to_non_nullable
              as int,
      scoreTitle: scoreTitle == freezed
          ? _value.scoreTitle
          : scoreTitle // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      midiFile: midiFile == freezed
          ? _value.midiFile
          : midiFile // ignore: cast_nullable_to_non_nullable
              as MIDIFile?,
    ));
  }
}

/// @nodoc

class _$_Score extends _Score {
  _$_Score(
      {required this.bpm,
      required this.timeSignature,
      required this.keySignature,
      required this.tonicPitchNumber,
      required this.scoreTitle,
      required this.updatedAt,
      this.midiFile})
      : super._();

  @override
  int bpm;
  @override
  TimeSignature timeSignature;
  @override
  KeySignature keySignature;
  @override
  int tonicPitchNumber;
  @override
  String scoreTitle;
  @override
  DateTime updatedAt;
  @override
  MIDIFile? midiFile;

  @JsonKey(ignore: true)
  @override
  _$$_ScoreCopyWith<_$_Score> get copyWith =>
      __$$_ScoreCopyWithImpl<_$_Score>(this, _$identity);
}

abstract class _Score extends Score {
  factory _Score(
      {required int bpm,
      required TimeSignature timeSignature,
      required KeySignature keySignature,
      required int tonicPitchNumber,
      required String scoreTitle,
      required DateTime updatedAt,
      MIDIFile? midiFile}) = _$_Score;
  _Score._() : super._();

  @override
  int get bpm;
  set bpm(int value);
  @override
  TimeSignature get timeSignature;
  set timeSignature(TimeSignature value);
  @override
  KeySignature get keySignature;
  set keySignature(KeySignature value);
  @override
  int get tonicPitchNumber;
  set tonicPitchNumber(int value);
  @override
  String get scoreTitle;
  set scoreTitle(String value);
  @override
  DateTime get updatedAt;
  set updatedAt(DateTime value);
  @override
  MIDIFile? get midiFile;
  set midiFile(MIDIFile? value);
  @override
  @JsonKey(ignore: true)
  _$$_ScoreCopyWith<_$_Score> get copyWith =>
      throw _privateConstructorUsedError;
}
