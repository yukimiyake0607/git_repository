import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:git_repository/app/router.dart';
import 'package:git_repository/core/result/result.dart';
import 'package:git_repository/data/search_repository_list/search_repository_list.dart';
import 'package:git_repository/data/usecase/repository_usecase.dart';
import 'package:git_repository/models/repository_exception/repository_exception.dart';
import 'package:git_repository/models/repository_item/repository_item.dart';
import 'package:git_repository/models/searchRepository/search_repository.dart';
import 'package:git_repository/ui/screens/search_screen.dart';
import 'package:git_repository/ui/widgets/textfield_search.dart';
import 'package:mockito/mockito.dart';

import '../unit/mock/usecase/usecase_mock.mocks.dart';

Owner createTestOwner({String? avatarUrl = ''}) {
  return Owner(avatarUrl: avatarUrl);
}

RepositoryItem createTestRepository({
  String name = 'test-repo',
  String? avatarUrl = '',
  String language = 'Dart',
  String description = 'Test description',
  int stargazersCount = 10,
  int watchersCount = 10,
  int forksCount = 3,
  int openIssuesCount = 2,
}) {
  return RepositoryItem(
    name: name,
    owner: createTestOwner(avatarUrl: avatarUrl),
    language: language,
    description: description,
    stargazersCount: stargazersCount,
    watchersCount: watchersCount,
    forksCount: forksCount,
    openIssuesCount: openIssuesCount,
  );
}

