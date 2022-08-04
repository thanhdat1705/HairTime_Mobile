import 'package:mvp_core/mvp_core.dart';
import 'package:project_hair_time_mobile/screens/main/view/main_view.dart';
import 'package:project_hair_time_mobile/screens/main/viewmodel/main_viewmodel.dart';
import 'package:project_hair_time_mobile/shared/models/provinces/province.dart';

abstract class IMainPresenter extends IPresenter {
  List<Province> getProvicensList();
  List<String> getProvicensName();

  MainViewModel get mainViewModel;

  set mainViewModel(MainViewModel viewModel);

  IMainView get mainView;

  set mainView(IMainView view);
}

class MainPresenter extends Presenter<IMainView> implements IMainPresenter {
  MainViewModel _mainViewModel;
  IMainView _mainView;
  MainPresenter(List<Province> provincesList) {
    this._mainViewModel = new MainViewModel(provincesList);
  }
  @override
  List<Province> getProvicensList() {
    return this._mainViewModel.provincesList;
  }

  @override
  List<String> getProvicensName() {
    List<String> provincesName = new List<String>();
    for (int i = 0; i < this._mainViewModel.provincesList.length; i++) {
      provincesName.add(this._mainViewModel.provincesList[i].name);
    }
    return provincesName;
  }

  @override
  MainViewModel get mainViewModel {
    return this._mainViewModel;
  }

  @override
  void set mainViewModel(MainViewModel viewModel) {
    this._mainViewModel = viewModel;
  }

  @override
  IMainView get mainView {
    return this._mainView;
  }

  @override
  void set mainView(IMainView view) {
    this._mainView = view;
  }
}
