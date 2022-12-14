import 'package:json_annotation/json_annotation.dart';

part 'account.g.dart';

@JsonSerializable()
class Account {
  String accountId;
  String phoneNumber;
  String email;
  String photoUrl;
  String displayName;
  String token;

  Account(this.accountId, this.phoneNumber, this.email, this.photoUrl,
      this.displayName, this.token);
  Account.instance();
  Account fromJson(Map<String, dynamic> json) {
    return _$AccountFromJson(json);
  }

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);
  Map<String, dynamic> toJson() => _$AccountToJson(this);
}
