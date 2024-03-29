// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'bar.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Bar _$BarFromJson(Map<String, dynamic> json) {
  return Bard.fromJson(json);
}

/// @nodoc
mixin _$Bar {
  DateTime get createdAt => throw _privateConstructorUsedError;
  set createdAt(DateTime value) => throw _privateConstructorUsedError;
  List<Note> get notes => throw _privateConstructorUsedError;
  set notes(List<Note> value) => throw _privateConstructorUsedError;
  String get lyrics => throw _privateConstructorUsedError;
  set lyrics(String value) => throw _privateConstructorUsedError;
  double get duration => throw _privateConstructorUsedError;
  set duration(double value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BarCopyWith<Bar> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BarCopyWith<$Res> {
  factory $BarCopyWith(Bar value, $Res Function(Bar) then) =
      _$BarCopyWithImpl<$Res>;
  $Res call(
      {DateTime createdAt, List<Note> notes, String lyrics, double duration});
}

/// @nodoc
class _$BarCopyWithImpl<$Res> implements $BarCopyWith<$Res> {
  _$BarCopyWithImpl(this._value, this._then);

  final Bar _value;
  // ignore: unused_field
  final $Res Function(Bar) _then;

  @override
  $Res call({
    Object? createdAt = freezed,
    Object? notes = freezed,
    Object? lyrics = freezed,
    Object? duration = freezed,
  }) {
    return _then(_value.copyWith(
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      notes: notes == freezed
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<Note>,
      lyrics: lyrics == freezed
          ? _value.lyrics
          : lyrics // ignore: cast_nullable_to_non_nullable
              as String,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$$BardCopyWith<$Res> implements $BarCopyWith<$Res> {
  factory _$$BardCopyWith(_$Bard value, $Res Function(_$Bard) then) =
      __$$BardCopyWithImpl<$Res>;
  @override
  $Res call(
      {DateTime createdAt, List<Note> notes, String lyrics, double duration});
}

/// @nodoc
class __$$BardCopyWithImpl<$Res> extends _$BarCopyWithImpl<$Res>
    implements _$$BardCopyWith<$Res> {
  __$$BardCopyWithImpl(_$Bard _value, $Res Function(_$Bard) _then)
      : super(_value, (v) => _then(v as _$Bard));

  @override
  _$Bard get _value => super._value as _$Bard;

  @override
  $Res call({
    Object? createdAt = freezed,
    Object? notes = freezed,
    Object? lyrics = freezed,
    Object? duration = freezed,
  }) {
    return _then(_$Bard(
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      notes: notes == freezed
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<Note>,
      lyrics: lyrics == freezed
          ? _value.lyrics
          : lyrics // ignore: cast_nullable_to_non_nullable
              as String,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$Bard extends Bard {
  _$Bard(
      {required this.createdAt,
      required this.notes,
      this.lyrics = '',
      this.duration = 0})
      : super._();

  factory _$Bard.fromJson(Map<String, dynamic> json) => _$$BardFromJson(json);

  @override
  DateTime createdAt;
  @override
  List<Note> notes;
  @override
  @JsonKey()
  String lyrics;
  @override
  @JsonKey()
  double duration;

  @override
  String toString() {
    return 'Bar(createdAt: $createdAt, notes: $notes, lyrics: $lyrics, duration: $duration)';
  }

  @JsonKey(ignore: true)
  @override
  _$$BardCopyWith<_$Bard> get copyWith =>
      __$$BardCopyWithImpl<_$Bard>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BardToJson(
      this,
    );
  }
}

abstract class Bard extends Bar {
  factory Bard(
      {required DateTime createdAt,
      required List<Note> notes,
      String lyrics,
      double duration}) = _$Bard;
  Bard._() : super._();

  factory Bard.fromJson(Map<String, dynamic> json) = _$Bard.fromJson;

  @override
  DateTime get createdAt;
  set createdAt(DateTime value);
  @override
  List<Note> get notes;
  set notes(List<Note> value);
  @override
  String get lyrics;
  set lyrics(String value);
  @override
  double get duration;
  set duration(double value);
  @override
  @JsonKey(ignore: true)
  _$$BardCopyWith<_$Bard> get copyWith => throw _privateConstructorUsedError;
}
