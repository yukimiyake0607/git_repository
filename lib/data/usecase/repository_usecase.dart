import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:git_repository/core/result/result.dart';
import 'package:git_repository/data/datastore/repository_datastore.dart';
import 'package:git_repository/models/repository_exception/repository_exception.dart';
import 'package:git_repository/models/searchRepository/search_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repository_usecase.g.dart';

@riverpod
RepositoryUsecase repositoryUsecase(Ref ref) {
  final datastore = ref.watch(repositoryDatastoreProvider);
  return RepositoryUsecase(datastore);
}

class RepositoryUsecase {
  final RepositoryDatastore _datastore;
  RepositoryUsecase(this._datastore);

  Future<Result<SearchRepository, RepositoryException>> fetchRepository(
    String keyword,
    int page,
  ) async {
    final httpResponse =
        await _datastore.fetchRepository(keyword: keyword, page: page);

    if (httpResponse.statusCode == 200) {
      final json = jsonDecode(httpResponse.body) as Map<String, dynamic>;
      final response = SearchRepository.fromJson(json);
      return Result.success(response);
    }

    final repositoryException =
        RepositoryException.fromStatusCode(httpResponse.statusCode);
    return Result.exception(repositoryException);
  }
}
