import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_hair_time_mobile/screens/store_detail/components/card/combo_service_card.dart';
import 'package:project_hair_time_mobile/screens/store_detail/components/popup/dropdown_service.dart';
import 'package:project_hair_time_mobile/screens/store_detail/presenter/store_detail_screen_persenter.dart';
import 'package:project_hair_time_mobile/shared/size/size_config.dart';
import 'package:project_hair_time_mobile/shared_data/service_list.dart';

class StoreDetailScreenViewModel {
  List<dynamic> listCheckedService;
  double totalPriceService;
  //Widget dropdownSericeWidget;
  List<dynamic> itemServicesData = new List();
  bool isSelected;
  List<dynamic> listCheckSelectedCombo;
  
  StoreDetailScreenViewModel() {
    this.listCheckedService = new List();
    this.totalPriceService = 0.0;
    this.isSelected = false;
    this.listCheckSelectedCombo = new List();
  }
  List<Widget> listDropdownService(IStoreDetailScreenPresenter presenter) {
    List<Widget> listCategoryServiceData = [];

    categoryService.forEach((element) {
      listCategoryServiceData.add(
        DropdownService(
            name: element["name"], id: element["id"], presenter: presenter),
      );
    });
    return listCategoryServiceData;
  }

  // List<Widget> listComboService(IStoreDetailScreenPresenter presenter) {
  //   List<Widget> listComboServiceData = [];
  //   myService.forEach((element) {
  //     if (element["categoryID"] == "3") {
  //       listComboServiceData.add(
  //         ComboServiceCard(
  //           id: element["id"],
  //           comboName: element["value"]["name"],
  //           price: element["value"]["price"],
  //           presenter: presenter,
  //         ),
  //       );
  //     }
  //   });
  //   return listComboServiceData;
  // }

  // List<Widget> selectedService(IStoreDetailBodyPresenter presenter) {
  //   // double total = 0.0;
  //   List<Widget> listSelectedService = [];
  //   double total = 0.0;
  //   if (listCheckedService.isNotEmpty) {
  //     myService.forEach((dataService) {
  //       listCheckedService.forEach((element) {
  //         if (element["id"] == dataService["id"]) {
  //           total += double.parse(dataService["value"]["price"]);
  //           listSelectedService.add(
  //             ShoppingCard(
  //               serviceName: dataService["value"]["name"],
  //               price: double.parse(dataService["value"]["price"]),
  //               presenter: presenter,
  //               amount: 1,
  //             ),
  //           );
  //         }
  //       });
  //     });
  //     totalPriceService = total;
  //     return listSelectedService;
  //   } else {
  //     listSelectedService.add(
  //       Container(
  //         margin: EdgeInsets.symmetric(
  //             horizontal: getProportionateScreenWidth(10),
  //             vertical: getProportionateScreenHeight(90)),
  //         color: Colors.white,
  //         height: SizeConfig.screenHeight * 0.2,
  //         width: SizeConfig.screenWidth * 0.7,
  //         child: Text(
  //           "Please select some service!!!",
  //           style: TextStyle(
  //               fontSize: 18, fontWeight: FontWeight.w500, color: Colors.grey),
  //           textAlign: TextAlign.center,
  //         ),
  //       ),
  //     );
  //     return listSelectedService;
  //   }
  // }

}