void main() {
  late MockRepositoryUsecase mockRepositoryUsecase;

  setUp(() {
    mockRepositoryUsecase = MockRepositoryUsecase();
  });

  testWidgets('初期表示の確認', (tester) async {
    // Arrange
    when(mockRepositoryUsecase.fetchRepository('flutter', 1)).thenAnswer(
        (_) async =>
            Result.success(SearchRepository(totalCount: 0, items: [])));

    // SearchScreenのインスタンスを生成
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          repositoryUsecaseProvider.overrideWithValue(mockRepositoryUsecase),
        ],
        child: const MaterialApp(
          home: SearchScreen(),
        ),
      ),
    );

    // Assert
    expect(find.text('GitHub'), findsOneWidget);
    expect(find.byType(TextfieldSearch), findsOneWidget);
    expect(find.text('0件'), findsOneWidget);
  });

  testWidgets('検索結果が正しく表示される', (tester) async {
    // Arrange
    final mockRepositories = [
      createTestRepository(
        name: 'flutter',
        description: 'Flutter makes it easy',
      ),
      createTestRepository(
        name: 'flutter',
        description: 'Flutter makes it easy',
      ),
    ];

    when(mockRepositoryUsecase.fetchRepository('flutter', 1))
        .thenAnswer((_) async => Result.success(SearchRepository(
              totalCount: mockRepositories.length,
              items: mockRepositories,
            )));

    // Act
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          repositoryUsecaseProvider.overrideWithValue(mockRepositoryUsecase),
        ],
        child: MaterialApp.router(
          routerConfig: router,
        ),
      ),
    );

    await tester.pump();

    // プロバイダのメソッドを呼び出し
    final container =
        ProviderScope.containerOf(tester.element(find.byType(SearchScreen)));
    await container
        .read(searchRepositoryListProvider.notifier)
        .fetchRepository('flutter');

    await tester.pump();
    await tester.pump();

    // Assert
    expect(find.text('flutter'), findsNWidgets(2));
    expect(find.text('Dart'), findsNWidgets(2));
    expect(find.text('Flutter makes it easy'), findsNWidgets(2));
    expect(find.text('10'), findsNWidgets(2));

    // アイコンの検証
    expect(find.byIcon(Icons.language), findsNWidgets(2));
    expect(find.byIcon(Icons.stars_rounded), findsNWidgets(2));

    // ウィジェットの検証
    expect(find.byType(CircleAvatar), findsNWidgets(2));
    expect(find.byType(ListTile), findsNWidgets(2));
    expect(find.byType(Divider), findsNWidgets(3));
  });

  testWidgets('エラー時に適切なメッセージが表示される', (tester) async {
    // Arrange
    when(mockRepositoryUsecase.fetchRepository('flutter', 1)).thenAnswer(
        (_) async => Result.exception(
            RepositoryException(statusCode: 422, message: '検索ワードが無効です')));

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          repositoryUsecaseProvider.overrideWithValue(mockRepositoryUsecase),
        ],
        child: MaterialApp.router(
          routerConfig: router,
        ),
      ),
    );

    final container =
        ProviderScope.containerOf(tester.element(find.byType(SearchScreen)));

    // Act
    await container
        .read(searchRepositoryListProvider.notifier)
        .fetchRepository('flutter');

    await tester.pump();

    // Assert
    expect(find.text('検索ワードが無効です'), findsOneWidget);
  });

  testWidgets('ローディング中にインジケータが表示される', (tester) async {
    // Arrange
    when(mockRepositoryUsecase.fetchRepository('flutter', 1))
        .thenAnswer((_) async {
      return Result.success(SearchRepository(totalCount: 0, items: []));
    });

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          repositoryUsecaseProvider.overrideWithValue(mockRepositoryUsecase)
        ],
        child: MaterialApp.router(
          routerConfig: router,
        ),
      ),
    );

    // Act & Assert
    await tester.runAsync(() async {
      final container =
          ProviderScope.containerOf(tester.element(find.byType(SearchScreen)));

      // Act
      container
          .read(searchRepositoryListProvider.notifier)
          .fetchRepository('flutter');

      await tester.pump();

      // Assert
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });
  });

  testWidgets('検索結果が0件の場合、適切なメッセージが表示される', (tester) async {
    // Arrange
    when(mockRepositoryUsecase.fetchRepository('flutter', 1))
        .thenAnswer((_) async {
      return Result.success(SearchRepository(totalCount: 0, items: []));
    });

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          repositoryUsecaseProvider.overrideWithValue(mockRepositoryUsecase)
        ],
        child: MaterialApp.router(
          routerConfig: router,
        ),
      ),
    );

    final container =
        ProviderScope.containerOf(tester.element(find.byType(SearchScreen)));

    // Act
    await container
        .read(searchRepositoryListProvider.notifier)
        .fetchRepository('flutter');

    await tester.pumpAndSettle();

    // Assert
    expect(find.text('Repository Not Found'), findsOneWidget);
  });

  testWidgets('リポジトリタップで詳細画面に遷移する', (tester) async {
    // Arrange
    final mockRepositories = [
      createTestRepository(
        name: 'flutter',
        description: 'Flutter makes it easy',
        avatarUrl: null,
      ),
      createTestRepository(
        name: 'flutter',
        description: 'Flutter makes it easy',
        avatarUrl: null,
      ),
    ];

    when(mockRepositoryUsecase.fetchRepository('flutter', 1))
        .thenAnswer((_) async => Result.success(SearchRepository(
              totalCount: mockRepositories.length,
              items: mockRepositories,
            )));

    // Act
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          repositoryUsecaseProvider.overrideWithValue(mockRepositoryUsecase),
        ],
        child: MaterialApp.router(
          routerConfig: router,
        ),
      ),
    );

    await tester.pump();

    // プロバイダのメソッドを呼び出し
    final container =
        ProviderScope.containerOf(tester.element(find.byType(SearchScreen)));
    await container
        .read(searchRepositoryListProvider.notifier)
        .fetchRepository('flutter');

    await tester.pump();
    await tester.pump();

    await tester.tap(find.byType(ListTile).first);
    await tester.pumpAndSettle();

    expect(find.text('リポジトリ詳細'), findsOneWidget);
  });

  testWidgets('画面遷移の詳細なテスト', (tester) async {
    // テスト環境のサイズを設定
    tester.view.physicalSize = Size(1080, 1920);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.reset();
    });

    // Arrange
    final mockRepositories = [
      createTestRepository(name: 'repo-1', watchersCount: 9, avatarUrl: null),
      createTestRepository(name: 'repo-2', avatarUrl: null),
    ];

    when(mockRepositoryUsecase.fetchRepository('flutter', 1))
        .thenAnswer((_) async {
      return Result.success(SearchRepository(
        totalCount: mockRepositories.length,
        items: mockRepositories,
      ));
    });

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          repositoryUsecaseProvider.overrideWithValue(mockRepositoryUsecase)
        ],
        child: MaterialApp.router(
          routerConfig: router,
        ),
      ),
    );

    final container =
        ProviderScope.containerOf(tester.element(find.byType(SearchScreen)));

    await container
        .read(searchRepositoryListProvider.notifier)
        .fetchRepository('flutter');

    await tester.pump();
    expect(find.byType(ListTile), findsWidgets);

    // Act
    await tester.tap(find.byType(ListTile).first);
    await tester.pumpAndSettle();

    // Assert
    expect(find.text('repo-1'), findsOneWidget);
    expect(find.text('Dart'), findsOneWidget);
    expect(find.text('Test description'), findsOneWidget);
    expect(find.text('10'), findsOneWidget);
    expect(find.text('9'), findsOneWidget);
    expect(find.text('3'), findsOneWidget);
    expect(find.text('2'), findsOneWidget);
  });

  testWidgets('スクロールした際に追加データが読み込まれるか', (tester) async {
    // テスト環境のサイズを設定
    tester.view.physicalSize = Size(1080, 1920);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.reset();
    });

    // Arrange
    final firstRepositories = List.generate(30, (i) {
      return createTestRepository(
        name: 'repo-$i',
        description: 'description-$i',
        avatarUrl: null,
      );
    });

    final secondRepositories = List.generate(30, (i) {
      return createTestRepository(
        name: 'repo-${i + 30}',
        description: 'description-${i + 30}',
        avatarUrl: null,
      );
    });

    // モックの設定
    when(mockRepositoryUsecase.fetchRepository('flutter', 1))
        .thenAnswer((_) async {
      return Result.success(
        SearchRepository(
          totalCount: 60,
          items: firstRepositories,
        ),
      );
    });

    when(mockRepositoryUsecase.fetchRepository('flutter', 2))
        .thenAnswer((_) async {
      return Result.success(
        SearchRepository(
          totalCount: 60,
          items: secondRepositories,
        ),
      );
    });

    // ウィジェットのビルド
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          repositoryUsecaseProvider.overrideWithValue(mockRepositoryUsecase),
        ],
        child: MaterialApp.router(
          routerConfig: router,
        ),
      ),
    );
    await tester.pump();

    // プロバイダーの取得と初期データの読み込み
    final container =
        ProviderScope.containerOf(tester.element(find.byType(SearchScreen)));
    final notifier = container.read(searchRepositoryListProvider.notifier);
    await notifier.fetchRepository('flutter', isInitializing: true);
    await tester.pumpAndSettle();

    // 初期状態の確認
    expect(notifier.allItems.length, equals(30));
    expect(find.text('repo-0'), findsOneWidget);

    // スクロール処理
    final scrollView = find.byType(CustomScrollView);
    final scrollController =
        tester.widget<CustomScrollView>(scrollView).controller;

    if (scrollController != null) {
      final maxScroll = scrollController.position.maxScrollExtent;
      await tester.drag(scrollView, Offset(0, -(maxScroll + 100)));
      await tester.pump();

      // データ読み込みの完了を待つ
      await tester.pump();
      await tester.pumpAndSettle();

      // モックの呼び出しを確認
      verify(mockRepositoryUsecase.fetchRepository('flutter', 2)).called(1);

      // UIの更新を待つ
      await tester.pumpAndSettle();
    }

    // 最終検証
    expect(notifier.allItems.length, equals(60));
    expect(notifier.allItems.first.name, equals('repo-0'));
    expect(notifier.allItems.last.name, equals('repo-59'));
  });
}
