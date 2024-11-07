import 'package:freezed_annotation/freezed_annotation.dart';

part 'repository_item.freezed.dart';
part 'repository_item.g.dart';

@freezed
class RepositoryItem with _$RepositoryItem {
  const factory RepositoryItem({
    required String name,
    required String avatarUrl,
    required String language,
    required String description,
    required int stargazersCount,
  }) = _RepositoryItem;
  
  factory RepositoryItem.fromJson(Map<String, dynamic> json) => _$RepositoryItemFromJson(json);
}