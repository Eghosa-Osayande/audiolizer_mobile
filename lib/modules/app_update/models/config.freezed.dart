// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppRemoteConfig _$AppRemoteConfigFromJson(Map<String, dynamic> json) {
  return _AppRemoteConfig.fromJson(json);
}

/// @nodoc
mixin _$AppRemoteConfig {
  int get version => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get body => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  List<int> get allow => throw _privateConstructorUsedError;
  List<int> get semiAllow => throw _privateConstructorUsedError;
  List<int> get noAllow => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppRemoteConfigCopyWith<AppRemoteConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppRemoteConfigCopyWith<$Res> {
  factory $AppRemoteConfigCopyWith(
          AppRemoteConfig value, $Res Function(AppRemoteConfig) then) =
      _$AppRemoteConfigCopyWithImpl<$Res>;
  $Res call(
      {int version,
      String title,
      String body,
      String url,
      List<int> allow,
      List<int> semiAllow,
      List<int> noAllow});
}

/// @nodoc
class _$AppRemoteConfigCopyWithImpl<$Res>
    implements $AppRemoteConfigCopyWith<$Res> {
  _$AppRemoteConfigCopyWithImpl(this._value, this._then);

  final AppRemoteConfig _value;
  // ignore: unused_field
  final $Res Function(AppRemoteConfig) _then;

  @override
  $Res call({
    Object? version = freezed,
    Object? title = freezed,
    Object? body = freezed,
    Object? url = freezed,
    Object? allow = freezed,
    Object? semiAllow = freezed,
    Object? noAllow = freezed,
  }) {
    return _then(_value.copyWith(
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      allow: allow == freezed
          ? _value.allow
          : allow // ignore: cast_nullable_to_non_nullable
              as List<int>,
      semiAllow: semiAllow == freezed
          ? _value.semiAllow
          : semiAllow // ignore: cast_nullable_to_non_nullable
              as List<int>,
      noAllow: noAllow == freezed
          ? _value.noAllow
          : noAllow // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc
abstract class _$$_AppRemoteConfigCopyWith<$Res>
    implements $AppRemoteConfigCopyWith<$Res> {
  factory _$$_AppRemoteConfigCopyWith(
          _$_AppRemoteConfig value, $Res Function(_$_AppRemoteConfig) then) =
      __$$_AppRemoteConfigCopyWithImpl<$Res>;
  @override
  $Res call(
      {int version,
      String title,
      String body,
      String url,
      List<int> allow,
      List<int> semiAllow,
      List<int> noAllow});
}

/// @nodoc
class __$$_AppRemoteConfigCopyWithImpl<$Res>
    extends _$AppRemoteConfigCopyWithImpl<$Res>
    implements _$$_AppRemoteConfigCopyWith<$Res> {
  __$$_AppRemoteConfigCopyWithImpl(
      _$_AppRemoteConfig _value, $Res Function(_$_AppRemoteConfig) _then)
      : super(_value, (v) => _then(v as _$_AppRemoteConfig));

  @override
  _$_AppRemoteConfig get _value => super._value as _$_AppRemoteConfig;

  @override
  $Res call({
    Object? version = freezed,
    Object? title = freezed,
    Object? body = freezed,
    Object? url = freezed,
    Object? allow = freezed,
    Object? semiAllow = freezed,
    Object? noAllow = freezed,
  }) {
    return _then(_$_AppRemoteConfig(
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      allow: allow == freezed
          ? _value._allow
          : allow // ignore: cast_nullable_to_non_nullable
              as List<int>,
      semiAllow: semiAllow == freezed
          ? _value._semiAllow
          : semiAllow // ignore: cast_nullable_to_non_nullable
              as List<int>,
      noAllow: noAllow == freezed
          ? _value._noAllow
          : noAllow // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AppRemoteConfig implements _AppRemoteConfig {
  const _$_AppRemoteConfig(
      {required this.version,
      required this.title,
      required this.body,
      required this.url,
      required final List<int> allow,
      required final List<int> semiAllow,
      required final List<int> noAllow})
      : _allow = allow,
        _semiAllow = semiAllow,
        _noAllow = noAllow;

  factory _$_AppRemoteConfig.fromJson(Map<String, dynamic> json) =>
      _$$_AppRemoteConfigFromJson(json);

  @override
  final int version;
  @override
  final String title;
  @override
  final String body;
  @override
  final String url;
  final List<int> _allow;
  @override
  List<int> get allow {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allow);
  }

  final List<int> _semiAllow;
  @override
  List<int> get semiAllow {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_semiAllow);
  }

  final List<int> _noAllow;
  @override
  List<int> get noAllow {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_noAllow);
  }

  @override
  String toString() {
    return 'AppRemoteConfig(version: $version, title: $title, body: $body, url: $url, allow: $allow, semiAllow: $semiAllow, noAllow: $noAllow)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppRemoteConfig &&
            const DeepCollectionEquality().equals(other.version, version) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.body, body) &&
            const DeepCollectionEquality().equals(other.url, url) &&
            const DeepCollectionEquality().equals(other._allow, _allow) &&
            const DeepCollectionEquality()
                .equals(other._semiAllow, _semiAllow) &&
            const DeepCollectionEquality().equals(other._noAllow, _noAllow));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(version),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(body),
      const DeepCollectionEquality().hash(url),
      const DeepCollectionEquality().hash(_allow),
      const DeepCollectionEquality().hash(_semiAllow),
      const DeepCollectionEquality().hash(_noAllow));

  @JsonKey(ignore: true)
  @override
  _$$_AppRemoteConfigCopyWith<_$_AppRemoteConfig> get copyWith =>
      __$$_AppRemoteConfigCopyWithImpl<_$_AppRemoteConfig>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AppRemoteConfigToJson(
      this,
    );
  }
}

abstract class _AppRemoteConfig implements AppRemoteConfig {
  const factory _AppRemoteConfig(
      {required final int version,
      required final String title,
      required final String body,
      required final String url,
      required final List<int> allow,
      required final List<int> semiAllow,
      required final List<int> noAllow}) = _$_AppRemoteConfig;

  factory _AppRemoteConfig.fromJson(Map<String, dynamic> json) =
      _$_AppRemoteConfig.fromJson;

  @override
  int get version;
  @override
  String get title;
  @override
  String get body;
  @override
  String get url;
  @override
  List<int> get allow;
  @override
  List<int> get semiAllow;
  @override
  List<int> get noAllow;
  @override
  @JsonKey(ignore: true)
  _$$_AppRemoteConfigCopyWith<_$_AppRemoteConfig> get copyWith =>
      throw _privateConstructorUsedError;
}
