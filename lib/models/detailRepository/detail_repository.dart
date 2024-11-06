import 'package:freezed_annotation/freezed_annotation.dart';

part 'detail_repository.freezed.dart';
part 'detail_repository.g.dart';

@freezed
class DetailRepository with _$DetailRepository {
  const factory DetailRepository({
    required String name,
    required String avatarUrl,
    required String description,
    required String language,
    required int stargazersCount,
    required int watchersCount,
    required int forksCount,
    required int openIssuesCount,
  }) = _DetailRepository;
  
  factory DetailRepository.fromJson(Map<String, dynamic> json) => _$DetailRepositoryFromJson(json);
}