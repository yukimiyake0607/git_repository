import 'package:flutter_riverpod/flutter_riverpod.dart';
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
    String uri = '$_baseUrl$_searchUrl?q=$keyword&page=$page';
    final url = Uri.parse(uri);
    final response = await _client.get(url);
    return response;
  }
}
