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
  int get totalCount => throw _privateConstructorUsedError;
  List<RepositoryItem> get items => throw _privateConstructorUsedError;

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
  $Res call({int totalCount, List<RepositoryItem> items});
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
    Object? totalCount = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<RepositoryItem>,
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
  $Res call({int totalCount, List<RepositoryItem> items});
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
    Object? totalCount = null,
    Object? items = null,
  }) {
    return _then(_$SearchRepositoryImpl(
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<RepositoryItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchRepositoryImpl implements _SearchRepository {
  const _$SearchRepositoryImpl(
      {required this.totalCount, required final List<RepositoryItem> items})
      : _items = items;

  factory _$SearchRepositoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchRepositoryImplFromJson(json);

  @override
  final int totalCount;
  final List<RepositoryItem> _items;
  @override
  List<RepositoryItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'SearchRepository(totalCount: $totalCount, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchRepositoryImpl &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, totalCount, const DeepCollectionEquality().hash(_items));

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
      {required final int totalCount,
      required final List<RepositoryItem> items}) = _$SearchRepositoryImpl;

  factory _SearchRepository.fromJson(Map<String, dynamic> json) =
      _$SearchRepositoryImpl.fromJson;

  @override
  int get totalCount;
  @override
  List<RepositoryItem> get items;

  /// Create a copy of SearchRepository
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchRepositoryImplCopyWith<_$SearchRepositoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
