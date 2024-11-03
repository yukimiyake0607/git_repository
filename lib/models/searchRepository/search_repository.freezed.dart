// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_repository.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SearchRepository _$SearchRepositoryFromJson(Map<String, dynamic> json) {
  return _SearchRepository.fromJson(json);
}

/// @nodoc
mixin _$SearchRepository {
  String get name => throw _privateConstructorUsedError;
  String get avatarUrl => throw _privateConstructorUsedError;
  String get language => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int get stargazersCount => throw _privateConstructorUsedError;

  /// Serializes this SearchRepository to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SearchRepository
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchRepositoryCopyWith<SearchRepository> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchRepositoryCopyWith<$Res> {
  factory $SearchRepositoryCopyWith(
          SearchRepository value, $Res Function(SearchRepository) then) =
      _$SearchRepositoryCopyWithImpl<$Res, SearchRepository>;
  @useResult
  $Res call(
      {String name,
      String avatarUrl,
      String language,
      String description,
      int stargazersCount});
}

/// @nodoc
class _$SearchRepositoryCopyWithImpl<$Res, $Val extends SearchRepository>
    implements $SearchRepositoryCopyWith<$Res> {
  _$SearchRepositoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchRepository
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? avatarUrl = null,
    Object? language = null,
    Object? description = null,
    Object? stargazersCount = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: null == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      stargazersCount: null == stargazersCount
          ? _value.stargazersCount
          : stargazersCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchRepositoryImplCopyWith<$Res>
    implements $SearchRepositoryCopyWith<$Res> {
  factory _$$SearchRepositoryImplCopyWith(_$SearchRepositoryImpl value,
          $Res Function(_$SearchRepositoryImpl) then) =
      __$$SearchRepositoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String avatarUrl,
      String language,
      String description,
      int stargazersCount});
}

/// @nodoc
class __$$SearchRepositoryImplCopyWithImpl<$Res>
    extends _$SearchRepositoryCopyWithImpl<$Res, _$SearchRepositoryImpl>
    implements _$$SearchRepositoryImplCopyWith<$Res> {
  __$$SearchRepositoryImplCopyWithImpl(_$SearchRepositoryImpl _value,
      $Res Function(_$SearchRepositoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchRepository
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? avatarUrl = null,
    Object? language = null,
    Object? description = null,
    Object? stargazersCount = null,
  }) {
    return _then(_$SearchRepositoryImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: null == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      stargazersCount: null == stargazersCount
          ? _value.stargazersCount
          : stargazersCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchRepositoryImpl implements _SearchRepository {
  const _$SearchRepositoryImpl(
      {required this.name,
      required this.avatarUrl,
      required this.language,
      required this.description,
      required this.stargazersCount});

  factory _$SearchRepositoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchRepositoryImplFromJson(json);

  @override
  final String name;
  @override
  final String avatarUrl;
  @override
  final String language;
  @override
  final String description;
  @override
  final int stargazersCount;

  @override
  String toString() {
    return 'SearchRepository(name: $name, avatarUrl: $avatarUrl, language: $language, description: $description, stargazersCount: $stargazersCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchRepositoryImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.stargazersCount, stargazersCount) ||
                other.stargazersCount == stargazersCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, avatarUrl, language, description, stargazersCount);

  /// Create a copy of SearchRepository
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchRepositoryImplCopyWith<_$SearchRepositoryImpl> get copyWith =>
      __$$SearchRepositoryImplCopyWithImpl<_$SearchRepositoryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchRepositoryImplToJson(
      this,
    );
  }
}

abstract class _SearchRepository implements SearchRepository {
  const factory _SearchRepository(
      {required final String name,
      required final String avatarUrl,
      required final String language,
      required final String description,
      required final int stargazersCount}) = _$SearchRepositoryImpl;

  factory _SearchRepository.fromJson(Map<String, dynamic> json) =
      _$SearchRepositoryImpl.fromJson;

  @override
  String get name;
  @override
  String get avatarUrl;
  @override
  String get language;
  @override
  String get description;
  @override
  int get stargazersCount;

  /// Create a copy of SearchRepository
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchRepositoryImplCopyWith<_$SearchRepositoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
