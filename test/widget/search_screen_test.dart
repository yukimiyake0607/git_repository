import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:git_repository/app/router.dart';
import 'package:git_repository/core/result/result.dart';
import 'package:git_repository/data/search_repository_list/search_repository_list.dart';
import 'package:git_repository/data/usecase/repository_usecase.dart';
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
}
