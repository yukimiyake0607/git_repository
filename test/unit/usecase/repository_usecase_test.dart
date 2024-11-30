import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:git_repository/data/datastore/repository_datastore.dart';
import 'package:git_repository/data/usecase/repository_usecase.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

import '../mock/datastore/datastore_mock.mocks.dart';

void main() {
  late RepositoryDatastore mockRepositoryDatastore;
  late RepositoryUsecase repositoryUsecase;

  setUp(() {
    mockRepositoryDatastore = MockRepositoryDatastore();
    repositoryUsecase = RepositoryUsecase(mockRepositoryDatastore);
  });

  group('fetchRepository', () {
    test('ステータスコード200の場合、Result.successを返す', () async {
      // Arrange
      when(mockRepositoryDatastore.fetchRepository(keyword: 'flutter', page: 1))
          .thenAnswer((_) async => http.Response(
              jsonEncode({
                'total_count': 1,
                'items': [
                  {
                    'name': 'flutter',
                    'description':
                        'Flutter makes it easy and fast to build beautiful apps',
                    'language': 'Dart',
                    'stargazers_count': 1000,
                  }
                ]
              }),
              200));

      // Act
      final response = await repositoryUsecase.fetchRepository('flutter', 1);

      // Assert
      response.when(success: (data) {
        expect(data.totalCount, 1);
        expect(data.items[0].name, equals('flutter'));
      }, exception: (error) {
        fail('Should not be exception');
      });
    });

    group('エラーケース: Result.exceptionを返す', () {
      test('304: 新しいデータがない場合', () async {
        // Arrange
        when(mockRepositoryDatastore.fetchRepository(
                keyword: 'flutter', page: 1))
            .thenAnswer((_) async => http.Response('Not modified', 304));

        // Act
        final response = await repositoryUsecase.fetchRepository('flutter', 1);

        // Assert
        response.when(success: (_) {
          fail('failed');
        }, exception: (error) {
          expect(error.statusCode, equals(304));
          expect(error.message, equals('新しいデータはありません'));
        });
      });

      test('422: 検索ワードが無効な場合', () async {
        // Arrange
        when(mockRepositoryDatastore.fetchRepository(
                keyword: 'flutter', page: 1))
            .thenAnswer(
          (_) async => http.Response(
            'Validation failed, or the endpoint has been spammed.',
            422,
          ),
        );

        // Act
        final response = await repositoryUsecase.fetchRepository('flutter', 1);

        // Assert
        response.when(success: (data) {
          fail('Failed');
        }, exception: (error) {
          expect(error.statusCode, equals(422));
          expect(error.message, equals('検索ワードが無効です'));
        });
      });

      test('503: サービス利用不可の場合', () async {
        // Arrage
        when(mockRepositoryDatastore.fetchRepository(
                keyword: 'flutter', page: 1))
            .thenAnswer((_) async => http.Response('Service unavailable', 503));

        // Act
        final response = await repositoryUsecase.fetchRepository('flutter', 1);

        // Assert
        response.when(
          success: (_) {
            fail('Failed');
          },
          exception: (error) {
            expect(error.statusCode, equals(503));
            expect(error.message, equals('時間をおいて再度お試し下さい'));
          },
        );
      });

      test('statusCodeが上記以外の場合', () async {
        // Arrange
        // 499はその他の代表で選択
        when(mockRepositoryDatastore.fetchRepository(
                keyword: 'flutter', page: 1))
            .thenAnswer(
                (_) async => http.Response('Client Closed Request', 499));

        // Act
        final response = await repositoryUsecase.fetchRepository('flutter', 1);

        // Assert
        response.when(
          success: (_) {
            fail('failed');
          },
          exception: (error) {
            expect(error.statusCode, equals(499));
            expect(error.message, equals('予期せぬエラーが発生しました'));
          },
        );
      });
    });
  });
}
