// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_repository.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DetailRepository _$DetailRepositoryFromJson(Map<String, dynamic> json) {
  return _DetailRepository.fromJson(json);
}

/// @nodoc
mixin _$DetailRepository {
  String get name => throw _privateConstructorUsedError;
  String get avatarUrl => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get language => throw _privateConstructorUsedError;
  int get stargazersCount => throw _privateConstructorUsedError;
  int get watchersCount => throw _privateConstructorUsedError;
  int get forksCount => throw _privateConstructorUsedError;
  int get openIssuesCount => throw _privateConstructorUsedError;

  /// Serializes this DetailRepository to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DetailRepository
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DetailRepositoryCopyWith<DetailRepository> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailRepositoryCopyWith<$Res> {
  factory $DetailRepositoryCopyWith(
          DetailRepository value, $Res Function(DetailRepository) then) =
      _$DetailRepositoryCopyWithImpl<$Res, DetailRepository>;
  @useResult
  $Res call(
      {String name,
      String avatarUrl,
      String description,
      String language,
      int stargazersCount,
      int watchersCount,
      int forksCount,
      int openIssuesCount});
}

/// @nodoc
class _$DetailRepositoryCopyWithImpl<$Res, $Val extends DetailRepository>
    implements $DetailRepositoryCopyWith<$Res> {
  _$DetailRepositoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DetailRepository
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? avatarUrl = null,
    Object? description = null,
    Object? language = null,
    Object? stargazersCount = null,
    Object? watchersCount = null,
    Object? forksCount = null,
    Object? openIssuesCount = null,
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
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      stargazersCount: null == stargazersCount
          ? _value.stargazersCount
          : stargazersCount // ignore: cast_nullable_to_non_nullable
              as int,
      watchersCount: null == watchersCount
          ? _value.watchersCount
          : watchersCount // ignore: cast_nullable_to_non_nullable
              as int,
      forksCount: null == forksCount
          ? _value.forksCount
          : forksCount // ignore: cast_nullable_to_non_nullable
              as int,
      openIssuesCount: null == openIssuesCount
          ? _value.openIssuesCount
          : openIssuesCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DetailRepositoryImplCopyWith<$Res>
    implements $DetailRepositoryCopyWith<$Res> {
  factory _$$DetailRepositoryImplCopyWith(_$DetailRepositoryImpl value,
          $Res Function(_$DetailRepositoryImpl) then) =
      __$$DetailRepositoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String avatarUrl,
      String description,
      String language,
      int stargazersCount,
      int watchersCount,
      int forksCount,
      int openIssuesCount});
}

/// @nodoc
class __$$DetailRepositoryImplCopyWithImpl<$Res>
    extends _$DetailRepositoryCopyWithImpl<$Res, _$DetailRepositoryImpl>
    implements _$$DetailRepositoryImplCopyWith<$Res> {
  __$$DetailRepositoryImplCopyWithImpl(_$DetailRepositoryImpl _value,
      $Res Function(_$DetailRepositoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of DetailRepository
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? avatarUrl = null,
    Object? description = null,
    Object? language = null,
    Object? stargazersCount = null,
    Object? watchersCount = null,
    Object? forksCount = null,
    Object? openIssuesCount = null,
  }) {
    return _then(_$DetailRepositoryImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: null == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      stargazersCount: null == stargazersCount
          ? _value.stargazersCount
          : stargazersCount // ignore: cast_nullable_to_non_nullable
              as int,
      watchersCount: null == watchersCount
          ? _value.watchersCount
          : watchersCount // ignore: cast_nullable_to_non_nullable
              as int,
      forksCount: null == forksCount
          ? _value.forksCount
          : forksCount // ignore: cast_nullable_to_non_nullable
              as int,
      openIssuesCount: null == openIssuesCount
          ? _value.openIssuesCount
          : openIssuesCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetailRepositoryImpl implements _DetailRepository {
  const _$DetailRepositoryImpl(
      {required this.name,
      required this.avatarUrl,
      required this.description,
      required this.language,
      required this.stargazersCount,
      required this.watchersCount,
      required this.forksCount,
      required this.openIssuesCount});

  factory _$DetailRepositoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailRepositoryImplFromJson(json);

  @override
  final String name;
  @override
  final String avatarUrl;
  @override
  final String description;
  @override
  final String language;
  @override
  final int stargazersCount;
  @override
  final int watchersCount;
  @override
  final int forksCount;
  @override
  final int openIssuesCount;

  @override
  String toString() {
    return 'DetailRepository(name: $name, avatarUrl: $avatarUrl, description: $description, language: $language, stargazersCount: $stargazersCount, watchersCount: $watchersCount, forksCount: $forksCount, openIssuesCount: $openIssuesCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailRepositoryImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.stargazersCount, stargazersCount) ||
                other.stargazersCount == stargazersCount) &&
            (identical(other.watchersCount, watchersCount) ||
                other.watchersCount == watchersCount) &&
            (identical(other.forksCount, forksCount) ||
                other.forksCount == forksCount) &&
            (identical(other.openIssuesCount, openIssuesCount) ||
                other.openIssuesCount == openIssuesCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, avatarUrl, description,
      language, stargazersCount, watchersCount, forksCount, openIssuesCount);

  /// Create a copy of DetailRepository
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailRepositoryImplCopyWith<_$DetailRepositoryImpl> get copyWith =>
      __$$DetailRepositoryImplCopyWithImpl<_$DetailRepositoryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailRepositoryImplToJson(
      this,
    );
  }
}

abstract class _DetailRepository implements DetailRepository {
  const factory _DetailRepository(
      {required final String name,
      required final String avatarUrl,
      required final String description,
      required final String language,
      required final int stargazersCount,
      required final int watchersCount,
      required final int forksCount,
      required final int openIssuesCount}) = _$DetailRepositoryImpl;

  factory _DetailRepository.fromJson(Map<String, dynamic> json) =
      _$DetailRepositoryImpl.fromJson;

  @override
  String get name;
  @override
  String get avatarUrl;
  @override
  String get description;
  @override
  String get language;
  @override
  int get stargazersCount;
  @override
  int get watchersCount;
  @override
  int get forksCount;
  @override
  int get openIssuesCount;

  /// Create a copy of DetailRepository
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DetailRepositoryImplCopyWith<_$DetailRepositoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
