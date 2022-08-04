// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceUser _$ServiceUserFromJson(Map<String, dynamic> json) {
  return ServiceUser(
    json['username'] as String,
    json['serviceName'] as String,
    json['servicePrice'] as String,
  );
}

Map<String, dynamic> _$ServiceUserToJson(ServiceUser instance) =>
    <String, dynamic>{
      'username': instance.username,
      'serviceName': instance.serviceName,
      'servicePrice': instance.servicePrice,
    };
