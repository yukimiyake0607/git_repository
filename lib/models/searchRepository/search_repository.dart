import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_repository.freezed.dart';
part 'search_repository.g.dart';

@freezed
class SearchRepository with _$SearchRepository {
  const factory SearchRepository({
    required String name,
    required String avatarUrl,
    required String language,
    required String description,
    required int stargazersCount,
  }) = _SearchRepository;

  factory SearchRepository.fromJson(Map<String, dynamic> json) =>
      _$SearchRepositoryFromJson(json);
}
