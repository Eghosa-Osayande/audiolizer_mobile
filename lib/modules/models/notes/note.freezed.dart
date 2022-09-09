// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'note.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Note _$NoteFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'music':
      return MusicNote.fromJson(json);
    case 'duration':
      return DurationNote.fromJson(json);
    case 'whiteSpace':
      return WhiteSpaceNote.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'Note',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$Note {
  DateTime get createdAt => throw _privateConstructorUsedError;
  set createdAt(DateTime value) => throw _privateConstructorUsedError;
  double? get startAt => throw _privateConstructorUsedError;
  set startAt(double? value) => throw _privateConstructorUsedError;
  double? get endAt => throw _privateConstructorUsedError;
  set endAt(double? value) => throw _privateConstructorUsedError;
  double get duration => throw _privateConstructorUsedError;
  set duration(double value) => throw _privateConstructorUsedError;
  double? get startAtInSeconds => throw _privateConstructorUsedError;
  set startAtInSeconds(double? value) => throw _privateConstructorUsedError;
  double? get endAtInSeconds => throw _privateConstructorUsedError;
  set endAtInSeconds(double? value) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Solfege solfa,
            int octave,
            DateTime createdAt,
            double? startAt,
            double? endAt,
            double duration,
            double? startAtInSeconds,
            double? endAtInSeconds)
        music,
    required TResult Function(
            DurationMarker marker,
            DateTime createdAt,
            double? startAt,
            double? endAt,
            double duration,
            double? startAtInSeconds,
            double? endAtInSeconds)
        duration,
    required TResult Function(
            DateTime createdAt,
            double? startAt,
            double? endAt,
            double duration,
            double? startAtInSeconds,
            double? endAtInSeconds)
        whiteSpace,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            Solfege solfa,
            int octave,
            DateTime createdAt,
            double? startAt,
            double? endAt,
            double duration,
            double? startAtInSeconds,
            double? endAtInSeconds)?
        music,
    TResult Function(
            DurationMarker marker,
            DateTime createdAt,
            double? startAt,
            double? endAt,
            double duration,
            double? startAtInSeconds,
            double? endAtInSeconds)?
        duration,
    TResult Function(DateTime createdAt, double? startAt, double? endAt,
            double duration, double? startAtInSeconds, double? endAtInSeconds)?
        whiteSpace,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            Solfege solfa,
            int octave,
            DateTime createdAt,
            double? startAt,
            double? endAt,
            double duration,
            double? startAtInSeconds,
            double? endAtInSeconds)?
        music,
    TResult Function(
            DurationMarker marker,
            DateTime createdAt,
            double? startAt,
            double? endAt,
            double duration,
            double? startAtInSeconds,
            double? endAtInSeconds)?
        duration,
    TResult Function(DateTime createdAt, double? startAt, double? endAt,
            double duration, double? startAtInSeconds, double? endAtInSeconds)?
        whiteSpace,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MusicNote value) music,
    required TResult Function(DurationNote value) duration,
    required TResult Function(WhiteSpaceNote value) whiteSpace,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MusicNote value)? music,
    TResult Function(DurationNote value)? duration,
    TResult Function(WhiteSpaceNote value)? whiteSpace,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MusicNote value)? music,
    TResult Function(DurationNote value)? duration,
    TResult Function(WhiteSpaceNote value)? whiteSpace,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NoteCopyWith<Note> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoteCopyWith<$Res> {
  factory $NoteCopyWith(Note value, $Res Function(Note) then) =
      _$NoteCopyWithImpl<$Res>;
  $Res call(
      {DateTime createdAt,
      double? startAt,
      double? endAt,
      double duration,
      double? startAtInSeconds,
      double? endAtInSeconds});
}

/// @nodoc
class _$NoteCopyWithImpl<$Res> implements $NoteCopyWith<$Res> {
  _$NoteCopyWithImpl(this._value, this._then);

  final Note _value;
  // ignore: unused_field
  final $Res Function(Note) _then;

