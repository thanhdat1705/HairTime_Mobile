// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reviewer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Reviewer _$ReviewerFromJson(Map<String, dynamic> json) {
  return Reviewer(
    json['imageURL'] as String,
    json['name'] as String,
    (json['star'] as num)?.toDouble(),
    json['date'] as String,
  );
}

Map<String, dynamic> _$ReviewerToJson(Reviewer instance) => <String, dynamic>{
      'imageURL': instance.imageURL,
      'name': instance.name,
      'star': instance.star,
      'date': instance.date,
    };
