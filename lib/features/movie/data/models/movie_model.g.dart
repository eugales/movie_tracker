// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MovieModel _$MovieModelFromJson(Map<String, dynamic> json) => _MovieModel(
  id: json['id'] as String,
  title: json['title'] as String,
  status: $enumDecode(_$MovieStatusEnumMap, json['status']),
  review: json['review'] as String,
);

Map<String, dynamic> _$MovieModelToJson(_MovieModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'status': _$MovieStatusEnumMap[instance.status]!,
      'review': instance.review,
    };

const _$MovieStatusEnumMap = {
  MovieStatus.watched: 'watched',
  MovieStatus.notWatched: 'notWatched',
};
