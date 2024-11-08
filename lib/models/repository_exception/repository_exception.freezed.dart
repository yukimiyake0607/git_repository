// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'repository_exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RepositoryException {
  int get statusCode => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  /// Create a copy of RepositoryException
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RepositoryExceptionCopyWith<RepositoryException> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepositoryExceptionCopyWith<$Res> {
  factory $RepositoryExceptionCopyWith(
          RepositoryException value, $Res Function(RepositoryException) then) =
      _$RepositoryExceptionCopyWithImpl<$Res, RepositoryException>;
  @useResult
  $Res call({int statusCode, String message});
}

/// @nodoc
class _$RepositoryExceptionCopyWithImpl<$Res, $Val extends RepositoryException>
    implements $RepositoryExceptionCopyWith<$Res> {
  _$RepositoryExceptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RepositoryException
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RepositoryExceptionImplCopyWith<$Res>
    implements $RepositoryExceptionCopyWith<$Res> {
  factory _$$RepositoryExceptionImplCopyWith(_$RepositoryExceptionImpl value,
          $Res Function(_$RepositoryExceptionImpl) then) =
      __$$RepositoryExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int statusCode, String message});
}

/// @nodoc
class __$$RepositoryExceptionImplCopyWithImpl<$Res>
    extends _$RepositoryExceptionCopyWithImpl<$Res, _$RepositoryExceptionImpl>
    implements _$$RepositoryExceptionImplCopyWith<$Res> {
  __$$RepositoryExceptionImplCopyWithImpl(_$RepositoryExceptionImpl _value,
      $Res Function(_$RepositoryExceptionImpl) _then)
      : super(_value, _then);

  /// Create a copy of RepositoryException
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = null,
    Object? message = null,
  }) {
    return _then(_$RepositoryExceptionImpl(
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RepositoryExceptionImpl implements _RepositoryException {
  const _$RepositoryExceptionImpl(
      {required this.statusCode, required this.message});

  @override
  final int statusCode;
  @override
  final String message;

  @override
  String toString() {
    return 'RepositoryException(statusCode: $statusCode, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RepositoryExceptionImpl &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, statusCode, message);

  /// Create a copy of RepositoryException
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RepositoryExceptionImplCopyWith<_$RepositoryExceptionImpl> get copyWith =>
      __$$RepositoryExceptionImplCopyWithImpl<_$RepositoryExceptionImpl>(
          this, _$identity);
}

abstract class _RepositoryException implements RepositoryException {
  const factory _RepositoryException(
      {required final int statusCode,
      required final String message}) = _$RepositoryExceptionImpl;

  @override
  int get statusCode;
  @override
  String get message;

  /// Create a copy of RepositoryException
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RepositoryExceptionImplCopyWith<_$RepositoryExceptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
