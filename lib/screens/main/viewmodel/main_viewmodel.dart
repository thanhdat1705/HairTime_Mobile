import 'package:project_hair_time_mobile/shared/models/provinces/province.dart';

class MainViewModel {
  List<Province> _provincesList;
  MainViewModel(this._provincesList);
  List<Province> get provincesList {
    return this._provincesList;
  }

  set provincesList(List<Province> provincesList) {
    this._provincesList = provincesList;
  }
}
