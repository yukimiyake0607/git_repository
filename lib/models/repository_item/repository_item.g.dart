// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RepositoryItemImpl _$$RepositoryItemImplFromJson(Map<String, dynamic> json) =>
    _$RepositoryItemImpl(
      name: json['name'] as String?,
      owner: json['owner'] == null
          ? null
          : Owner.fromJson(json['owner'] as Map<String, dynamic>),
      language: json['language'] as String?,
      description: json['description'] as String?,
      stargazersCount: (json['stargazers_count'] as num?)?.toInt(),
      watchersCount: (json['watchers_count'] as num?)?.toInt(),
      forksCount: (json['forks_count'] as num?)?.toInt(),
      openIssuesCount: (json['open_issues_count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$RepositoryItemImplToJson(
        _$RepositoryItemImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'owner': instance.owner,
      'language': instance.language,
      'description': instance.description,
      'stargazers_count': instance.stargazersCount,
      'watchers_count': instance.watchersCount,
      'forks_count': instance.forksCount,
      'open_issues_count': instance.openIssuesCount,
    };

_$OwnerImpl _$$OwnerImplFromJson(Map<String, dynamic> json) => _$OwnerImpl(
      avatarUrl: json['avatar_url'] as String?,
    );

Map<String, dynamic> _$$OwnerImplToJson(_$OwnerImpl instance) =>
    <String, dynamic>{
      'avatar_url': instance.avatarUrl,
    };
