// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_repository.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DetailRepositoryImpl _$$DetailRepositoryImplFromJson(
        Map<String, dynamic> json) =>
    _$DetailRepositoryImpl(
      name: json['name'] as String,
      avatarUrl: json['avatar_url'] as String,
      description: json['description'] as String,
      language: json['language'] as String,
      stargazersCount: (json['stargazers_count'] as num).toInt(),
      watchersCount: (json['watchers_count'] as num).toInt(),
      forksCount: (json['forks_count'] as num).toInt(),
      openIssuesCount: (json['open_issues_count'] as num).toInt(),
    );

Map<String, dynamic> _$$DetailRepositoryImplToJson(
        _$DetailRepositoryImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'avatar_url': instance.avatarUrl,
      'description': instance.description,
      'language': instance.language,
      'stargazers_count': instance.stargazersCount,
      'watchers_count': instance.watchersCount,
      'forks_count': instance.forksCount,
      'open_issues_count': instance.openIssuesCount,
    };
