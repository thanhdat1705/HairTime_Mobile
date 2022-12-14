import 'package:json_annotation/json_annotation.dart';
part 'search_request.g.dart';

@JsonSerializable()
class SearchRequest {
  int limit;
  int page;
  String sortField;
  int sortOrder;
  String searchMain;

  SearchRequest(
      this.limit, this.page, this.sortField, this.sortOrder, this.searchMain);

  Map<String, dynamic> toJson() => _$SearchRequestToJson(this);
}
