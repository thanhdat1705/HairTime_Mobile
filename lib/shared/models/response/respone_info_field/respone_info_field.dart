import 'package:json_annotation/json_annotation.dart';
import 'package:project_hair_time_mobile/shared/models/fields/fields.dart';
import 'package:project_hair_time_mobile/shared/models/paging/info.dart';

part 'respone_info_field.g.dart';

@JsonSerializable()
class ResponseInfoField {
  Info infoPaging;
  ResponseInfoField(this.infoPaging);

  ResponseInfoField.instance();
  ResponseInfoField fromJson(Map<String, dynamic> json) {
    return _$ResponseInfoFieldFromJson(json);
  }

  factory ResponseInfoField.fromJson(Map<String, dynamic> json) =>
      _$ResponseInfoFieldFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseInfoFieldToJson(this);
}
