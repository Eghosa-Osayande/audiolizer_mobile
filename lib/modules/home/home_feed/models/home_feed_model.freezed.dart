// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'home_feed_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HomeFeedModel _$HomeFeedModelFromJson(Map<String, dynamic> json) {
  return _HomeFeedModel.fromJson(json);
}

/// @nodoc
mixin _$HomeFeedModel {
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String get avatar => throw _privateConstructorUsedError;
  String get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HomeFeedModelCopyWith<HomeFeedModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeFeedModelCopyWith<$Res> {
  factory $HomeFeedModelCopyWith(
          HomeFeedModel value, $Res Function(HomeFeedModel) then) =
      _$HomeFeedModelCopyWithImpl<$Res>;
  $Res call(
      {String title,
      String description,
      String url,
      String avatar,
      String user});
}

/// @nodoc
class _$HomeFeedModelCopyWithImpl<$Res>
    implements $HomeFeedModelCopyWith<$Res> {
  _$HomeFeedModelCopyWithImpl(this._value, this._then);

  final HomeFeedModel _value;
  // ignore: unused_field
  final $Res Function(HomeFeedModel) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
    Object? url = freezed,
    Object? avatar = freezed,
    Object? user = freezed,
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
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: avatar == freezed
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_HomeFeedModelCopyWith<$Res>
    implements $HomeFeedModelCopyWith<$Res> {
  factory _$$_HomeFeedModelCopyWith(
          _$_HomeFeedModel value, $Res Function(_$_HomeFeedModel) then) =
      __$$_HomeFeedModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String title,
      String description,
      String url,
      String avatar,
      String user});
}

/// @nodoc
class __$$_HomeFeedModelCopyWithImpl<$Res>
    extends _$HomeFeedModelCopyWithImpl<$Res>
    implements _$$_HomeFeedModelCopyWith<$Res> {
  __$$_HomeFeedModelCopyWithImpl(
      _$_HomeFeedModel _value, $Res Function(_$_HomeFeedModel) _then)
      : super(_value, (v) => _then(v as _$_HomeFeedModel));

  @override
  _$_HomeFeedModel get _value => super._value as _$_HomeFeedModel;

  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
    Object? url = freezed,
    Object? avatar = freezed,
    Object? user = freezed,
  }) {
    return _then(_$_HomeFeedModel(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: avatar == freezed
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HomeFeedModel implements _HomeFeedModel {
  const _$_HomeFeedModel(
      {required this.title,
      required this.description,
      required this.url,
      required this.avatar,
      required this.user});

  factory _$_HomeFeedModel.fromJson(Map<String, dynamic> json) =>
      _$$_HomeFeedModelFromJson(json);

  @override
  final String title;
  @override
  final String description;
  @override
  final String url;
  @override
  final String avatar;
  @override
  final String user;

  @override
  String toString() {
    return 'HomeFeedModel(title: $title, description: $description, url: $url, avatar: $avatar, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HomeFeedModel &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.url, url) &&
            const DeepCollectionEquality().equals(other.avatar, avatar) &&
            const DeepCollectionEquality().equals(other.user, user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(url),
      const DeepCollectionEquality().hash(avatar),
      const DeepCollectionEquality().hash(user));

  @JsonKey(ignore: true)
  @override
  _$$_HomeFeedModelCopyWith<_$_HomeFeedModel> get copyWith =>
      __$$_HomeFeedModelCopyWithImpl<_$_HomeFeedModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HomeFeedModelToJson(
      this,
    );
  }
}

abstract class _HomeFeedModel implements HomeFeedModel {
  const factory _HomeFeedModel(
      {required final String title,
      required final String description,
      required final String url,
      required final String avatar,
      required final String user}) = _$_HomeFeedModel;

  factory _HomeFeedModel.fromJson(Map<String, dynamic> json) =
      _$_HomeFeedModel.fromJson;

  @override
  String get title;
  @override
  String get description;
  @override
  String get url;
  @override
  String get avatar;
  @override
  String get user;
  @override
  @JsonKey(ignore: true)
  _$$_HomeFeedModelCopyWith<_$_HomeFeedModel> get copyWith =>
      throw _privateConstructorUsedError;
}
