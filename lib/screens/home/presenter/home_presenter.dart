import 'package:flutter/widgets.dart';
import 'package:mvp_core/mvp_core.dart';
import 'package:project_hair_time_mobile/screens/home/services/home_service.dart';
import 'package:project_hair_time_mobile/screens/home/view/home_view.dart';
import 'package:project_hair_time_mobile/screens/home/viewmodel/home_viewmodel.dart';
import 'package:project_hair_time_mobile/shared/models/fields/fields.dart';

abstract class IHomePresenter extends IPresenter {
  void onLoadField();
  set homeView(IHomeView value);
}

class HomePresenter extends Presenter<IHomeView> implements IHomePresenter {
  HomeViewModel _homeViewModel;
  IHomeView _homeView;
  HomePresenter(List<Field> fields) {
    this._homeViewModel = new HomeViewModel(fields);
  }

  @override
  void set homeView(IHomeView value) {
    this._homeView = value;
    this._homeView.refreshHome(this._homeViewModel);
  }

  @override
  void onLoadField() async {}
}
