// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_repository.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SearchRepositoryImpl _$$SearchRepositoryImplFromJson(
        Map<String, dynamic> json) =>
    _$SearchRepositoryImpl(
      totalCount: (json['totalCount'] as num).toInt(),
      items: (json['items'] as List<dynamic>)
          .map((e) => RepositoryItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SearchRepositoryImplToJson(
        _$SearchRepositoryImpl instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
      'items': instance.items,
    };
