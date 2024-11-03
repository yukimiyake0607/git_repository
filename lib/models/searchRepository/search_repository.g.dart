// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_repository.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SearchRepositoryImpl _$$SearchRepositoryImplFromJson(
        Map<String, dynamic> json) =>
    _$SearchRepositoryImpl(
      name: json['name'] as String,
      avatarUrl: json['avatarUrl'] as String,
      language: json['language'] as String,
      description: json['description'] as String,
      stargazersCount: (json['stargazersCount'] as num).toInt(),
    );

Map<String, dynamic> _$$SearchRepositoryImplToJson(
        _$SearchRepositoryImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'avatarUrl': instance.avatarUrl,
      'language': instance.language,
      'description': instance.description,
      'stargazersCount': instance.stargazersCount,
    };
