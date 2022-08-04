import 'package:json_annotation/json_annotation.dart';

part 'brands.g.dart';

@JsonSerializable()
class Brand {
  String name;
  String detail;

  Brand(this.name, this.detail);
  Brand.instance();
  Brand fromJson(Map<String, dynamic> json) {
    return _$BrandFromJson(json);
  }

  factory Brand.fromJson(Map<String, dynamic> json) => _$BrandFromJson(json);
  Map<String, dynamic> toJson() => _$BrandToJson(this);
}
