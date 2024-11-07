import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:git_repository/models/repository_item/repository_item.dart';

part 'search_repository.freezed.dart';
part 'search_repository.g.dart';

@freezed
class SearchRepository with _$SearchRepository {
  const factory SearchRepository({
    required int totalCount,
    required List<RepositoryItem> items,
  }) = _SearchRepository;

  factory SearchRepository.fromJson(Map<String, dynamic> json) =>
      _$SearchRepositoryFromJson(json);
}
