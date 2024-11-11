import 'package:git_repository/core/result/result.dart';
import 'package:git_repository/data/datastore/repository_datastore.dart';
import 'package:git_repository/models/repository_exception/repository_exception.dart';
import 'package:git_repository/models/searchRepository/search_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_repository_list.g.dart';

@riverpod
class SearchRepositoryList extends _$SearchRepositoryList {
  @override
  FutureOr<Result<SearchRepository, RepositoryException>> build() {
    return Result.success(SearchRepository(totalCount: 0, items: []));
  }

  Future<void> fetchRepository(
    String keyword,
    int page,
  ) async {
    state = AsyncValue.loading();

    try {
      final datastore = ref.read(repositoryDatastoreProvider);
      final result =
          await datastore.fetchRepository(keyword: keyword, page: page);
      state = AsyncValue.data(result);
    } on Exception catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }
}
