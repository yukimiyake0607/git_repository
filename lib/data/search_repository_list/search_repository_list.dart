import 'package:git_repository/core/result/result.dart';
import 'package:git_repository/data/usecase/repository_usecase.dart';
import 'package:git_repository/models/repository_exception/repository_exception.dart';
import 'package:git_repository/models/repository_item/repository_item.dart';
import 'package:git_repository/models/searchRepository/search_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_repository_list.g.dart';

@riverpod
class SearchRepositoryList extends _$SearchRepositoryList {
  int _currentPage = 1;
  List<RepositoryItem> _allItems = [];
  bool _hasPage = true;
  String _currentKeyword = '';

  // getter
  int get currentPage => _currentPage;
  List<RepositoryItem> get allItems => _allItems;
  bool get hasPage => _hasPage;
  String get currentKeyword => _currentKeyword;

  @override
  FutureOr<Result<SearchRepository, RepositoryException>> build() {
    return Result.success(SearchRepository(totalCount: 0, items: []));
  }

  Future<void> fetchRepository(String keyword,
      {bool isInitializing = false}) async {
    try {
      if (isInitializing) {
        _currentPage = 1;
        _allItems = [];
        _hasPage = true;
        _currentKeyword = keyword;
      }

      if (!_hasPage) return;

      state = AsyncValue.loading();
      final usecase = ref.read(repositoryUsecaseProvider);
      final result = await usecase.fetchRepository(keyword, _currentPage);

      state = AsyncValue.data(
        result.when(
          success: (repository) {
            _allItems.addAll(repository.items);

            if (repository.totalCount! > _allItems.length) {
              _hasPage = true;
            } else {
              _hasPage = false;
            }

            if (_hasPage) _currentPage++;

            return Result.success(
              SearchRepository(
                totalCount: repository.totalCount,
                items: _allItems,
              ),
            );
          },
          exception: (exception) {
            return Result.exception(exception);
          },
        ),
      );
    } on Exception catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  Future<void> clearRepository() async {
    state = const AsyncValue.loading();

    _allItems = [];
    _currentKeyword = '';
    _hasPage = true;
    _currentPage = 1;

    state = AsyncValue.data(
        Result.success(SearchRepository(totalCount: 0, items: [])));
  }

  Future<void> loadMore() async {
    if (!_hasPage) return;

    await fetchRepository(_currentKeyword);
  }
}
