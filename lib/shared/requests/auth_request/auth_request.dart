import 'package:json_annotation/json_annotation.dart';
part 'auth_request.g.dart';

@JsonSerializable()
class AuthRequest {
  String accessToken;
  int provider; //google = 1; facebook=0

  AuthRequest({this.accessToken, this.provider});

  Map<String, dynamic> toJson() => _$AuthRequestToJson(this);
}
