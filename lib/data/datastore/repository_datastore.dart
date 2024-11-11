import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:git_repository/core/result/result.dart';
import 'package:git_repository/models/repository_exception/repository_exception.dart';
import 'package:git_repository/models/searchRepository/search_repository.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repository_datastore.g.dart';

@riverpod
RepositoryDatastore repositoryDatastore(Ref ref) {
  return RepositoryDatastore();
}

class RepositoryDatastore {
  final String _baseUrl = 'https://api.github.com/';
  final String _searchUrl = 'search/repositories';

  Future<Result<SearchRepository, RepositoryException>> fetchRepository({
    required String keyword,
    required int page,
  }) async {
    try {
      String uri = '$_baseUrl$_searchUrl?q=$keyword&page=$page';
      final url = Uri.parse(uri);
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final json = await jsonDecode(response.body) as Map<String, dynamic>;
        final repository = SearchRepository.fromJson(json);
        return Result.success(repository);
      }

      return Result.exception(
        RepositoryException.fromStatusCode(response.statusCode),
      );
    } on Exception catch (_) {
      return Result.exception(RepositoryException.fromStatusCode(0));
    }
  }
}
