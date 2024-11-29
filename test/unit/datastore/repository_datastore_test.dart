import 'dart:convert';
import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:git_repository/data/datastore/repository_datastore.dart';
import 'package:git_repository/models/repository_exception/repository_exception.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

import '../mock/http_client/client_mock.mocks.dart';

void main() {
  late MockClient mockHttpClient;
  late RepositoryDatastore repositoryDatastore;

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await dotenv.load(fileName: '.env');
  });

  setUp(() {
    mockHttpClient = MockClient();
    repositoryDatastore = RepositoryDatastore(mockHttpClient);
  });

  test('検索URLが正しく構築される', () async {
    // Act
    await repositoryDatastore.fetchRepository(keyword: 'flutter', page: 1);

    // Assert
    final response = verify(
      mockHttpClient.get(
        captureThat(isA<Uri>()),
        headers: anyNamed('headers'),
      ),
    );
    final uri = response.captured[0] as Uri;

    // URLの構造を検証
    expect(uri.scheme, equals('https'));
    expect(uri.host, equals('api.github.com'));
    expect(uri.path, equals('/search/repositories'));
    expect(uri.queryParameters['q'], equals('flutter'));
    expect(uri.queryParameters['page'], equals('1'));
    expect(uri.queryParameters['per_page'], equals('30'));
  });

  test('必要なヘッダーが正しく設定されている', () async {
    // Arrange
    final mockHttpClient = MockClient();
    final repositoryDatastore = RepositoryDatastore(mockHttpClient);

    when(mockHttpClient.get(any, headers: anyNamed('headers')))
        .thenAnswer((_) async => http.Response('{}', 200));

    // Act
    await repositoryDatastore.fetchRepository(keyword: 'flutter', page: 1);

    // Assert
    // captureThatで型を確認、取得
    final result = verify(mockHttpClient.get(
      any,
      headers: captureAnyNamed('headers'),
    ));

    final capturedHeaders = result.captured[0] as Map<String, String>;

    // ヘッダーを確認
    expect(capturedHeaders.containsKey('Accept'), isTrue);
    expect(capturedHeaders.containsKey('Authorization'), isTrue);
    expect(capturedHeaders.containsKey('X-GitHub-Api-Version'), isTrue);

    // ヘッダーの内容を確認
    expect(capturedHeaders['Accept'], 'application/vnd.github.v3+json');
    expect(capturedHeaders['Authorization'],
        'Bearer ${dotenv.env['GITHUB_TOKEN']}');
    expect(capturedHeaders['X-GitHub-Api-Version'], '2022-11-28');
  });

  group('正常系レスポンスのテストグループ', () {
    test('検索結果がある場合のレスポンス', () async {
      // Arrange
      final mockResponse = {
        'total_count': 1,
        'items': [
          {
            'name': 'test-repo',
            'owner': {
              'login': 'test-user',
              'avatar_url': 'https://example.com/avatar.png'
            },
            'description': 'Test repository',
            'language': 'Dart',
            'stargazers_count': 100,
          }
        ]
      };

      when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
          (_) async => http.Response(jsonEncode(mockResponse), 200));

      // Act
      final response = await repositoryDatastore.fetchRepository(
        keyword: 'flutter',
        page: 1,
      );

      // Assert
      expect(response.statusCode, 200);
      expect(jsonDecode(response.body), equals(mockResponse));
    });

    test('検索結果が空の場合のレスポンス', () async {
      // Arrange
      final mockResponse = {
        'total_count': 0,
        'items': [],
      };

      when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
          (_) async => http.Response(jsonEncode(mockResponse), 200));

      // Act
      final response = await repositoryDatastore.fetchRepository(
          keyword: 'flutter', page: 1);

      // Assert
      expect(jsonDecode(response.body)['items'], isEmpty);
      expect(response.statusCode, equals(200));
    });
  });

  group('エラー系レスポンスのテストグループ', () {
    test('304: 新しいデータがない場合', () async {
      // Arrange
      when(mockHttpClient.get(any, headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response('Not Modified', 304));

      // Act
      final response = await repositoryDatastore.fetchRepository(
          keyword: 'flutter', page: 1);

      // Assert
      expect(response.statusCode, 304);

      final exception = RepositoryException.fromStatusCode(response.statusCode);
      expect(exception.message, equals('新しいデータはありません'));
    });

    test('422: 検索ワードが無効な場合', () async {
      // Arrange
      when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
          (_) async => http.Response(
              'Validation failed, or the endpoint has been spammed.', 422));

      // Act
      final response =
          await repositoryDatastore.fetchRepository(keyword: 'fl@#%', page: 1);

      // Assert
      expect(response.statusCode, equals(422));

      final exception = RepositoryException.fromStatusCode(response.statusCode);
      expect(exception.message, equals('検索ワードが無効です'));
    });

    test('503: サービスが一時的に無効な場合', () async {
      // Arrange
      when(mockHttpClient.get(any, headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response('Service unavailable', 503));

      // Act
      final response = await repositoryDatastore.fetchRepository(
          keyword: 'flutter', page: 1);

      // Assert
      expect(response.statusCode, 503);

      final exception = RepositoryException.fromStatusCode(response.statusCode);
      expect(exception.message, equals('時間をおいて再度お試し下さい'));
    });

    test('予期せぬステータスコードの場合', () async {
      // Arrange
      when(mockHttpClient.get(any, headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response('Unknown Error', 499));

      // Act
      final response = await repositoryDatastore.fetchRepository(
          keyword: 'flutter', page: 1);

      // Assert
      expect(response.statusCode, equals(499));

      final exception = RepositoryException.fromStatusCode(response.statusCode);
      expect(exception.message, '予期せぬエラーが発生しました');
    });

    test('ネットワークエラーの場合', () async {
      // Arrange
      when(mockHttpClient.get(any, headers: anyNamed('headers')))
          .thenThrow(SocketException('Failed to connect'));

      // Assert
      expect(
          () =>
              repositoryDatastore.fetchRepository(keyword: 'flutter', page: 1),
          throwsA(isA<SocketException>()));
    });
  });

  group('環境変数のテスト', () {
    test('環境変数からトークンが正しく読み込まれているか', () async {
      // Arrange
      const testToken = 'test_token';
      dotenv.env['GITHUB_TOKEN'] = testToken;

      when(mockHttpClient.get(any, headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response('{}', 200));

      // Act
      await repositoryDatastore.fetchRepository(keyword: 'flutter', page: 1);

      // Assert
      final response = verify(
        mockHttpClient.get(
          any,
          headers: captureAnyNamed('headers'),
        ),
      );

      final headers = response.captured[0];
      expect(headers['Authorization'], equals('Bearer $testToken'));
    });

    test('トークンが未設定の場合', () async {
      // Arrange
      dotenv.env['GITHUB_TOKEN'] = '';

      when(mockHttpClient.get(any, headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response('{}', 200));

      // Act
      await repositoryDatastore.fetchRepository(keyword: 'flutter', page: 1);

      // Assert
      final response =
          verify(mockHttpClient.get(any, headers: captureAnyNamed('headers')));

      final headers = response.captured[0] as Map<String, String>;
      expect(headers['Authorization'], equals('Bearer '));
    });
  });
}
