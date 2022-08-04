import 'package:json_annotation/json_annotation.dart';
part 'service_user.g.dart';

@JsonSerializable()
class ServiceUser {
  String username;
  String serviceName;
  String servicePrice;
  ServiceUser(this.username, this.serviceName, this.servicePrice);

  ServiceUser.instance();
  ServiceUser fromJson(Map<String, dynamic> json) {
    return _$ServiceUserFromJson(json);
  }

  factory ServiceUser.fromJson(Map<String, dynamic> json) =>
      _$ServiceUserFromJson(json);
  Map<String, dynamic> toJson() => _$ServiceUserToJson(this);
}
