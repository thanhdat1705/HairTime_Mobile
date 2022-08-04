// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stores.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Store _$StoreFromJson(Map<String, dynamic> json) {
  return Store(
    json['name'] as String,
    json['address'] as String,
    json['isLike'] as bool,
    (json['star'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$StoreToJson(Store instance) => <String, dynamic>{
      'name': instance.name,
      'address': instance.address,
      'isLike': instance.isLike,
      'star': instance.star,
    };
