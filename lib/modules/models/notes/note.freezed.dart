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
    case 'trackConfig':
      return TrackConfigNote.fromJson(json);
    case 'scoreConfig':
      return ScoreConfigNote.fromJson(json);

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
  @JsonKey(ignore: true)
  ScoreConfigNote? get intialScoreConfigNote =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  set intialScoreConfigNote(ScoreConfigNote? value) =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  TrackConfigNote? get intialTrackConfigNote =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  set intialTrackConfigNote(TrackConfigNote? value) =>
      throw _privateConstructorUsedError;
  double? get startAtInSeconds => throw _privateConstructorUsedError;
  set startAtInSeconds(double? value) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Solfege solfa,
            int octave,
            DateTime createdAt,
            double? startAt,
            double? endAt,
            double duration,
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)
        music,
    required TResult Function(
            DurationMarker marker,
            DateTime createdAt,
            double? startAt,
            double? endAt,
            double duration,
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)
        duration,
    required TResult Function(
            DateTime createdAt,
            double? startAt,
            double? endAt,
            double duration,
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)
        whiteSpace,
    required TResult Function(
            int volume,
            int program,
            DateTime createdAt,
            double? startAt,
            double? endAt,
            double duration,
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)
        trackConfig,
    required TResult Function(
            DateTime createdAt,
            int bpm,
            TimeSignature timeSignature,
            KeySignature keySignature,
            int tonicPitchNumber,
            String scoreTitle,
            double? startAt,
            double? endAt,
            double duration,
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)
        scoreConfig,
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
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)?
        music,
    TResult Function(
            DurationMarker marker,
            DateTime createdAt,
            double? startAt,
            double? endAt,
            double duration,
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)?
        duration,
    TResult Function(
            DateTime createdAt,
            double? startAt,
            double? endAt,
            double duration,
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)?
        whiteSpace,
    TResult Function(
            int volume,
            int program,
            DateTime createdAt,
            double? startAt,
            double? endAt,
            double duration,
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)?
        trackConfig,
    TResult Function(
            DateTime createdAt,
            int bpm,
            TimeSignature timeSignature,
            KeySignature keySignature,
            int tonicPitchNumber,
            String scoreTitle,
            double? startAt,
            double? endAt,
            double duration,
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)?
        scoreConfig,
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
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)?
        music,
    TResult Function(
            DurationMarker marker,
            DateTime createdAt,
            double? startAt,
            double? endAt,
            double duration,
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)?
        duration,
    TResult Function(
            DateTime createdAt,
            double? startAt,
            double? endAt,
            double duration,
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)?
        whiteSpace,
    TResult Function(
            int volume,
            int program,
            DateTime createdAt,
            double? startAt,
            double? endAt,
            double duration,
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)?
        trackConfig,
    TResult Function(
            DateTime createdAt,
            int bpm,
            TimeSignature timeSignature,
            KeySignature keySignature,
            int tonicPitchNumber,
            String scoreTitle,
            double? startAt,
            double? endAt,
            double duration,
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)?
        scoreConfig,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MusicNote value) music,
    required TResult Function(DurationNote value) duration,
    required TResult Function(WhiteSpaceNote value) whiteSpace,
    required TResult Function(TrackConfigNote value) trackConfig,
    required TResult Function(ScoreConfigNote value) scoreConfig,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MusicNote value)? music,
    TResult Function(DurationNote value)? duration,
    TResult Function(WhiteSpaceNote value)? whiteSpace,
    TResult Function(TrackConfigNote value)? trackConfig,
    TResult Function(ScoreConfigNote value)? scoreConfig,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MusicNote value)? music,
    TResult Function(DurationNote value)? duration,
    TResult Function(WhiteSpaceNote value)? whiteSpace,
    TResult Function(TrackConfigNote value)? trackConfig,
    TResult Function(ScoreConfigNote value)? scoreConfig,
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
      @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
      @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
      double? startAtInSeconds});
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
    Object? intialScoreConfigNote = freezed,
    Object? intialTrackConfigNote = freezed,
    Object? startAtInSeconds = freezed,
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
      intialScoreConfigNote: intialScoreConfigNote == freezed
          ? _value.intialScoreConfigNote
          : intialScoreConfigNote // ignore: cast_nullable_to_non_nullable
              as ScoreConfigNote?,
      intialTrackConfigNote: intialTrackConfigNote == freezed
          ? _value.intialTrackConfigNote
          : intialTrackConfigNote // ignore: cast_nullable_to_non_nullable
              as TrackConfigNote?,
      startAtInSeconds: startAtInSeconds == freezed
          ? _value.startAtInSeconds
          : startAtInSeconds // ignore: cast_nullable_to_non_nullable
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
      @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
      @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
      double? startAtInSeconds});
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
    Object? intialScoreConfigNote = freezed,
    Object? intialTrackConfigNote = freezed,
    Object? startAtInSeconds = freezed,
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
      intialScoreConfigNote: intialScoreConfigNote == freezed
          ? _value.intialScoreConfigNote
          : intialScoreConfigNote // ignore: cast_nullable_to_non_nullable
              as ScoreConfigNote?,
      intialTrackConfigNote: intialTrackConfigNote == freezed
          ? _value.intialTrackConfigNote
          : intialTrackConfigNote // ignore: cast_nullable_to_non_nullable
              as TrackConfigNote?,
      startAtInSeconds: startAtInSeconds == freezed
          ? _value.startAtInSeconds
          : startAtInSeconds // ignore: cast_nullable_to_non_nullable
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
      @JsonKey(ignore: true) this.intialScoreConfigNote,
      @JsonKey(ignore: true) this.intialTrackConfigNote,
      this.startAtInSeconds,
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
  @JsonKey(ignore: true)
  ScoreConfigNote? intialScoreConfigNote;
  @override
  @JsonKey(ignore: true)
  TrackConfigNote? intialTrackConfigNote;
  @override
  double? startAtInSeconds;

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
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)
        music,
    required TResult Function(
            DurationMarker marker,
            DateTime createdAt,
            double? startAt,
            double? endAt,
            double duration,
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)
        duration,
    required TResult Function(
            DateTime createdAt,
            double? startAt,
            double? endAt,
            double duration,
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)
        whiteSpace,
    required TResult Function(
            int volume,
            int program,
            DateTime createdAt,
            double? startAt,
            double? endAt,
            double duration,
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)
        trackConfig,
    required TResult Function(
            DateTime createdAt,
            int bpm,
            TimeSignature timeSignature,
            KeySignature keySignature,
            int tonicPitchNumber,
            String scoreTitle,
            double? startAt,
            double? endAt,
            double duration,
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)
        scoreConfig,
  }) {
    return music(solfa, octave, createdAt, startAt, endAt, this.duration,
        intialScoreConfigNote, intialTrackConfigNote, startAtInSeconds);
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
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)?
        music,
    TResult Function(
            DurationMarker marker,
            DateTime createdAt,
            double? startAt,
            double? endAt,
            double duration,
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)?
        duration,
    TResult Function(
            DateTime createdAt,
            double? startAt,
            double? endAt,
            double duration,
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)?
        whiteSpace,
    TResult Function(
            int volume,
            int program,
            DateTime createdAt,
            double? startAt,
            double? endAt,
            double duration,
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)?
        trackConfig,
    TResult Function(
            DateTime createdAt,
            int bpm,
            TimeSignature timeSignature,
            KeySignature keySignature,
            int tonicPitchNumber,
            String scoreTitle,
            double? startAt,
            double? endAt,
            double duration,
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)?
        scoreConfig,
  }) {
    return music?.call(solfa, octave, createdAt, startAt, endAt, this.duration,
        intialScoreConfigNote, intialTrackConfigNote, startAtInSeconds);
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
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)?
        music,
    TResult Function(
            DurationMarker marker,
            DateTime createdAt,
            double? startAt,
            double? endAt,
            double duration,
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)?
        duration,
    TResult Function(
            DateTime createdAt,
            double? startAt,
            double? endAt,
            double duration,
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)?
        whiteSpace,
    TResult Function(
            int volume,
            int program,
            DateTime createdAt,
            double? startAt,
            double? endAt,
            double duration,
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)?
        trackConfig,
    TResult Function(
            DateTime createdAt,
            int bpm,
            TimeSignature timeSignature,
            KeySignature keySignature,
            int tonicPitchNumber,
            String scoreTitle,
            double? startAt,
            double? endAt,
            double duration,
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)?
        scoreConfig,
    required TResult orElse(),
  }) {
    if (music != null) {
      return music(solfa, octave, createdAt, startAt, endAt, this.duration,
          intialScoreConfigNote, intialTrackConfigNote, startAtInSeconds);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MusicNote value) music,
    required TResult Function(DurationNote value) duration,
    required TResult Function(WhiteSpaceNote value) whiteSpace,
    required TResult Function(TrackConfigNote value) trackConfig,
    required TResult Function(ScoreConfigNote value) scoreConfig,
  }) {
    return music(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MusicNote value)? music,
    TResult Function(DurationNote value)? duration,
    TResult Function(WhiteSpaceNote value)? whiteSpace,
    TResult Function(TrackConfigNote value)? trackConfig,
    TResult Function(ScoreConfigNote value)? scoreConfig,
  }) {
    return music?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MusicNote value)? music,
    TResult Function(DurationNote value)? duration,
    TResult Function(WhiteSpaceNote value)? whiteSpace,
    TResult Function(TrackConfigNote value)? trackConfig,
    TResult Function(ScoreConfigNote value)? scoreConfig,
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
      @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
      @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
      double? startAtInSeconds}) = _$MusicNote;
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
  @JsonKey(ignore: true)
  ScoreConfigNote? get intialScoreConfigNote;
  @JsonKey(ignore: true)
  set intialScoreConfigNote(ScoreConfigNote? value);
  @override
  @JsonKey(ignore: true)
  TrackConfigNote? get intialTrackConfigNote;
  @JsonKey(ignore: true)
  set intialTrackConfigNote(TrackConfigNote? value);
  @override
  double? get startAtInSeconds;
  set startAtInSeconds(double? value);
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
      @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
      @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
      double? startAtInSeconds});
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
    Object? intialScoreConfigNote = freezed,
    Object? intialTrackConfigNote = freezed,
    Object? startAtInSeconds = freezed,
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
      intialScoreConfigNote: intialScoreConfigNote == freezed
          ? _value.intialScoreConfigNote
          : intialScoreConfigNote // ignore: cast_nullable_to_non_nullable
              as ScoreConfigNote?,
      intialTrackConfigNote: intialTrackConfigNote == freezed
          ? _value.intialTrackConfigNote
          : intialTrackConfigNote // ignore: cast_nullable_to_non_nullable
              as TrackConfigNote?,
      startAtInSeconds: startAtInSeconds == freezed
          ? _value.startAtInSeconds
          : startAtInSeconds // ignore: cast_nullable_to_non_nullable
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
      @JsonKey(ignore: true) this.intialScoreConfigNote,
      @JsonKey(ignore: true) this.intialTrackConfigNote,
      this.startAtInSeconds,
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
  @JsonKey(ignore: true)
  ScoreConfigNote? intialScoreConfigNote;
  @override
  @JsonKey(ignore: true)
  TrackConfigNote? intialTrackConfigNote;
  @override
  double? startAtInSeconds;

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
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)
        music,
    required TResult Function(
            DurationMarker marker,
            DateTime createdAt,
            double? startAt,
            double? endAt,
            double duration,
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)
        duration,
    required TResult Function(
            DateTime createdAt,
            double? startAt,
            double? endAt,
            double duration,
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)
        whiteSpace,
    required TResult Function(
            int volume,
            int program,
            DateTime createdAt,
            double? startAt,
            double? endAt,
            double duration,
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)
        trackConfig,
    required TResult Function(
            DateTime createdAt,
            int bpm,
            TimeSignature timeSignature,
            KeySignature keySignature,
            int tonicPitchNumber,
            String scoreTitle,
            double? startAt,
            double? endAt,
            double duration,
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)
        scoreConfig,
  }) {
    return duration(marker, createdAt, startAt, endAt, this.duration,
        intialScoreConfigNote, intialTrackConfigNote, startAtInSeconds);
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
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)?
        music,
    TResult Function(
            DurationMarker marker,
            DateTime createdAt,
            double? startAt,
            double? endAt,
            double duration,
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)?
        duration,
    TResult Function(
            DateTime createdAt,
            double? startAt,
            double? endAt,
            double duration,
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)?
        whiteSpace,
    TResult Function(
            int volume,
            int program,
            DateTime createdAt,
            double? startAt,
            double? endAt,
            double duration,
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)?
        trackConfig,
    TResult Function(
            DateTime createdAt,
            int bpm,
            TimeSignature timeSignature,
            KeySignature keySignature,
            int tonicPitchNumber,
            String scoreTitle,
            double? startAt,
            double? endAt,
            double duration,
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)?
        scoreConfig,
  }) {
    return duration?.call(marker, createdAt, startAt, endAt, this.duration,
        intialScoreConfigNote, intialTrackConfigNote, startAtInSeconds);
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
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)?
        music,
    TResult Function(
            DurationMarker marker,
            DateTime createdAt,
            double? startAt,
            double? endAt,
            double duration,
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)?
        duration,
    TResult Function(
            DateTime createdAt,
            double? startAt,
            double? endAt,
            double duration,
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)?
        whiteSpace,
    TResult Function(
            int volume,
            int program,
            DateTime createdAt,
            double? startAt,
            double? endAt,
            double duration,
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)?
        trackConfig,
    TResult Function(
            DateTime createdAt,
            int bpm,
            TimeSignature timeSignature,
            KeySignature keySignature,
            int tonicPitchNumber,
            String scoreTitle,
            double? startAt,
            double? endAt,
            double duration,
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)?
        scoreConfig,
    required TResult orElse(),
  }) {
    if (duration != null) {
      return duration(marker, createdAt, startAt, endAt, this.duration,
          intialScoreConfigNote, intialTrackConfigNote, startAtInSeconds);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MusicNote value) music,
    required TResult Function(DurationNote value) duration,
    required TResult Function(WhiteSpaceNote value) whiteSpace,
    required TResult Function(TrackConfigNote value) trackConfig,
    required TResult Function(ScoreConfigNote value) scoreConfig,
  }) {
    return duration(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MusicNote value)? music,
    TResult Function(DurationNote value)? duration,
    TResult Function(WhiteSpaceNote value)? whiteSpace,
    TResult Function(TrackConfigNote value)? trackConfig,
    TResult Function(ScoreConfigNote value)? scoreConfig,
  }) {
    return duration?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MusicNote value)? music,
    TResult Function(DurationNote value)? duration,
    TResult Function(WhiteSpaceNote value)? whiteSpace,
    TResult Function(TrackConfigNote value)? trackConfig,
    TResult Function(ScoreConfigNote value)? scoreConfig,
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
      @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
      @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
      double? startAtInSeconds}) = _$DurationNote;
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
  @JsonKey(ignore: true)
  ScoreConfigNote? get intialScoreConfigNote;
  @JsonKey(ignore: true)
  set intialScoreConfigNote(ScoreConfigNote? value);
  @override
  @JsonKey(ignore: true)
  TrackConfigNote? get intialTrackConfigNote;
  @JsonKey(ignore: true)
  set intialTrackConfigNote(TrackConfigNote? value);
  @override
  double? get startAtInSeconds;
  set startAtInSeconds(double? value);
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
      @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
      @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
      double? startAtInSeconds});
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
    Object? intialScoreConfigNote = freezed,
    Object? intialTrackConfigNote = freezed,
    Object? startAtInSeconds = freezed,
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
      intialScoreConfigNote: intialScoreConfigNote == freezed
          ? _value.intialScoreConfigNote
          : intialScoreConfigNote // ignore: cast_nullable_to_non_nullable
              as ScoreConfigNote?,
      intialTrackConfigNote: intialTrackConfigNote == freezed
          ? _value.intialTrackConfigNote
          : intialTrackConfigNote // ignore: cast_nullable_to_non_nullable
              as TrackConfigNote?,
      startAtInSeconds: startAtInSeconds == freezed
          ? _value.startAtInSeconds
          : startAtInSeconds // ignore: cast_nullable_to_non_nullable
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
      @JsonKey(ignore: true) this.intialScoreConfigNote,
      @JsonKey(ignore: true) this.intialTrackConfigNote,
      this.startAtInSeconds,
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
  @JsonKey(ignore: true)
  ScoreConfigNote? intialScoreConfigNote;
  @override
  @JsonKey(ignore: true)
  TrackConfigNote? intialTrackConfigNote;
  @override
  double? startAtInSeconds;

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
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)
        music,
    required TResult Function(
            DurationMarker marker,
            DateTime createdAt,
            double? startAt,
            double? endAt,
            double duration,
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)
        duration,
    required TResult Function(
            DateTime createdAt,
            double? startAt,
            double? endAt,
            double duration,
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)
        whiteSpace,
    required TResult Function(
            int volume,
            int program,
            DateTime createdAt,
            double? startAt,
            double? endAt,
            double duration,
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)
        trackConfig,
    required TResult Function(
            DateTime createdAt,
            int bpm,
            TimeSignature timeSignature,
            KeySignature keySignature,
            int tonicPitchNumber,
            String scoreTitle,
            double? startAt,
            double? endAt,
            double duration,
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)
        scoreConfig,
  }) {
    return whiteSpace(createdAt, startAt, endAt, this.duration,
        intialScoreConfigNote, intialTrackConfigNote, startAtInSeconds);
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
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)?
        music,
    TResult Function(
            DurationMarker marker,
            DateTime createdAt,
            double? startAt,
            double? endAt,
            double duration,
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)?
        duration,
    TResult Function(
            DateTime createdAt,
            double? startAt,
            double? endAt,
            double duration,
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)?
        whiteSpace,
    TResult Function(
            int volume,
            int program,
            DateTime createdAt,
            double? startAt,
            double? endAt,
            double duration,
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)?
        trackConfig,
    TResult Function(
            DateTime createdAt,
            int bpm,
            TimeSignature timeSignature,
            KeySignature keySignature,
            int tonicPitchNumber,
            String scoreTitle,
            double? startAt,
            double? endAt,
            double duration,
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)?
        scoreConfig,
  }) {
    return whiteSpace?.call(createdAt, startAt, endAt, this.duration,
        intialScoreConfigNote, intialTrackConfigNote, startAtInSeconds);
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
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)?
        music,
    TResult Function(
            DurationMarker marker,
            DateTime createdAt,
            double? startAt,
            double? endAt,
            double duration,
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)?
        duration,
    TResult Function(
            DateTime createdAt,
            double? startAt,
            double? endAt,
            double duration,
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)?
        whiteSpace,
    TResult Function(
            int volume,
            int program,
            DateTime createdAt,
            double? startAt,
            double? endAt,
            double duration,
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)?
        trackConfig,
    TResult Function(
            DateTime createdAt,
            int bpm,
            TimeSignature timeSignature,
            KeySignature keySignature,
            int tonicPitchNumber,
            String scoreTitle,
            double? startAt,
            double? endAt,
            double duration,
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)?
        scoreConfig,
    required TResult orElse(),
  }) {
    if (whiteSpace != null) {
      return whiteSpace(createdAt, startAt, endAt, this.duration,
          intialScoreConfigNote, intialTrackConfigNote, startAtInSeconds);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MusicNote value) music,
    required TResult Function(DurationNote value) duration,
    required TResult Function(WhiteSpaceNote value) whiteSpace,
    required TResult Function(TrackConfigNote value) trackConfig,
    required TResult Function(ScoreConfigNote value) scoreConfig,
  }) {
    return whiteSpace(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MusicNote value)? music,
    TResult Function(DurationNote value)? duration,
    TResult Function(WhiteSpaceNote value)? whiteSpace,
    TResult Function(TrackConfigNote value)? trackConfig,
    TResult Function(ScoreConfigNote value)? scoreConfig,
  }) {
    return whiteSpace?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MusicNote value)? music,
    TResult Function(DurationNote value)? duration,
    TResult Function(WhiteSpaceNote value)? whiteSpace,
    TResult Function(TrackConfigNote value)? trackConfig,
    TResult Function(ScoreConfigNote value)? scoreConfig,
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
      @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
      @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
      double? startAtInSeconds}) = _$WhiteSpaceNote;
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
  @JsonKey(ignore: true)
  ScoreConfigNote? get intialScoreConfigNote;
  @JsonKey(ignore: true)
  set intialScoreConfigNote(ScoreConfigNote? value);
  @override
  @JsonKey(ignore: true)
  TrackConfigNote? get intialTrackConfigNote;
  @JsonKey(ignore: true)
  set intialTrackConfigNote(TrackConfigNote? value);
  @override
  double? get startAtInSeconds;
  set startAtInSeconds(double? value);
  @override
  @JsonKey(ignore: true)
  _$$WhiteSpaceNoteCopyWith<_$WhiteSpaceNote> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TrackConfigNoteCopyWith<$Res> implements $NoteCopyWith<$Res> {
  factory _$$TrackConfigNoteCopyWith(
          _$TrackConfigNote value, $Res Function(_$TrackConfigNote) then) =
      __$$TrackConfigNoteCopyWithImpl<$Res>;
  @override
  $Res call(
      {int volume,
      int program,
      DateTime createdAt,
      double? startAt,
      double? endAt,
      double duration,
      @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
      @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
      double? startAtInSeconds});
}

