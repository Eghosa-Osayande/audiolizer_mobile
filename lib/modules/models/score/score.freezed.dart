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
  ScoreConfigNote get intialConfigNote => throw _privateConstructorUsedError;
  set intialConfigNote(ScoreConfigNote value) =>
      throw _privateConstructorUsedError;
  List<Track> get tracks => throw _privateConstructorUsedError;
  set tracks(List<Track> value) => throw _privateConstructorUsedError;
  MIDIFile get midiFile => throw _privateConstructorUsedError;
  set midiFile(MIDIFile value) => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ScoreCopyWith<Score> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScoreCopyWith<$Res> {
  factory $ScoreCopyWith(Score value, $Res Function(Score) then) =
      _$ScoreCopyWithImpl<$Res>;
  $Res call(
      {ScoreConfigNote intialConfigNote,
      List<Track> tracks,
      MIDIFile midiFile});
}

/// @nodoc
class _$ScoreCopyWithImpl<$Res> implements $ScoreCopyWith<$Res> {
  _$ScoreCopyWithImpl(this._value, this._then);

  final Score _value;
  // ignore: unused_field
  final $Res Function(Score) _then;

  @override
  $Res call({
    Object? intialConfigNote = freezed,
    Object? tracks = freezed,
    Object? midiFile = freezed,
  }) {
    return _then(_value.copyWith(
      intialConfigNote: intialConfigNote == freezed
          ? _value.intialConfigNote
          : intialConfigNote // ignore: cast_nullable_to_non_nullable
              as ScoreConfigNote,
      tracks: tracks == freezed
          ? _value.tracks
          : tracks // ignore: cast_nullable_to_non_nullable
              as List<Track>,
      midiFile: midiFile == freezed
          ? _value.midiFile
          : midiFile // ignore: cast_nullable_to_non_nullable
              as MIDIFile,
    ));
  }
}

/// @nodoc
abstract class _$$_ScoreCopyWith<$Res> implements $ScoreCopyWith<$Res> {
  factory _$$_ScoreCopyWith(_$_Score value, $Res Function(_$_Score) then) =
      __$$_ScoreCopyWithImpl<$Res>;
  @override
  $Res call(
      {ScoreConfigNote intialConfigNote,
      List<Track> tracks,
      MIDIFile midiFile});
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
    Object? intialConfigNote = freezed,
    Object? tracks = freezed,
    Object? midiFile = freezed,
  }) {
    return _then(_$_Score(
      intialConfigNote: intialConfigNote == freezed
          ? _value.intialConfigNote
          : intialConfigNote // ignore: cast_nullable_to_non_nullable
              as ScoreConfigNote,
      tracks: tracks == freezed
          ? _value.tracks
          : tracks // ignore: cast_nullable_to_non_nullable
              as List<Track>,
      midiFile: midiFile == freezed
          ? _value.midiFile
          : midiFile // ignore: cast_nullable_to_non_nullable
              as MIDIFile,
    ));
  }
}

/// @nodoc

class _$_Score extends _Score {
  _$_Score(
      {required this.intialConfigNote,
      required this.tracks,
      required this.midiFile})
      : super._();

  @override
  ScoreConfigNote intialConfigNote;
  @override
  List<Track> tracks;
  @override
  MIDIFile midiFile;

  @override
  String toString() {
    return 'Score(intialConfigNote: $intialConfigNote, tracks: $tracks, midiFile: $midiFile)';
  }

  @JsonKey(ignore: true)
  @override
  _$$_ScoreCopyWith<_$_Score> get copyWith =>
      __$$_ScoreCopyWithImpl<_$_Score>(this, _$identity);
}

abstract class _Score extends Score {
  factory _Score(
      {required ScoreConfigNote intialConfigNote,
      required List<Track> tracks,
      required MIDIFile midiFile}) = _$_Score;
  _Score._() : super._();

  @override
  ScoreConfigNote get intialConfigNote;
  set intialConfigNote(ScoreConfigNote value);
  @override
  List<Track> get tracks;
  set tracks(List<Track> value);
  @override
  MIDIFile get midiFile;
  set midiFile(MIDIFile value);
  @override
  @JsonKey(ignore: true)
  _$$_ScoreCopyWith<_$_Score> get copyWith =>
      throw _privateConstructorUsedError;
}
