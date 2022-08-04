import 'package:flutter/cupertino.dart';
import 'package:mvp_core/mvp_core.dart';
import 'package:project_hair_time_mobile/screens/store_detail/view/store_detail_screen_view.dart';
import 'package:project_hair_time_mobile/screens/store_detail/viewmodel/store_detail_screen_viewmodel.dart';
import 'package:project_hair_time_mobile/shared_data/service_list.dart';

abstract class IStoreDetailScreenPresenter extends IPresenter {
  List<String> getIdOfCheckedService();

  void addListService(List<dynamic> ids);
  void addComboServiceToCard(String id);
  List<dynamic> getListService();
  List getCheckedServiceOfCategory(String cateId);
  void changeIsSelectedCombo();
  bool getIsSelectedCombo();
  void addListCheckSelectedCombo(String id);

  void removeAStoreService(String id);

  void removeListStoreService(List<dynamic> ids);
  void removeListStoreServiceAll();

  StoreDetailScreenViewModel get storeDetailScreenViewModel;

  set storeDetailScreenViewModel(StoreDetailScreenViewModel viewModel);

  IStoreDetailScreenView get storeDetailScreenView;

  set storeDetailScreenView(IStoreDetailScreenView value);
  void getRefeshStore();
  void removeCheckedService(String serviceName);
  void removeCheckedComboServiceInCard(String cateId);
  // void addToTotalPrice(String serviceName);
  // void minusTotoalPrice(String serviceName);
  double getTotalPriceService();
}

class StoreDetailScreenPresenter extends Presenter<IStoreDetailScreenView>
    implements IStoreDetailScreenPresenter {
  StoreDetailScreenViewModel _storeDetailScreenViewModel;
  IStoreDetailScreenView _storeDetailScreenView;
  StoreDetailScreenPresenter() {
    this._storeDetailScreenViewModel = new StoreDetailScreenViewModel();
  }

  @override
  void removeCheckedService(String serviceName) {
    this
        ._storeDetailScreenViewModel
        .listCheckedService
        .removeWhere((element) => element["value"]["name"] == serviceName);
    this
        ._storeDetailScreenView
        .refreshStoreService(this._storeDetailScreenViewModel);
  }

  @override
  double getTotalPriceService() {
    double tmp = 0.0;
    if (getListService().isNotEmpty) {
      myService.forEach((dataService) {
        getListService().forEach((element) {
          if (element["id"] == dataService["id"]) {
            tmp += double.parse(dataService["value"]["price"]);
          }
        });
      });
    }
    return this._storeDetailScreenViewModel.totalPriceService = tmp;
  }

  // @override
  // void addToTotalPrice(String serviceName) {
  //   this.storeDetailBodyViewModel.listCheckedService.forEach((element) {
  //     if (element["value"]["name"] == serviceName) {
  //       element["value"]["price"] = (double.parse(element["value"]["price"]) + double.parse(element["value"]["price"]))
  //           .toString();
  //     }
  //   });
  //   this
  //       ._storeDetailBodyView
  //       .refreshStoreService(this._storeDetailBodyViewModel);
  // }

  // @override
  // void minusTotoalPrice(String serviceName) {
  //   // TODO: implement minusTotoalPrice
  // }

  @override
  List<String> getIdOfCheckedService() {
    List<String> result = new List<String>();
    this.storeDetailScreenViewModel.listCheckedService.forEach((element) {
      result.add(element["id"]);
    });
    return result;
  }


  @override
  void addListService(List<dynamic> ids) {
    this
        ._storeDetailScreenViewModel
        .listCheckedService
        .addAll(myService.where((element) => ids.contains(element["id"])));
    // this._storeDetailBodyViewModel.listCheckedService.addAll(ids);
    this
        ._storeDetailScreenView
        .refreshStoreService(this._storeDetailScreenViewModel);
  }

  @override
  void removeAStoreService(String id) {
    this
        ._storeDetailScreenViewModel
        .listCheckedService
        .removeWhere((element) => element["id"] == id);
    this
        ._storeDetailScreenView
        .refreshStoreService(this._storeDetailScreenViewModel);
  }

  @override
  void removeListStoreService(List ids) {
    this
        ._storeDetailScreenViewModel
        .listCheckedService
        .removeWhere((element) => ids.contains(element["id"]));
    this
        ._storeDetailScreenView
        .refreshStoreService(this._storeDetailScreenViewModel);
  }

  @override
  List getListService() {
    return this._storeDetailScreenViewModel.listCheckedService;
  }

  @override
  set storeDetailScreenView(IStoreDetailScreenView value) {
    this._storeDetailScreenView = value;
    this
        ._storeDetailScreenView
        .refreshStoreService(this._storeDetailScreenViewModel);
  }

  @override
  IStoreDetailScreenView get storeDetailScreenView {
    return this._storeDetailScreenView;
  }

  @override
  StoreDetailScreenViewModel get storeDetailScreenViewModel {
    return this._storeDetailScreenViewModel;
  }

  @override
  void set storeDetailScreenViewModel(StoreDetailScreenViewModel viewModel) {
    this._storeDetailScreenViewModel = viewModel; 
  }

  @override
  List getCheckedServiceOfCategory(String cateId) {
    List result = new List();
    this.getListService().forEach((element) {
      myService.forEach((dataService) {
        if (cateId == dataService["categoryID"] &&
            element["id"] == dataService["id"]) {
          result.add(dataService["id"]);
        }
      });
    });
    return result;
  }

  @override
  void removeListStoreServiceAll() {
    this._storeDetailScreenViewModel.listCheckedService.clear();
    myService.forEach((element) {
      element["value"]["isActive"] = false;
    });
    this._storeDetailScreenViewModel.totalPriceService = 0.0;
    this
        ._storeDetailScreenView
        .refreshStoreService(this._storeDetailScreenViewModel);
  }

  @override
  void changeIsSelectedCombo() {
    this._storeDetailScreenViewModel.isSelected =
        !this._storeDetailScreenViewModel.isSelected;
  }

  @override
  bool getIsSelectedCombo() {
    return this._storeDetailScreenViewModel.isSelected;
  }

  @override
  void addListCheckSelectedCombo(String id) {
    this._storeDetailScreenViewModel.listCheckSelectedCombo.add(id);
  }

  @override
  void addComboServiceToCard(String id) {
    this
        ._storeDetailScreenViewModel
        .listCheckedService
        .addAll(myService.where((element) => element["id"] == id));
        this._storeDetailScreenViewModel.listCheckSelectedCombo.add(id);
    // this._storeDetailBodyViewModel.listCheckedService.addAll(ids);
    this
        ._storeDetailScreenView
        .refreshStoreService(this._storeDetailScreenViewModel);
  }

  @override
  void removeCheckedComboServiceInCard(String cateId) {
    this
        ._storeDetailScreenViewModel
        .listCheckedService
        .removeWhere((element) => element["categoryID"] == cateId);
    // this
    //     .storeDetailBodyViewModel
    //     .listCheckSelectedCombo
    //     .clear();
    
  }

  @override
  void getRefeshStore() {
    this
        ._storeDetailScreenView
        .refreshStoreService(this._storeDetailScreenViewModel);
  }
}
