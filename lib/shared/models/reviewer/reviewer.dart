import 'package:json_annotation/json_annotation.dart';

part 'reviewer.g.dart';

@JsonSerializable()
class Reviewer {
  String imageURL;
  String name;
  double star;
  String date;
  Reviewer(this.imageURL, this.name, this.star, this.date);

  Reviewer.instance();
  Reviewer fromJson(Map<String, dynamic> json) {
    return _$ReviewerFromJson(json);
  }

  factory Reviewer.fromJson(Map<String, dynamic> json) => _$ReviewerFromJson(json);
  Map<String, dynamic> toJson() => _$ReviewerToJson(this);
}
