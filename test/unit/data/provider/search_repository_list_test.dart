import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:git_repository/core/result/result.dart';
import 'package:git_repository/data/search_repository_list/search_repository_list.dart';
import 'package:git_repository/data/usecase/repository_usecase.dart';
import 'package:git_repository/models/repository_exception/repository_exception.dart';
import 'package:git_repository/models/repository_item/repository_item.dart';
import 'package:git_repository/models/searchRepository/search_repository.dart';
import 'package:mockito/mockito.dart';

import '../../mock/usecase/usecase_mock.mocks.dart';

void main() {
  late ProviderContainer container;
  late MockRepositoryUsecase mockRepositoryUsecase;
  setUp(() {
    mockRepositoryUsecase = MockRepositoryUsecase();
    container = ProviderContainer(
      overrides: [
        repositoryUsecaseProvider.overrideWithValue(mockRepositoryUsecase),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  test(
    'プロバイダの初期状態の検証: 空のSearchRepositoryを返すか',
    () async {
      final provider = container.read(searchRepositoryListProvider);
      expect(provider,
          isA<AsyncValue<Result<SearchRepository, RepositoryException>>>());

      provider.when(
        data: (result) {
          result.when(
            success: (data) {
              expect(data.totalCount, equals(0));
              expect(data.items, []);
            },
            exception: (error) {
              fail('should not be exception');
            },
          );
        },
        error: (_, __) => fail('should not be exception'),
        loading: () => fail('should not be error'),
      );
    },
  );

  group('fetchRepositoryのテストグループ', () {
    late List<RepositoryItem> repositoryListItem;
    repositoryListItem = List.generate(
      30,
      (i) => RepositoryItem(
        name: 'repo$i',
        owner: null,
        language: 'Dart',
        description: '',
        stargazersCount: 10,
        watchersCount: 10,
        forksCount: 10,
        openIssuesCount: 10,
      ),
    );
    test('初回検索時(isInitializing = true)の動作テスト', () async {
      // Arrange
      when(mockRepositoryUsecase.fetchRepository('flutter', 1)).thenAnswer(
        (_) async => Result.success(
          SearchRepository(
            totalCount: 30,
            items: repositoryListItem,
          ),
        ),
      );

      // Act
      await container
          .read(searchRepositoryListProvider.notifier)
          .fetchRepository('flutter');

      // Assert
      final state = container.read(searchRepositoryListProvider);
      state.when(
        data: (result) {
          result.when(
            success: (data) {
              expect(data.totalCount, equals(30));
              expect(data.items.length, equals(30));
            },
            exception: (error) {},
          );
        },
        error: (_, __) => fail('should not be error'),
        loading: () => fail('should not be loading'),
      );
    });

    test('エラー発生時の動作検証', () async {
      // Arrange
      when(mockRepositoryUsecase.fetchRepository('flutter', 1)).thenAnswer(
          (_) async => Result.exception(
              RepositoryException(statusCode: 422, message: '検索ワードが無効です')));

      // Act
      await container
          .read(searchRepositoryListProvider.notifier)
          .fetchRepository('flutter');

      // Assert
      final state = container.read(searchRepositoryListProvider);
      state.when(
        data: (result) {
          result.when(
            success: (_) {
              fail('should not be success');
            },
            exception: (error) {
              expect(error.statusCode, equals(422));
              expect(error.message, equals('検索ワードが無効です'));
            },
          );
        },
        error: (_, __) => fail('should not be exception'),
        loading: () => fail('should not be loading'),
      );
    });

    test('hasPageがfalseの場合、新しいデータを取得しない', () async {
      // Arrange
      final notifier = container.read(searchRepositoryListProvider.notifier);

      //1回目の呼び出し設定
      when(mockRepositoryUsecase.fetchRepository('flutter', 1)).thenAnswer(
        (_) async => Result.success(
          SearchRepository(
            totalCount: 30,
            items: repositoryListItem,
          ),
        ),
      );

      // 2回目の呼び出し設定: pageを2に設定
      when(mockRepositoryUsecase.fetchRepository('flutter', 2)).thenAnswer(
        (_) async => Result.success(
          SearchRepository(
            totalCount: 30,
            items: repositoryListItem,
          ),
        ),
      );

      // Act&Assert
      // 1回目の呼び出し
      await notifier.fetchRepository('flutter');

      // 1回目の呼び出しを確認
      verify(mockRepositoryUsecase.fetchRepository('flutter', 1)).called(1);

      // 2回目の呼び出し（hasPageがfalseなので新しいリクエストは行われないはず）
      await notifier.loadMore();

      // 2回目の呼び出しがないことを確認
      verifyNever(mockRepositoryUsecase.fetchRepository('flutter', 2));
    });

    test('hasPageがtrueの場合、新しいデータを取得する', () async {
      // Assert
      final notifier = container.read(searchRepositoryListProvider.notifier);
      const keyword = 'flutter';
      // 1回目の呼び出し設定
      when(mockRepositoryUsecase.fetchRepository(keyword, 1)).thenAnswer(
        (_) async => Result.success(
          SearchRepository(
            totalCount: 100,
            items: repositoryListItem,
          ),
        ),
      );

      // 2回目の呼び出し設定
      when(mockRepositoryUsecase.fetchRepository(keyword, 2)).thenAnswer(
        (_) async => Result.success(
          SearchRepository(
            totalCount: 100,
            items: repositoryListItem,
          ),
        ),
      );

      // Act & Assert
      // 1回目の実行および確認
      await notifier.fetchRepository('flutter', isInitializing: true);
      verify(mockRepositoryUsecase.fetchRepository(keyword, 1)).called(1);
      expect(notifier.hasPage, isTrue);
      expect(notifier.currentPage, equals(2));

      // 2回目の実行および確認
      await notifier.loadMore();
      verify(mockRepositoryUsecase.fetchRepository(keyword, 2)).called(1);
      expect(notifier.currentPage, equals(3));
    });
  });

  test('clearRepository: 状態が初期化される', () async {
    // Arrange
    final notifier = container.read(searchRepositoryListProvider.notifier);
    List<RepositoryItem> repositoryItemList = List.generate(30, (i) {
      return RepositoryItem(
        name: 'repo$i',
        owner: null,
        language: 'Dart',
        description: '',
        stargazersCount: 10,
        watchersCount: 10,
        forksCount: 10,
        openIssuesCount: 10,
      );
    });

    when(mockRepositoryUsecase.fetchRepository('flutter', 1)).thenAnswer(
      (_) async => Result.success(
        SearchRepository(
          totalCount: 30,
          items: repositoryItemList,
        ),
      ),
    );

    // fetchRepositoryを実行
    await notifier.fetchRepository('flutter', isInitializing: true);

    // プロバイダの値はrepositoryItemListになっているはず
    verify(mockRepositoryUsecase.fetchRepository('flutter', 1)).called(1);
    expect(notifier.allItems, equals(repositoryItemList));

    // Act
    await notifier.clearRepository();

    // Assert
    expect(notifier.allItems, equals([]));
  });
}
