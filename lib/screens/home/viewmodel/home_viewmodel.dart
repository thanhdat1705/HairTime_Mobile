import 'package:project_hair_time_mobile/shared/models/fields/fields.dart';

class HomeViewModel {
  int tmp = 0;
  List<Field> _fields;
  HomeViewModel(this._fields);
  List<Field> get ListFields {
    return this._fields;
  }

  void set ListFields(List<Field> fields) {
    this._fields = fields;
  }
}
