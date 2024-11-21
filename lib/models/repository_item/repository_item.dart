import 'package:freezed_annotation/freezed_annotation.dart';

part 'repository_item.freezed.dart';
part 'repository_item.g.dart';

@freezed
class RepositoryItem with _$RepositoryItem {
  const factory RepositoryItem({
    required String? name,
    required Owner? owner,
    required String? language,
    required String? description,
    required int? stargazersCount,
    required int? watchersCount,
    required int? forksCount,
    required int? openIssuesCount,
  }) = _RepositoryItem;
  
  factory RepositoryItem.fromJson(Map<String, dynamic> json) => _$RepositoryItemFromJson(json);
}


@freezed
class Owner with _$Owner {
  const factory Owner({
    required String? avatarUrl,
  }) = _Owner;
  
  factory Owner.fromJson(Map<String, dynamic> json) => _$OwnerFromJson(json);
}