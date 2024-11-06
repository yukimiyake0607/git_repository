// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_repository.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DetailRepositoryImpl _$$DetailRepositoryImplFromJson(
        Map<String, dynamic> json) =>
    _$DetailRepositoryImpl(
      name: json['name'] as String,
      avatarUrl: json['avatarUrl'] as String,
      description: json['description'] as String,
      language: json['language'] as String,
      stargazersCount: (json['stargazersCount'] as num).toInt(),
      watchersCount: (json['watchersCount'] as num).toInt(),
      forksCount: (json['forksCount'] as num).toInt(),
      openIssuesCount: (json['openIssuesCount'] as num).toInt(),
    );

Map<String, dynamic> _$$DetailRepositoryImplToJson(
        _$DetailRepositoryImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'avatarUrl': instance.avatarUrl,
      'description': instance.description,
      'language': instance.language,
      'stargazersCount': instance.stargazersCount,
      'watchersCount': instance.watchersCount,
      'forksCount': instance.forksCount,
      'openIssuesCount': instance.openIssuesCount,
    };
