// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RepositoryItemImpl _$$RepositoryItemImplFromJson(Map<String, dynamic> json) =>
    _$RepositoryItemImpl(
      name: json['name'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
      language: json['language'] as String?,
      description: json['description'] as String?,
      stargazersCount: (json['stargazersCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$RepositoryItemImplToJson(
        _$RepositoryItemImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'avatarUrl': instance.avatarUrl,
      'language': instance.language,
      'description': instance.description,
      'stargazersCount': instance.stargazersCount,
    };
