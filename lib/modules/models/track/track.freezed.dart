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

/// @nodoc
mixin _$Track {
  int get trackNumber => throw _privateConstructorUsedError;
  set trackNumber(int value) => throw _privateConstructorUsedError;
  int get volume => throw _privateConstructorUsedError;
  set volume(int value) => throw _privateConstructorUsedError;
  MidiProgram get program => throw _privateConstructorUsedError;
  set program(MidiProgram value) => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  set name(String value) => throw _privateConstructorUsedError;
  TrackMode get trackMode => throw _privateConstructorUsedError;
  set trackMode(TrackMode value) => throw _privateConstructorUsedError;
  bool get isVisible => throw _privateConstructorUsedError;
  set isVisible(bool value) => throw _privateConstructorUsedError;
  bool get isLyricsVisible => throw _privateConstructorUsedError;
  set isLyricsVisible(bool value) => throw _privateConstructorUsedError;

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
      MidiProgram program,
      String name,
      TrackMode trackMode,
      bool isVisible,
      bool isLyricsVisible});
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
    Object? name = freezed,
    Object? trackMode = freezed,
    Object? isVisible = freezed,
    Object? isLyricsVisible = freezed,
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
              as MidiProgram,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      trackMode: trackMode == freezed
          ? _value.trackMode
          : trackMode // ignore: cast_nullable_to_non_nullable
              as TrackMode,
      isVisible: isVisible == freezed
          ? _value.isVisible
          : isVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      isLyricsVisible: isLyricsVisible == freezed
          ? _value.isLyricsVisible
          : isLyricsVisible // ignore: cast_nullable_to_non_nullable
              as bool,
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
      MidiProgram program,
      String name,
      TrackMode trackMode,
      bool isVisible,
      bool isLyricsVisible});
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
    Object? name = freezed,
    Object? trackMode = freezed,
    Object? isVisible = freezed,
    Object? isLyricsVisible = freezed,
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
              as MidiProgram,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      trackMode: trackMode == freezed
          ? _value.trackMode
          : trackMode // ignore: cast_nullable_to_non_nullable
              as TrackMode,
      isVisible: isVisible == freezed
          ? _value.isVisible
          : isVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      isLyricsVisible: isLyricsVisible == freezed
          ? _value.isLyricsVisible
          : isLyricsVisible // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Track extends _Track {
  _$_Track(
      {required this.trackNumber,
      required this.volume,
      required this.program,
      required this.name,
      this.trackMode = TrackMode.music,
      this.isVisible = true,
      this.isLyricsVisible = true})
      : super._();

  @override
  int trackNumber;
  @override
  int volume;
  @override
  MidiProgram program;
  @override
  String name;
  @override
  @JsonKey()
  TrackMode trackMode;
  @override
  @JsonKey()
  bool isVisible;
  @override
  @JsonKey()
  bool isLyricsVisible;

  @JsonKey(ignore: true)
  @override
  _$$_TrackCopyWith<_$_Track> get copyWith =>
      __$$_TrackCopyWithImpl<_$_Track>(this, _$identity);
}

abstract class _Track extends Track {
  factory _Track(
      {required int trackNumber,
      required int volume,
      required MidiProgram program,
      required String name,
      TrackMode trackMode,
      bool isVisible,
      bool isLyricsVisible}) = _$_Track;
  _Track._() : super._();

  @override
  int get trackNumber;
  set trackNumber(int value);
  @override
  int get volume;
  set volume(int value);
  @override
  MidiProgram get program;
  set program(MidiProgram value);
  @override
  String get name;
  set name(String value);
  @override
  TrackMode get trackMode;
  set trackMode(TrackMode value);
  @override
  bool get isVisible;
  set isVisible(bool value);
  @override
  bool get isLyricsVisible;
  set isLyricsVisible(bool value);
  @override
  @JsonKey(ignore: true)
  _$$_TrackCopyWith<_$_Track> get copyWith =>
      throw _privateConstructorUsedError;
}
