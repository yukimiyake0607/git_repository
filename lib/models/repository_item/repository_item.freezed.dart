// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'repository_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RepositoryItem _$RepositoryItemFromJson(Map<String, dynamic> json) {
  return _RepositoryItem.fromJson(json);
}

/// @nodoc
mixin _$RepositoryItem {
  String? get name => throw _privateConstructorUsedError;
  Owner? get owner => throw _privateConstructorUsedError;
  String? get language => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  int? get stargazersCount => throw _privateConstructorUsedError;

  /// Serializes this RepositoryItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RepositoryItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RepositoryItemCopyWith<RepositoryItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepositoryItemCopyWith<$Res> {
  factory $RepositoryItemCopyWith(
          RepositoryItem value, $Res Function(RepositoryItem) then) =
      _$RepositoryItemCopyWithImpl<$Res, RepositoryItem>;
  @useResult
  $Res call(
      {String? name,
      Owner? owner,
      String? language,
      String? description,
      int? stargazersCount});

  $OwnerCopyWith<$Res>? get owner;
}

/// @nodoc
class _$RepositoryItemCopyWithImpl<$Res, $Val extends RepositoryItem>
    implements $RepositoryItemCopyWith<$Res> {
  _$RepositoryItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RepositoryItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? owner = freezed,
    Object? language = freezed,
    Object? description = freezed,
    Object? stargazersCount = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      owner: freezed == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as Owner?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      stargazersCount: freezed == stargazersCount
          ? _value.stargazersCount
          : stargazersCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  /// Create a copy of RepositoryItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OwnerCopyWith<$Res>? get owner {
    if (_value.owner == null) {
      return null;
    }

    return $OwnerCopyWith<$Res>(_value.owner!, (value) {
      return _then(_value.copyWith(owner: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RepositoryItemImplCopyWith<$Res>
    implements $RepositoryItemCopyWith<$Res> {
  factory _$$RepositoryItemImplCopyWith(_$RepositoryItemImpl value,
          $Res Function(_$RepositoryItemImpl) then) =
      __$$RepositoryItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      Owner? owner,
      String? language,
      String? description,
      int? stargazersCount});

  @override
  $OwnerCopyWith<$Res>? get owner;
}

/// @nodoc
class __$$RepositoryItemImplCopyWithImpl<$Res>
    extends _$RepositoryItemCopyWithImpl<$Res, _$RepositoryItemImpl>
    implements _$$RepositoryItemImplCopyWith<$Res> {
  __$$RepositoryItemImplCopyWithImpl(
      _$RepositoryItemImpl _value, $Res Function(_$RepositoryItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of RepositoryItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? owner = freezed,
    Object? language = freezed,
    Object? description = freezed,
    Object? stargazersCount = freezed,
  }) {
    return _then(_$RepositoryItemImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      owner: freezed == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as Owner?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      stargazersCount: freezed == stargazersCount
          ? _value.stargazersCount
          : stargazersCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RepositoryItemImpl implements _RepositoryItem {
  const _$RepositoryItemImpl(
      {required this.name,
      required this.owner,
      required this.language,
      required this.description,
      required this.stargazersCount});

  factory _$RepositoryItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$RepositoryItemImplFromJson(json);

  @override
  final String? name;
  @override
  final Owner? owner;
  @override
  final String? language;
  @override
  final String? description;
  @override
  final int? stargazersCount;

  @override
  String toString() {
    return 'RepositoryItem(name: $name, owner: $owner, language: $language, description: $description, stargazersCount: $stargazersCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RepositoryItemImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.owner, owner) || other.owner == owner) &&
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
      runtimeType, name, owner, language, description, stargazersCount);

  /// Create a copy of RepositoryItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RepositoryItemImplCopyWith<_$RepositoryItemImpl> get copyWith =>
      __$$RepositoryItemImplCopyWithImpl<_$RepositoryItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RepositoryItemImplToJson(
      this,
    );
  }
}

abstract class _RepositoryItem implements RepositoryItem {
  const factory _RepositoryItem(
      {required final String? name,
      required final Owner? owner,
      required final String? language,
      required final String? description,
      required final int? stargazersCount}) = _$RepositoryItemImpl;

  factory _RepositoryItem.fromJson(Map<String, dynamic> json) =
      _$RepositoryItemImpl.fromJson;

  @override
  String? get name;
  @override
  Owner? get owner;
  @override
  String? get language;
  @override
  String? get description;
  @override
  int? get stargazersCount;

  /// Create a copy of RepositoryItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RepositoryItemImplCopyWith<_$RepositoryItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Owner _$OwnerFromJson(Map<String, dynamic> json) {
  return _Owner.fromJson(json);
}

/// @nodoc
mixin _$Owner {
  String? get avatarUrl => throw _privateConstructorUsedError;

  /// Serializes this Owner to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Owner
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OwnerCopyWith<Owner> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OwnerCopyWith<$Res> {
  factory $OwnerCopyWith(Owner value, $Res Function(Owner) then) =
      _$OwnerCopyWithImpl<$Res, Owner>;
  @useResult
  $Res call({String? avatarUrl});
}

/// @nodoc
class _$OwnerCopyWithImpl<$Res, $Val extends Owner>
    implements $OwnerCopyWith<$Res> {
  _$OwnerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Owner
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? avatarUrl = freezed,
  }) {
    return _then(_value.copyWith(
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OwnerImplCopyWith<$Res> implements $OwnerCopyWith<$Res> {
  factory _$$OwnerImplCopyWith(
          _$OwnerImpl value, $Res Function(_$OwnerImpl) then) =
      __$$OwnerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? avatarUrl});
}

/// @nodoc
class __$$OwnerImplCopyWithImpl<$Res>
    extends _$OwnerCopyWithImpl<$Res, _$OwnerImpl>
    implements _$$OwnerImplCopyWith<$Res> {
  __$$OwnerImplCopyWithImpl(
      _$OwnerImpl _value, $Res Function(_$OwnerImpl) _then)
      : super(_value, _then);

  /// Create a copy of Owner
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? avatarUrl = freezed,
  }) {
    return _then(_$OwnerImpl(
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OwnerImpl implements _Owner {
  const _$OwnerImpl({required this.avatarUrl});

  factory _$OwnerImpl.fromJson(Map<String, dynamic> json) =>
      _$$OwnerImplFromJson(json);

  @override
  final String? avatarUrl;

  @override
  String toString() {
    return 'Owner(avatarUrl: $avatarUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OwnerImpl &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, avatarUrl);

  /// Create a copy of Owner
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OwnerImplCopyWith<_$OwnerImpl> get copyWith =>
      __$$OwnerImplCopyWithImpl<_$OwnerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OwnerImplToJson(
      this,
    );
  }
}

abstract class _Owner implements Owner {
  const factory _Owner({required final String? avatarUrl}) = _$OwnerImpl;

  factory _Owner.fromJson(Map<String, dynamic> json) = _$OwnerImpl.fromJson;

  @override
  String? get avatarUrl;

  /// Create a copy of Owner
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OwnerImplCopyWith<_$OwnerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