  @override
  $Res call({
    Object? createdAt = freezed,
    Object? startAt = freezed,
    Object? endAt = freezed,
    Object? duration = freezed,
    Object? startAtInSeconds = freezed,
    Object? endAtInSeconds = freezed,
  }) {
    return _then(_value.copyWith(
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      startAt: startAt == freezed
          ? _value.startAt
          : startAt // ignore: cast_nullable_to_non_nullable
              as double?,
      endAt: endAt == freezed
          ? _value.endAt
          : endAt // ignore: cast_nullable_to_non_nullable
              as double?,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as double,
      startAtInSeconds: startAtInSeconds == freezed
          ? _value.startAtInSeconds
          : startAtInSeconds // ignore: cast_nullable_to_non_nullable
              as double?,
      endAtInSeconds: endAtInSeconds == freezed
          ? _value.endAtInSeconds
          : endAtInSeconds // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
abstract class _$$MusicNoteCopyWith<$Res> implements $NoteCopyWith<$Res> {
  factory _$$MusicNoteCopyWith(
          _$MusicNote value, $Res Function(_$MusicNote) then) =
      __$$MusicNoteCopyWithImpl<$Res>;
  @override
  $Res call(
      {Solfege solfa,
      int octave,
      DateTime createdAt,
      double? startAt,
      double? endAt,
      double duration,
      double? startAtInSeconds,
      double? endAtInSeconds});
}

/// @nodoc
class __$$MusicNoteCopyWithImpl<$Res> extends _$NoteCopyWithImpl<$Res>
    implements _$$MusicNoteCopyWith<$Res> {
  __$$MusicNoteCopyWithImpl(
      _$MusicNote _value, $Res Function(_$MusicNote) _then)
      : super(_value, (v) => _then(v as _$MusicNote));

  @override
  _$MusicNote get _value => super._value as _$MusicNote;

  @override
  $Res call({
    Object? solfa = freezed,
    Object? octave = freezed,
    Object? createdAt = freezed,
    Object? startAt = freezed,
    Object? endAt = freezed,
    Object? duration = freezed,
    Object? startAtInSeconds = freezed,
    Object? endAtInSeconds = freezed,
  }) {
    return _then(_$MusicNote(
      solfa: solfa == freezed
          ? _value.solfa
          : solfa // ignore: cast_nullable_to_non_nullable
              as Solfege,
      octave: octave == freezed
          ? _value.octave
          : octave // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      startAt: startAt == freezed
          ? _value.startAt
          : startAt // ignore: cast_nullable_to_non_nullable
              as double?,
      endAt: endAt == freezed
          ? _value.endAt
          : endAt // ignore: cast_nullable_to_non_nullable
              as double?,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as double,
      startAtInSeconds: startAtInSeconds == freezed
          ? _value.startAtInSeconds
          : startAtInSeconds // ignore: cast_nullable_to_non_nullable
              as double?,
      endAtInSeconds: endAtInSeconds == freezed
          ? _value.endAtInSeconds
          : endAtInSeconds // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$MusicNote extends MusicNote {
  _$MusicNote(
      {required this.solfa,
      required this.octave,
      required this.createdAt,
      this.startAt,
      this.endAt,
      this.duration = 0,
      this.startAtInSeconds,
      this.endAtInSeconds,
      final String? $type})
      : $type = $type ?? 'music',
        super._();

  factory _$MusicNote.fromJson(Map<String, dynamic> json) =>
      _$$MusicNoteFromJson(json);

  @override
  Solfege solfa;
  @override
  int octave;
  @override
  DateTime createdAt;
  @override
  double? startAt;
  @override
  double? endAt;
  @override
  @JsonKey()
  double duration;
  @override
  double? startAtInSeconds;
  @override
  double? endAtInSeconds;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @JsonKey(ignore: true)
  @override
  _$$MusicNoteCopyWith<_$MusicNote> get copyWith =>
      __$$MusicNoteCopyWithImpl<_$MusicNote>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Solfege solfa,
            int octave,
            DateTime createdAt,
            double? startAt,
            double? endAt,
            double duration,
            double? startAtInSeconds,
            double? endAtInSeconds)
        music,
    required TResult Function(
            DurationMarker marker,
            DateTime createdAt,
            double? startAt,
            double? endAt,
            double duration,
            double? startAtInSeconds,
            double? endAtInSeconds)
        duration,
    required TResult Function(
            DateTime createdAt,
            double? startAt,
            double? endAt,
            double duration,
            double? startAtInSeconds,
            double? endAtInSeconds)
        whiteSpace,
  }) {
    return music(solfa, octave, createdAt, startAt, endAt, this.duration,
        startAtInSeconds, endAtInSeconds);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            Solfege solfa,
            int octave,
            DateTime createdAt,
            double? startAt,
            double? endAt,
            double duration,
            double? startAtInSeconds,
            double? endAtInSeconds)?
        music,
    TResult Function(
            DurationMarker marker,
            DateTime createdAt,
            double? startAt,
            double? endAt,
            double duration,
            double? startAtInSeconds,
            double? endAtInSeconds)?
        duration,
    TResult Function(DateTime createdAt, double? startAt, double? endAt,
            double duration, double? startAtInSeconds, double? endAtInSeconds)?
        whiteSpace,
  }) {
    return music?.call(solfa, octave, createdAt, startAt, endAt, this.duration,
        startAtInSeconds, endAtInSeconds);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            Solfege solfa,
            int octave,
            DateTime createdAt,
            double? startAt,
            double? endAt,
            double duration,
            double? startAtInSeconds,
            double? endAtInSeconds)?
        music,
    TResult Function(
            DurationMarker marker,
            DateTime createdAt,
            double? startAt,
            double? endAt,
            double duration,
            double? startAtInSeconds,
            double? endAtInSeconds)?
        duration,
    TResult Function(DateTime createdAt, double? startAt, double? endAt,
            double duration, double? startAtInSeconds, double? endAtInSeconds)?
        whiteSpace,
    required TResult orElse(),
  }) {
    if (music != null) {
      return music(solfa, octave, createdAt, startAt, endAt, this.duration,
          startAtInSeconds, endAtInSeconds);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MusicNote value) music,
    required TResult Function(DurationNote value) duration,
    required TResult Function(WhiteSpaceNote value) whiteSpace,
  }) {
    return music(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MusicNote value)? music,
    TResult Function(DurationNote value)? duration,
    TResult Function(WhiteSpaceNote value)? whiteSpace,
  }) {
    return music?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MusicNote value)? music,
    TResult Function(DurationNote value)? duration,
    TResult Function(WhiteSpaceNote value)? whiteSpace,
    required TResult orElse(),
  }) {
    if (music != null) {
      return music(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$MusicNoteToJson(
      this,
    );
  }
}

abstract class MusicNote extends Note {
  factory MusicNote(
      {required Solfege solfa,
      required int octave,
      required DateTime createdAt,
      double? startAt,
      double? endAt,
      double duration,
      double? startAtInSeconds,
      double? endAtInSeconds}) = _$MusicNote;
  MusicNote._() : super._();

  factory MusicNote.fromJson(Map<String, dynamic> json) = _$MusicNote.fromJson;

  Solfege get solfa;
  set solfa(Solfege value);
  int get octave;
  set octave(int value);
  @override
  DateTime get createdAt;
  set createdAt(DateTime value);
  @override
  double? get startAt;
  set startAt(double? value);
  @override
  double? get endAt;
  set endAt(double? value);
  @override
  double get duration;
  set duration(double value);
  @override
  double? get startAtInSeconds;
  set startAtInSeconds(double? value);
  @override
  double? get endAtInSeconds;
  set endAtInSeconds(double? value);
  @override
  @JsonKey(ignore: true)
  _$$MusicNoteCopyWith<_$MusicNote> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DurationNoteCopyWith<$Res> implements $NoteCopyWith<$Res> {
  factory _$$DurationNoteCopyWith(
          _$DurationNote value, $Res Function(_$DurationNote) then) =
      __$$DurationNoteCopyWithImpl<$Res>;
  @override
  $Res call(
      {DurationMarker marker,
      DateTime createdAt,
      double? startAt,
      double? endAt,
      double duration,
      double? startAtInSeconds,
      double? endAtInSeconds});
}

/// @nodoc
class __$$DurationNoteCopyWithImpl<$Res> extends _$NoteCopyWithImpl<$Res>
    implements _$$DurationNoteCopyWith<$Res> {
  __$$DurationNoteCopyWithImpl(
      _$DurationNote _value, $Res Function(_$DurationNote) _then)
      : super(_value, (v) => _then(v as _$DurationNote));

  @override
  _$DurationNote get _value => super._value as _$DurationNote;

  @override
  $Res call({
    Object? marker = freezed,
    Object? createdAt = freezed,
    Object? startAt = freezed,
    Object? endAt = freezed,
    Object? duration = freezed,
    Object? startAtInSeconds = freezed,
    Object? endAtInSeconds = freezed,
  }) {
    return _then(_$DurationNote(
      marker: marker == freezed
          ? _value.marker
          : marker // ignore: cast_nullable_to_non_nullable
              as DurationMarker,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      startAt: startAt == freezed
          ? _value.startAt
          : startAt // ignore: cast_nullable_to_non_nullable
              as double?,
      endAt: endAt == freezed
          ? _value.endAt
          : endAt // ignore: cast_nullable_to_non_nullable
              as double?,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as double,
      startAtInSeconds: startAtInSeconds == freezed
          ? _value.startAtInSeconds
          : startAtInSeconds // ignore: cast_nullable_to_non_nullable
              as double?,
      endAtInSeconds: endAtInSeconds == freezed
          ? _value.endAtInSeconds
          : endAtInSeconds // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$DurationNote extends DurationNote {
  _$DurationNote(
      {required this.marker,
      required this.createdAt,
      this.startAt,
      this.endAt,
      this.duration = 0,
      this.startAtInSeconds,
      this.endAtInSeconds,
      final String? $type})
      : $type = $type ?? 'duration',
        super._();

  factory _$DurationNote.fromJson(Map<String, dynamic> json) =>
      _$$DurationNoteFromJson(json);

  @override
  DurationMarker marker;
  @override
  DateTime createdAt;
  @override
  double? startAt;
  @override
  double? endAt;
  @override
  @JsonKey()
  double duration;
  @override
  double? startAtInSeconds;
  @override
  double? endAtInSeconds;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @JsonKey(ignore: true)
  @override
  _$$DurationNoteCopyWith<_$DurationNote> get copyWith =>
      __$$DurationNoteCopyWithImpl<_$DurationNote>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Solfege solfa,
            int octave,
            DateTime createdAt,
            double? startAt,
            double? endAt,
            double duration,
            double? startAtInSeconds,
            double? endAtInSeconds)
        music,
    required TResult Function(
            DurationMarker marker,
            DateTime createdAt,
            double? startAt,
            double? endAt,
            double duration,
            double? startAtInSeconds,
            double? endAtInSeconds)
        duration,
    required TResult Function(
            DateTime createdAt,
            double? startAt,
            double? endAt,
            double duration,
            double? startAtInSeconds,
            double? endAtInSeconds)
        whiteSpace,
  }) {
    return duration(marker, createdAt, startAt, endAt, this.duration,
        startAtInSeconds, endAtInSeconds);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            Solfege solfa,
            int octave,
            DateTime createdAt,
            double? startAt,
            double? endAt,
            double duration,
            double? startAtInSeconds,
            double? endAtInSeconds)?
        music,
    TResult Function(
            DurationMarker marker,
            DateTime createdAt,
            double? startAt,
            double? endAt,
            double duration,
            double? startAtInSeconds,
            double? endAtInSeconds)?
        duration,
    TResult Function(DateTime createdAt, double? startAt, double? endAt,
            double duration, double? startAtInSeconds, double? endAtInSeconds)?
        whiteSpace,
  }) {
    return duration?.call(marker, createdAt, startAt, endAt, this.duration,
        startAtInSeconds, endAtInSeconds);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            Solfege solfa,
            int octave,
            DateTime createdAt,
            double? startAt,
            double? endAt,
            double duration,
            double? startAtInSeconds,
            double? endAtInSeconds)?
        music,
    TResult Function(
            DurationMarker marker,
            DateTime createdAt,
            double? startAt,
            double? endAt,
            double duration,
            double? startAtInSeconds,
            double? endAtInSeconds)?
        duration,
    TResult Function(DateTime createdAt, double? startAt, double? endAt,
            double duration, double? startAtInSeconds, double? endAtInSeconds)?
        whiteSpace,
    required TResult orElse(),
  }) {
    if (duration != null) {
      return duration(marker, createdAt, startAt, endAt, this.duration,
          startAtInSeconds, endAtInSeconds);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MusicNote value) music,
    required TResult Function(DurationNote value) duration,
    required TResult Function(WhiteSpaceNote value) whiteSpace,
  }) {
    return duration(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MusicNote value)? music,
    TResult Function(DurationNote value)? duration,
    TResult Function(WhiteSpaceNote value)? whiteSpace,
  }) {
    return duration?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MusicNote value)? music,
    TResult Function(DurationNote value)? duration,
    TResult Function(WhiteSpaceNote value)? whiteSpace,
    required TResult orElse(),
  }) {
    if (duration != null) {
      return duration(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DurationNoteToJson(
      this,
    );
  }
}

abstract class DurationNote extends Note {
  factory DurationNote(
      {required DurationMarker marker,
      required DateTime createdAt,
      double? startAt,
      double? endAt,
      double duration,
      double? startAtInSeconds,
      double? endAtInSeconds}) = _$DurationNote;
  DurationNote._() : super._();

  factory DurationNote.fromJson(Map<String, dynamic> json) =
      _$DurationNote.fromJson;

  DurationMarker get marker;
  set marker(DurationMarker value);
  @override
  DateTime get createdAt;
  set createdAt(DateTime value);
  @override
  double? get startAt;
  set startAt(double? value);
  @override
  double? get endAt;
  set endAt(double? value);
  @override
  double get duration;
  set duration(double value);
  @override
  double? get startAtInSeconds;
  set startAtInSeconds(double? value);
  @override
  double? get endAtInSeconds;
  set endAtInSeconds(double? value);
  @override
  @JsonKey(ignore: true)
  _$$DurationNoteCopyWith<_$DurationNote> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WhiteSpaceNoteCopyWith<$Res> implements $NoteCopyWith<$Res> {
  factory _$$WhiteSpaceNoteCopyWith(
          _$WhiteSpaceNote value, $Res Function(_$WhiteSpaceNote) then) =
      __$$WhiteSpaceNoteCopyWithImpl<$Res>;
  @override
  $Res call(
      {DateTime createdAt,
      double? startAt,
      double? endAt,
      double duration,
      double? startAtInSeconds,
      double? endAtInSeconds});
}

/// @nodoc
class __$$WhiteSpaceNoteCopyWithImpl<$Res> extends _$NoteCopyWithImpl<$Res>
    implements _$$WhiteSpaceNoteCopyWith<$Res> {
  __$$WhiteSpaceNoteCopyWithImpl(
      _$WhiteSpaceNote _value, $Res Function(_$WhiteSpaceNote) _then)
      : super(_value, (v) => _then(v as _$WhiteSpaceNote));

  @override
  _$WhiteSpaceNote get _value => super._value as _$WhiteSpaceNote;

  @override
  $Res call({
    Object? createdAt = freezed,
    Object? startAt = freezed,
    Object? endAt = freezed,
    Object? duration = freezed,
    Object? startAtInSeconds = freezed,
    Object? endAtInSeconds = freezed,
  }) {
    return _then(_$WhiteSpaceNote(
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      startAt: startAt == freezed
          ? _value.startAt
          : startAt // ignore: cast_nullable_to_non_nullable
              as double?,
      endAt: endAt == freezed
          ? _value.endAt
          : endAt // ignore: cast_nullable_to_non_nullable
              as double?,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as double,
      startAtInSeconds: startAtInSeconds == freezed
          ? _value.startAtInSeconds
          : startAtInSeconds // ignore: cast_nullable_to_non_nullable
              as double?,
      endAtInSeconds: endAtInSeconds == freezed
          ? _value.endAtInSeconds
          : endAtInSeconds // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$WhiteSpaceNote extends WhiteSpaceNote {
  _$WhiteSpaceNote(
      {required this.createdAt,
      this.startAt,
      this.endAt,
      this.duration = 0,
      this.startAtInSeconds,
      this.endAtInSeconds,
      final String? $type})
      : $type = $type ?? 'whiteSpace',
        super._();

  factory _$WhiteSpaceNote.fromJson(Map<String, dynamic> json) =>
      _$$WhiteSpaceNoteFromJson(json);

  @override
  DateTime createdAt;
  @override
  double? startAt;
  @override
  double? endAt;
  @override
  @JsonKey()
  double duration;
  @override
  double? startAtInSeconds;
  @override
  double? endAtInSeconds;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @JsonKey(ignore: true)
  @override
  _$$WhiteSpaceNoteCopyWith<_$WhiteSpaceNote> get copyWith =>
      __$$WhiteSpaceNoteCopyWithImpl<_$WhiteSpaceNote>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Solfege solfa,
            int octave,
            DateTime createdAt,
            double? startAt,
            double? endAt,
            double duration,
            double? startAtInSeconds,
            double? endAtInSeconds)
        music,
    required TResult Function(
            DurationMarker marker,
            DateTime createdAt,
            double? startAt,
            double? endAt,
            double duration,
            double? startAtInSeconds,
            double? endAtInSeconds)
        duration,
    required TResult Function(
            DateTime createdAt,
            double? startAt,
            double? endAt,
            double duration,
            double? startAtInSeconds,
            double? endAtInSeconds)
        whiteSpace,
  }) {
    return whiteSpace(createdAt, startAt, endAt, this.duration,
        startAtInSeconds, endAtInSeconds);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            Solfege solfa,
            int octave,
            DateTime createdAt,
            double? startAt,
            double? endAt,
            double duration,
            double? startAtInSeconds,
            double? endAtInSeconds)?
        music,
    TResult Function(
            DurationMarker marker,
            DateTime createdAt,
            double? startAt,
            double? endAt,
            double duration,
            double? startAtInSeconds,
            double? endAtInSeconds)?
        duration,
    TResult Function(DateTime createdAt, double? startAt, double? endAt,
            double duration, double? startAtInSeconds, double? endAtInSeconds)?
        whiteSpace,
  }) {
    return whiteSpace?.call(createdAt, startAt, endAt, this.duration,
        startAtInSeconds, endAtInSeconds);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            Solfege solfa,
            int octave,
            DateTime createdAt,
            double? startAt,
            double? endAt,
            double duration,
            double? startAtInSeconds,
            double? endAtInSeconds)?
        music,
    TResult Function(
            DurationMarker marker,
            DateTime createdAt,
            double? startAt,
            double? endAt,
            double duration,
            double? startAtInSeconds,
            double? endAtInSeconds)?
        duration,
    TResult Function(DateTime createdAt, double? startAt, double? endAt,
            double duration, double? startAtInSeconds, double? endAtInSeconds)?
        whiteSpace,
    required TResult orElse(),
  }) {
    if (whiteSpace != null) {
      return whiteSpace(createdAt, startAt, endAt, this.duration,
          startAtInSeconds, endAtInSeconds);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MusicNote value) music,
    required TResult Function(DurationNote value) duration,
    required TResult Function(WhiteSpaceNote value) whiteSpace,
  }) {
    return whiteSpace(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MusicNote value)? music,
    TResult Function(DurationNote value)? duration,
    TResult Function(WhiteSpaceNote value)? whiteSpace,
  }) {
    return whiteSpace?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MusicNote value)? music,
    TResult Function(DurationNote value)? duration,
    TResult Function(WhiteSpaceNote value)? whiteSpace,
    required TResult orElse(),
  }) {
    if (whiteSpace != null) {
      return whiteSpace(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$WhiteSpaceNoteToJson(
      this,
    );
  }
}

abstract class WhiteSpaceNote extends Note {
  factory WhiteSpaceNote(
      {required DateTime createdAt,
      double? startAt,
      double? endAt,
      double duration,
      double? startAtInSeconds,
      double? endAtInSeconds}) = _$WhiteSpaceNote;
  WhiteSpaceNote._() : super._();

  factory WhiteSpaceNote.fromJson(Map<String, dynamic> json) =
      _$WhiteSpaceNote.fromJson;

  @override
  DateTime get createdAt;
  set createdAt(DateTime value);
  @override
  double? get startAt;
  set startAt(double? value);
  @override
  double? get endAt;
  set endAt(double? value);
  @override
  double get duration;
  set duration(double value);
  @override
  double? get startAtInSeconds;
  set startAtInSeconds(double? value);
  @override
  double? get endAtInSeconds;
  set endAtInSeconds(double? value);
  @override
  @JsonKey(ignore: true)
  _$$WhiteSpaceNoteCopyWith<_$WhiteSpaceNote> get copyWith =>
      throw _privateConstructorUsedError;
}