/// @nodoc
class __$$TrackConfigNoteCopyWithImpl<$Res> extends _$NoteCopyWithImpl<$Res>
    implements _$$TrackConfigNoteCopyWith<$Res> {
  __$$TrackConfigNoteCopyWithImpl(
      _$TrackConfigNote _value, $Res Function(_$TrackConfigNote) _then)
      : super(_value, (v) => _then(v as _$TrackConfigNote));

  @override
  _$TrackConfigNote get _value => super._value as _$TrackConfigNote;

  @override
  $Res call({
    Object? volume = freezed,
    Object? program = freezed,
    Object? createdAt = freezed,
    Object? startAt = freezed,
    Object? endAt = freezed,
    Object? duration = freezed,
    Object? intialScoreConfigNote = freezed,
    Object? intialTrackConfigNote = freezed,
    Object? startAtInSeconds = freezed,
  }) {
    return _then(_$TrackConfigNote(
      volume == freezed
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as int,
      program == freezed
          ? _value.program
          : program // ignore: cast_nullable_to_non_nullable
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
      intialScoreConfigNote: intialScoreConfigNote == freezed
          ? _value.intialScoreConfigNote
          : intialScoreConfigNote // ignore: cast_nullable_to_non_nullable
              as ScoreConfigNote?,
      intialTrackConfigNote: intialTrackConfigNote == freezed
          ? _value.intialTrackConfigNote
          : intialTrackConfigNote // ignore: cast_nullable_to_non_nullable
              as TrackConfigNote?,
      startAtInSeconds: startAtInSeconds == freezed
          ? _value.startAtInSeconds
          : startAtInSeconds // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$TrackConfigNote extends TrackConfigNote {
  _$TrackConfigNote(this.volume, this.program,
      {required this.createdAt,
      this.startAt,
      this.endAt,
      this.duration = 0,
      @JsonKey(ignore: true) this.intialScoreConfigNote,
      @JsonKey(ignore: true) this.intialTrackConfigNote,
      this.startAtInSeconds,
      final String? $type})
      : $type = $type ?? 'trackConfig',
        super._();

  factory _$TrackConfigNote.fromJson(Map<String, dynamic> json) =>
      _$$TrackConfigNoteFromJson(json);

  @override
  int volume;
  @override
  int program;
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
  @JsonKey(ignore: true)
  ScoreConfigNote? intialScoreConfigNote;
  @override
  @JsonKey(ignore: true)
  TrackConfigNote? intialTrackConfigNote;
  @override
  double? startAtInSeconds;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @JsonKey(ignore: true)
  @override
  _$$TrackConfigNoteCopyWith<_$TrackConfigNote> get copyWith =>
      __$$TrackConfigNoteCopyWithImpl<_$TrackConfigNote>(this, _$identity);

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
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)
        music,
    required TResult Function(
            DurationMarker marker,
            DateTime createdAt,
            double? startAt,
            double? endAt,
            double duration,
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)
        duration,
    required TResult Function(
            DateTime createdAt,
            double? startAt,
            double? endAt,
            double duration,
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)
        whiteSpace,
    required TResult Function(
            int volume,
            int program,
            DateTime createdAt,
            double? startAt,
            double? endAt,
            double duration,
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)
        trackConfig,
    required TResult Function(
            DateTime createdAt,
            int bpm,
            TimeSignature timeSignature,
            KeySignature keySignature,
            int tonicPitchNumber,
            String scoreTitle,
            double? startAt,
            double? endAt,
            double duration,
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)
        scoreConfig,
  }) {
    return trackConfig(
        volume,
        program,
        createdAt,
        startAt,
        endAt,
        this.duration,
        intialScoreConfigNote,
        intialTrackConfigNote,
        startAtInSeconds);
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
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)?
        music,
    TResult Function(
            DurationMarker marker,
            DateTime createdAt,
            double? startAt,
            double? endAt,
            double duration,
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)?
        duration,
    TResult Function(
            DateTime createdAt,
            double? startAt,
            double? endAt,
            double duration,
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)?
        whiteSpace,
    TResult Function(
            int volume,
            int program,
            DateTime createdAt,
            double? startAt,
            double? endAt,
            double duration,
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)?
        trackConfig,
    TResult Function(
            DateTime createdAt,
            int bpm,
            TimeSignature timeSignature,
            KeySignature keySignature,
            int tonicPitchNumber,
            String scoreTitle,
            double? startAt,
            double? endAt,
            double duration,
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)?
        scoreConfig,
  }) {
    return trackConfig?.call(
        volume,
        program,
        createdAt,
        startAt,
        endAt,
        this.duration,
        intialScoreConfigNote,
        intialTrackConfigNote,
        startAtInSeconds);
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
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)?
        music,
    TResult Function(
            DurationMarker marker,
            DateTime createdAt,
            double? startAt,
            double? endAt,
            double duration,
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)?
        duration,
    TResult Function(
            DateTime createdAt,
            double? startAt,
            double? endAt,
            double duration,
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)?
        whiteSpace,
    TResult Function(
            int volume,
            int program,
            DateTime createdAt,
            double? startAt,
            double? endAt,
            double duration,
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)?
        trackConfig,
    TResult Function(
            DateTime createdAt,
            int bpm,
            TimeSignature timeSignature,
            KeySignature keySignature,
            int tonicPitchNumber,
            String scoreTitle,
            double? startAt,
            double? endAt,
            double duration,
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)?
        scoreConfig,
    required TResult orElse(),
  }) {
    if (trackConfig != null) {
      return trackConfig(
          volume,
          program,
          createdAt,
          startAt,
          endAt,
          this.duration,
          intialScoreConfigNote,
          intialTrackConfigNote,
          startAtInSeconds);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MusicNote value) music,
    required TResult Function(DurationNote value) duration,
    required TResult Function(WhiteSpaceNote value) whiteSpace,
    required TResult Function(TrackConfigNote value) trackConfig,
    required TResult Function(ScoreConfigNote value) scoreConfig,
  }) {
    return trackConfig(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MusicNote value)? music,
    TResult Function(DurationNote value)? duration,
    TResult Function(WhiteSpaceNote value)? whiteSpace,
    TResult Function(TrackConfigNote value)? trackConfig,
    TResult Function(ScoreConfigNote value)? scoreConfig,
  }) {
    return trackConfig?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MusicNote value)? music,
    TResult Function(DurationNote value)? duration,
    TResult Function(WhiteSpaceNote value)? whiteSpace,
    TResult Function(TrackConfigNote value)? trackConfig,
    TResult Function(ScoreConfigNote value)? scoreConfig,
    required TResult orElse(),
  }) {
    if (trackConfig != null) {
      return trackConfig(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$TrackConfigNoteToJson(
      this,
    );
  }
}

abstract class TrackConfigNote extends Note {
  factory TrackConfigNote(int volume, int program,
      {required DateTime createdAt,
      double? startAt,
      double? endAt,
      double duration,
      @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
      @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
      double? startAtInSeconds}) = _$TrackConfigNote;
  TrackConfigNote._() : super._();

  factory TrackConfigNote.fromJson(Map<String, dynamic> json) =
      _$TrackConfigNote.fromJson;

  int get volume;
  set volume(int value);
  int get program;
  set program(int value);
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
  @JsonKey(ignore: true)
  ScoreConfigNote? get intialScoreConfigNote;
  @JsonKey(ignore: true)
  set intialScoreConfigNote(ScoreConfigNote? value);
  @override
  @JsonKey(ignore: true)
  TrackConfigNote? get intialTrackConfigNote;
  @JsonKey(ignore: true)
  set intialTrackConfigNote(TrackConfigNote? value);
  @override
  double? get startAtInSeconds;
  set startAtInSeconds(double? value);
  @override
  @JsonKey(ignore: true)
  _$$TrackConfigNoteCopyWith<_$TrackConfigNote> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ScoreConfigNoteCopyWith<$Res> implements $NoteCopyWith<$Res> {
  factory _$$ScoreConfigNoteCopyWith(
          _$ScoreConfigNote value, $Res Function(_$ScoreConfigNote) then) =
      __$$ScoreConfigNoteCopyWithImpl<$Res>;
  @override
  $Res call(
      {DateTime createdAt,
      int bpm,
      TimeSignature timeSignature,
      KeySignature keySignature,
      int tonicPitchNumber,
      String scoreTitle,
      double? startAt,
      double? endAt,
      double duration,
      @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
      @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
      double? startAtInSeconds});
}

/// @nodoc
class __$$ScoreConfigNoteCopyWithImpl<$Res> extends _$NoteCopyWithImpl<$Res>
    implements _$$ScoreConfigNoteCopyWith<$Res> {
  __$$ScoreConfigNoteCopyWithImpl(
      _$ScoreConfigNote _value, $Res Function(_$ScoreConfigNote) _then)
      : super(_value, (v) => _then(v as _$ScoreConfigNote));

  @override
  _$ScoreConfigNote get _value => super._value as _$ScoreConfigNote;

  @override
  $Res call({
    Object? createdAt = freezed,
    Object? bpm = freezed,
    Object? timeSignature = freezed,
    Object? keySignature = freezed,
    Object? tonicPitchNumber = freezed,
    Object? scoreTitle = freezed,
    Object? startAt = freezed,
    Object? endAt = freezed,
    Object? duration = freezed,
    Object? intialScoreConfigNote = freezed,
    Object? intialTrackConfigNote = freezed,
    Object? startAtInSeconds = freezed,
  }) {
    return _then(_$ScoreConfigNote(
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
      intialScoreConfigNote: intialScoreConfigNote == freezed
          ? _value.intialScoreConfigNote
          : intialScoreConfigNote // ignore: cast_nullable_to_non_nullable
              as ScoreConfigNote?,
      intialTrackConfigNote: intialTrackConfigNote == freezed
          ? _value.intialTrackConfigNote
          : intialTrackConfigNote // ignore: cast_nullable_to_non_nullable
              as TrackConfigNote?,
      startAtInSeconds: startAtInSeconds == freezed
          ? _value.startAtInSeconds
          : startAtInSeconds // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ScoreConfigNote extends ScoreConfigNote {
  _$ScoreConfigNote(
      {required this.createdAt,
      required this.bpm,
      required this.timeSignature,
      required this.keySignature,
      required this.tonicPitchNumber,
      required this.scoreTitle,
      this.startAt,
      this.endAt,
      this.duration = 0,
      @JsonKey(ignore: true) this.intialScoreConfigNote,
      @JsonKey(ignore: true) this.intialTrackConfigNote,
      this.startAtInSeconds,
      final String? $type})
      : $type = $type ?? 'scoreConfig',
        super._();

  factory _$ScoreConfigNote.fromJson(Map<String, dynamic> json) =>
      _$$ScoreConfigNoteFromJson(json);

  @override
  DateTime createdAt;
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
  double? startAt;
  @override
  double? endAt;
  @override
  @JsonKey()
  double duration;
  @override
  @JsonKey(ignore: true)
  ScoreConfigNote? intialScoreConfigNote;
  @override
  @JsonKey(ignore: true)
  TrackConfigNote? intialTrackConfigNote;
  @override
  double? startAtInSeconds;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @JsonKey(ignore: true)
  @override
  _$$ScoreConfigNoteCopyWith<_$ScoreConfigNote> get copyWith =>
      __$$ScoreConfigNoteCopyWithImpl<_$ScoreConfigNote>(this, _$identity);

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
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)
        music,
    required TResult Function(
            DurationMarker marker,
            DateTime createdAt,
            double? startAt,
            double? endAt,
            double duration,
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)
        duration,
    required TResult Function(
            DateTime createdAt,
            double? startAt,
            double? endAt,
            double duration,
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)
        whiteSpace,
    required TResult Function(
            int volume,
            int program,
            DateTime createdAt,
            double? startAt,
            double? endAt,
            double duration,
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)
        trackConfig,
    required TResult Function(
            DateTime createdAt,
            int bpm,
            TimeSignature timeSignature,
            KeySignature keySignature,
            int tonicPitchNumber,
            String scoreTitle,
            double? startAt,
            double? endAt,
            double duration,
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)
        scoreConfig,
  }) {
    return scoreConfig(
        createdAt,
        bpm,
        timeSignature,
        keySignature,
        tonicPitchNumber,
        scoreTitle,
        startAt,
        endAt,
        this.duration,
        intialScoreConfigNote,
        intialTrackConfigNote,
        startAtInSeconds);
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
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)?
        music,
    TResult Function(
            DurationMarker marker,
            DateTime createdAt,
            double? startAt,
            double? endAt,
            double duration,
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)?
        duration,
    TResult Function(
            DateTime createdAt,
            double? startAt,
            double? endAt,
            double duration,
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)?
        whiteSpace,
    TResult Function(
            int volume,
            int program,
            DateTime createdAt,
            double? startAt,
            double? endAt,
            double duration,
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)?
        trackConfig,
    TResult Function(
            DateTime createdAt,
            int bpm,
            TimeSignature timeSignature,
            KeySignature keySignature,
            int tonicPitchNumber,
            String scoreTitle,
            double? startAt,
            double? endAt,
            double duration,
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)?
        scoreConfig,
  }) {
    return scoreConfig?.call(
        createdAt,
        bpm,
        timeSignature,
        keySignature,
        tonicPitchNumber,
        scoreTitle,
        startAt,
        endAt,
        this.duration,
        intialScoreConfigNote,
        intialTrackConfigNote,
        startAtInSeconds);
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
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)?
        music,
    TResult Function(
            DurationMarker marker,
            DateTime createdAt,
            double? startAt,
            double? endAt,
            double duration,
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)?
        duration,
    TResult Function(
            DateTime createdAt,
            double? startAt,
            double? endAt,
            double duration,
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)?
        whiteSpace,
    TResult Function(
            int volume,
            int program,
            DateTime createdAt,
            double? startAt,
            double? endAt,
            double duration,
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)?
        trackConfig,
    TResult Function(
            DateTime createdAt,
            int bpm,
            TimeSignature timeSignature,
            KeySignature keySignature,
            int tonicPitchNumber,
            String scoreTitle,
            double? startAt,
            double? endAt,
            double duration,
            @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
            @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
            double? startAtInSeconds)?
        scoreConfig,
    required TResult orElse(),
  }) {
    if (scoreConfig != null) {
      return scoreConfig(
          createdAt,
          bpm,
          timeSignature,
          keySignature,
          tonicPitchNumber,
          scoreTitle,
          startAt,
          endAt,
          this.duration,
          intialScoreConfigNote,
          intialTrackConfigNote,
          startAtInSeconds);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MusicNote value) music,
    required TResult Function(DurationNote value) duration,
    required TResult Function(WhiteSpaceNote value) whiteSpace,
    required TResult Function(TrackConfigNote value) trackConfig,
    required TResult Function(ScoreConfigNote value) scoreConfig,
  }) {
    return scoreConfig(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MusicNote value)? music,
    TResult Function(DurationNote value)? duration,
    TResult Function(WhiteSpaceNote value)? whiteSpace,
    TResult Function(TrackConfigNote value)? trackConfig,
    TResult Function(ScoreConfigNote value)? scoreConfig,
  }) {
    return scoreConfig?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MusicNote value)? music,
    TResult Function(DurationNote value)? duration,
    TResult Function(WhiteSpaceNote value)? whiteSpace,
    TResult Function(TrackConfigNote value)? trackConfig,
    TResult Function(ScoreConfigNote value)? scoreConfig,
    required TResult orElse(),
  }) {
    if (scoreConfig != null) {
      return scoreConfig(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ScoreConfigNoteToJson(
      this,
    );
  }
}

abstract class ScoreConfigNote extends Note {
  factory ScoreConfigNote(
      {required DateTime createdAt,
      required int bpm,
      required TimeSignature timeSignature,
      required KeySignature keySignature,
      required int tonicPitchNumber,
      required String scoreTitle,
      double? startAt,
      double? endAt,
      double duration,
      @JsonKey(ignore: true) ScoreConfigNote? intialScoreConfigNote,
      @JsonKey(ignore: true) TrackConfigNote? intialTrackConfigNote,
      double? startAtInSeconds}) = _$ScoreConfigNote;
  ScoreConfigNote._() : super._();

  factory ScoreConfigNote.fromJson(Map<String, dynamic> json) =
      _$ScoreConfigNote.fromJson;

  @override
  DateTime get createdAt;
  set createdAt(DateTime value);
  int get bpm;
  set bpm(int value);
  TimeSignature get timeSignature;
  set timeSignature(TimeSignature value);
  KeySignature get keySignature;
  set keySignature(KeySignature value);
  int get tonicPitchNumber;
  set tonicPitchNumber(int value);
  String get scoreTitle;
  set scoreTitle(String value);
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
  @JsonKey(ignore: true)
  ScoreConfigNote? get intialScoreConfigNote;
  @JsonKey(ignore: true)
  set intialScoreConfigNote(ScoreConfigNote? value);
  @override
  @JsonKey(ignore: true)
  TrackConfigNote? get intialTrackConfigNote;
  @JsonKey(ignore: true)
  set intialTrackConfigNote(TrackConfigNote? value);
  @override
  double? get startAtInSeconds;
  set startAtInSeconds(double? value);
  @override
  @JsonKey(ignore: true)
  _$$ScoreConfigNoteCopyWith<_$ScoreConfigNote> get copyWith =>
      throw _privateConstructorUsedError;
}
