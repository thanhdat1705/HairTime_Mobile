import 'package:json_annotation/json_annotation.dart';

part 'stores.g.dart';

@JsonSerializable()
class Store {
  String name;
  String address;
  bool isLike;
  double star;
  Store(this.name, this.address, this.isLike, this.star);

  Store.instance();
  Store fromJson(Map<String, dynamic> json) {
    return _$StoreFromJson(json);
  }

  factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);
  Map<String, dynamic> toJson() => _$StoreToJson(this);
}
