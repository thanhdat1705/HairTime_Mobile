import 'package:flutter/material.dart';
import 'package:mvp_core/mvp_core.dart';
import 'package:project_hair_time_mobile/screens/main/components/main_screen_body.dart';
import 'package:project_hair_time_mobile/screens/main/presenter/main_presenter.dart';
import 'package:project_hair_time_mobile/screens/main/view/main_view.dart';
import 'package:project_hair_time_mobile/screens/main/viewmodel/main_viewmodel.dart';
import 'package:project_hair_time_mobile/shared/models/provinces/province.dart';
import 'package:project_hair_time_mobile/shared/size/size_config.dart';
import 'package:project_hair_time_mobile/shared_data/service_list.dart';

bool cancelBill = false;

class MainScreen extends StatefulWidget {
  final List<Province> provincesList;
  MainScreen(this.provincesList, {Key key}) : super(key: key);
  @override
  MainScreenState createState() => new MainScreenState();
}

class MainScreenState extends StateView<MainScreen, IMainPresenter>
    implements IMainView {
  @override
  void initState() {
    super.initState();
    this.presenter.mainView = this;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: MainPage(this.presenter),
    );
  }

  @override
  IMainPresenter createPresenter() {
     myService.forEach((_eachCombo) {
      _eachCombo["value"]["isActive"] = false;
    });
    return new MainPresenter(this.widget.provincesList);
  }

  @override
  void refreshHome(MainViewModel viewModel) {
    setState(() {
      this.presenter.mainViewModel = viewModel;
    });
  }
}
