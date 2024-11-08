import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
class Result<T, E> with _$Result<T, E> {
  const factory Result.success(T value) = Success<T, E>;
  const factory Result.exception(E error) = ResultException<T, E>;
}
