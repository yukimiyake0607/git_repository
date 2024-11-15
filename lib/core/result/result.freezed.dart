// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Result<T, E> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T value) success,
    required TResult Function(E error) exception,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T value)? success,
    TResult? Function(E error)? exception,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T value)? success,
    TResult Function(E error)? exception,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Success<T, E> value) success,
    required TResult Function(ResultException<T, E> value) exception,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Success<T, E> value)? success,
    TResult? Function(ResultException<T, E> value)? exception,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success<T, E> value)? success,
    TResult Function(ResultException<T, E> value)? exception,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultCopyWith<T, E, $Res> {
  factory $ResultCopyWith(
          Result<T, E> value, $Res Function(Result<T, E>) then) =
      _$ResultCopyWithImpl<T, E, $Res, Result<T, E>>;
}

/// @nodoc
class _$ResultCopyWithImpl<T, E, $Res, $Val extends Result<T, E>>
    implements $ResultCopyWith<T, E, $Res> {
  _$ResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Result
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<T, E, $Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl<T, E> value, $Res Function(_$SuccessImpl<T, E>) then) =
      __$$SuccessImplCopyWithImpl<T, E, $Res>;
  @useResult
  $Res call({T value});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<T, E, $Res>
    extends _$ResultCopyWithImpl<T, E, $Res, _$SuccessImpl<T, E>>
    implements _$$SuccessImplCopyWith<T, E, $Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl<T, E> _value, $Res Function(_$SuccessImpl<T, E>) _then)
      : super(_value, _then);

  /// Create a copy of Result
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_$SuccessImpl<T, E>(
      freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$SuccessImpl<T, E> implements Success<T, E> {
  const _$SuccessImpl(this.value);

  @override
  final T value;

  @override
  String toString() {
    return 'Result<$T, $E>.success(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl<T, E> &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  /// Create a copy of Result
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<T, E, _$SuccessImpl<T, E>> get copyWith =>
      __$$SuccessImplCopyWithImpl<T, E, _$SuccessImpl<T, E>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T value) success,
    required TResult Function(E error) exception,
  }) {
    return success(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T value)? success,
    TResult? Function(E error)? exception,
  }) {
    return success?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T value)? success,
    TResult Function(E error)? exception,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Success<T, E> value) success,
    required TResult Function(ResultException<T, E> value) exception,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Success<T, E> value)? success,
    TResult? Function(ResultException<T, E> value)? exception,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success<T, E> value)? success,
    TResult Function(ResultException<T, E> value)? exception,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Success<T, E> implements Result<T, E> {
  const factory Success(final T value) = _$SuccessImpl<T, E>;

  T get value;

  /// Create a copy of Result
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessImplCopyWith<T, E, _$SuccessImpl<T, E>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResultExceptionImplCopyWith<T, E, $Res> {
  factory _$$ResultExceptionImplCopyWith(_$ResultExceptionImpl<T, E> value,
          $Res Function(_$ResultExceptionImpl<T, E>) then) =
      __$$ResultExceptionImplCopyWithImpl<T, E, $Res>;
  @useResult
  $Res call({E error});
}

/// @nodoc
class __$$ResultExceptionImplCopyWithImpl<T, E, $Res>
    extends _$ResultCopyWithImpl<T, E, $Res, _$ResultExceptionImpl<T, E>>
    implements _$$ResultExceptionImplCopyWith<T, E, $Res> {
  __$$ResultExceptionImplCopyWithImpl(_$ResultExceptionImpl<T, E> _value,
      $Res Function(_$ResultExceptionImpl<T, E>) _then)
      : super(_value, _then);

  /// Create a copy of Result
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$ResultExceptionImpl<T, E>(
      freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as E,
    ));
  }
}

/// @nodoc

class _$ResultExceptionImpl<T, E> implements ResultException<T, E> {
  const _$ResultExceptionImpl(this.error);

  @override
  final E error;

  @override
  String toString() {
    return 'Result<$T, $E>.exception(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultExceptionImpl<T, E> &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  /// Create a copy of Result
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResultExceptionImplCopyWith<T, E, _$ResultExceptionImpl<T, E>>
      get copyWith => __$$ResultExceptionImplCopyWithImpl<T, E,
          _$ResultExceptionImpl<T, E>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T value) success,
    required TResult Function(E error) exception,
  }) {
    return exception(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T value)? success,
    TResult? Function(E error)? exception,
  }) {
    return exception?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T value)? success,
    TResult Function(E error)? exception,
    required TResult orElse(),
  }) {
    if (exception != null) {
      return exception(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Success<T, E> value) success,
    required TResult Function(ResultException<T, E> value) exception,
  }) {
    return exception(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Success<T, E> value)? success,
    TResult? Function(ResultException<T, E> value)? exception,
  }) {
    return exception?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success<T, E> value)? success,
    TResult Function(ResultException<T, E> value)? exception,
    required TResult orElse(),
  }) {
    if (exception != null) {
      return exception(this);
    }
    return orElse();
  }
}

abstract class ResultException<T, E> implements Result<T, E> {
  const factory ResultException(final E error) = _$ResultExceptionImpl<T, E>;

  E get error;

  /// Create a copy of Result
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResultExceptionImplCopyWith<T, E, _$ResultExceptionImpl<T, E>>
      get copyWith => throw _privateConstructorUsedError;
}
