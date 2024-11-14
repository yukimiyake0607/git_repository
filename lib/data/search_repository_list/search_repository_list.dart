import 'package:git_repository/core/result/result.dart';
import 'package:git_repository/data/usecase/repository_usecase.dart';
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
    state = const AsyncValue.loading();

    try {
      final usecase = ref.read(repositoryUsecaseProvider);
      final result = await usecase.fetchRepository(keyword, page);
      state = AsyncData(result);
    } on Exception catch (e, stack) {
      state = AsyncError(e, stack);
    }
  }

  Future<void> clearRepository() async {
    state = const AsyncValue.loading();

    state = AsyncValue.data(
        Result.success(SearchRepository(totalCount: 0, items: [])));
  }
}
