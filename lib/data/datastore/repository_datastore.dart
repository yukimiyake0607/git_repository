import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:git_repository/token.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repository_datastore.g.dart';

@riverpod
RepositoryDatastore repositoryDatastore(Ref ref) {
  final client = http.Client();
  return RepositoryDatastore(client);
}

class RepositoryDatastore {
  RepositoryDatastore(this._client);

  final http.Client _client;
  final String _baseUrl = 'https://api.github.com/';
  final String _searchUrl = 'search/repositories';

  Future<http.Response> fetchRepository({
    required String keyword,
    required int page,
  }) async {
    final queryParams = {
      'q': keyword,
      'page': page.toString(),
      'per_page': '30',
    };
    final uri =
        Uri.parse(_baseUrl + _searchUrl).replace(queryParameters: queryParams);
    final response = await _client.get(
      uri,
      headers: {
        'Accept': 'application/vnd.github.v3+json',
        'Authorization': 'Bearer $token',
        // レスポンスヘッダーでRate Limitを確認するため
        'X-GitHub-Api-Version': '2022-11-28',
      },
    );

    return response;
  }
}
