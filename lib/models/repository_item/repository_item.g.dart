// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RepositoryItemImpl _$$RepositoryItemImplFromJson(Map<String, dynamic> json) =>
    _$RepositoryItemImpl(
      name: json['name'] as String?,
      avatarUrl: json['avatar_url'] as String?,
      language: json['language'] as String?,
      description: json['description'] as String?,
      stargazersCount: (json['stargazers_count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$RepositoryItemImplToJson(
        _$RepositoryItemImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'avatar_url': instance.avatarUrl,
      'language': instance.language,
      'description': instance.description,
      'stargazers_count': instance.stargazersCount,
    };
