import 'package:freezed_annotation/freezed_annotation.dart';

part 'repository_exception.freezed.dart';

@freezed
class RepositoryException with _$RepositoryException {
  const factory RepositoryException({
    required int statusCode,
    required String message,
  }) = _RepositoryException;

  factory RepositoryException.fromStatusCode(int statusCode) {
    return RepositoryException(
      statusCode: statusCode,
      message: switch (statusCode) {
        304 => '新しいデータはありません',
        422 => '検索ワードが無効です',
        503 => '時間をおいて再度お試し下さい',
        _ => '予期せぬエラーが発生しました',
      },
    );
  }
}
