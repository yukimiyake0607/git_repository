import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
class Result<T> with _$Result<T> {
  const factory Result.success(T value) = Success<T>;
  const factory Result.error(Error error) = ResultError<T>;
  const factory Result.exception(Exception exception) = ResultException<T>;
}
