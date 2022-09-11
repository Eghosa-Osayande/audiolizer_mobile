// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'project_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Project {
  String get title => throw _privateConstructorUsedError;
  set title(String value) => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  set description(String value) => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  set updatedAt(DateTime value) => throw _privateConstructorUsedError;
  Score get score => throw _privateConstructorUsedError;
  set score(Score value) => throw _privateConstructorUsedError;
  int get versionNumber => throw _privateConstructorUsedError;
  set versionNumber(int value) => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProjectCopyWith<Project> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectCopyWith<$Res> {
  factory $ProjectCopyWith(Project value, $Res Function(Project) then) =
      _$ProjectCopyWithImpl<$Res>;
  $Res call(
      {String title,
      String description,
      DateTime updatedAt,
      Score score,
      int versionNumber});

  $ScoreCopyWith<$Res> get score;
}

/// @nodoc
class _$ProjectCopyWithImpl<$Res> implements $ProjectCopyWith<$Res> {
  _$ProjectCopyWithImpl(this._value, this._then);

  final Project _value;
  // ignore: unused_field
  final $Res Function(Project) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
    Object? updatedAt = freezed,
    Object? score = freezed,
    Object? versionNumber = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      score: score == freezed
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as Score,
      versionNumber: versionNumber == freezed
          ? _value.versionNumber
          : versionNumber // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  @override
  $ScoreCopyWith<$Res> get score {
    return $ScoreCopyWith<$Res>(_value.score, (value) {
      return _then(_value.copyWith(score: value));
    });
  }
}

/// @nodoc
abstract class _$$_ProjectCopyWith<$Res> implements $ProjectCopyWith<$Res> {
  factory _$$_ProjectCopyWith(
          _$_Project value, $Res Function(_$_Project) then) =
      __$$_ProjectCopyWithImpl<$Res>;
  @override
  $Res call(
      {String title,
      String description,
      DateTime updatedAt,
      Score score,
      int versionNumber});

  @override
  $ScoreCopyWith<$Res> get score;
}

/// @nodoc
class __$$_ProjectCopyWithImpl<$Res> extends _$ProjectCopyWithImpl<$Res>
    implements _$$_ProjectCopyWith<$Res> {
  __$$_ProjectCopyWithImpl(_$_Project _value, $Res Function(_$_Project) _then)
      : super(_value, (v) => _then(v as _$_Project));

  @override
  _$_Project get _value => super._value as _$_Project;

  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
    Object? updatedAt = freezed,
    Object? score = freezed,
    Object? versionNumber = freezed,
  }) {
    return _then(_$_Project(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      score: score == freezed
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as Score,
      versionNumber: versionNumber == freezed
          ? _value.versionNumber
          : versionNumber // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Project extends _Project with DiagnosticableTreeMixin {
  _$_Project(
      {required this.title,
      required this.description,
      required this.updatedAt,
      required this.score,
      this.versionNumber = 1})
      : super._();

  @override
  String title;
  @override
  String description;
  @override
  DateTime updatedAt;
  @override
  Score score;
  @override
  @JsonKey()
  int versionNumber;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Project(title: $title, description: $description, updatedAt: $updatedAt, score: $score, versionNumber: $versionNumber)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Project'))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('updatedAt', updatedAt))
      ..add(DiagnosticsProperty('score', score))
      ..add(DiagnosticsProperty('versionNumber', versionNumber));
  }

  @JsonKey(ignore: true)
  @override
  _$$_ProjectCopyWith<_$_Project> get copyWith =>
      __$$_ProjectCopyWithImpl<_$_Project>(this, _$identity);
}

abstract class _Project extends Project {
  factory _Project(
      {required String title,
      required String description,
      required DateTime updatedAt,
      required Score score,
      int versionNumber}) = _$_Project;
  _Project._() : super._();

  @override
  String get title;
  set title(String value);
  @override
  String get description;
  set description(String value);
  @override
  DateTime get updatedAt;
  set updatedAt(DateTime value);
  @override
  Score get score;
  set score(Score value);
  @override
  int get versionNumber;
  set versionNumber(int value);
  @override
  @JsonKey(ignore: true)
  _$$_ProjectCopyWith<_$_Project> get copyWith =>
      throw _privateConstructorUsedError;
}
