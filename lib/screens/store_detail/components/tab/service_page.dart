import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project_hair_time_mobile/screens/calendar_page/calendar_page.dart';
import 'package:project_hair_time_mobile/screens/methods_payment/data/methods_payment_data.dart';
import 'package:project_hair_time_mobile/screens/service_detail/service_detail_screen.dart';
import 'package:project_hair_time_mobile/screens/store_detail/components/card/happy_combo_card.dart';
import 'package:project_hair_time_mobile/shared/general_helpers/general_helpers.dart';
import 'package:project_hair_time_mobile/shared/shared_variables/contants.dart';
import 'package:project_hair_time_mobile/shared/storages/memory_storage.dart';
import 'package:project_hair_time_mobile/shared_data/service_list.dart';
import 'package:project_hair_time_mobile/screens/store_detail/components/popup/dropdown_service.dart';
import 'package:project_hair_time_mobile/screens/store_detail/presenter/store_detail_screen_persenter.dart';
import 'package:project_hair_time_mobile/shared/size/size_config.dart';
import 'package:project_hair_time_mobile/widgets/popup/error_popup.dart';

import '../customer_service.dart';

List<CustomerService> customerServiceList = [];

class ServicePage extends StatefulWidget {
  final IStoreDetailScreenPresenter presenter;
  final TabController tabController;
  final discountData;

  const ServicePage({
    Key key,
    this.presenter,
    this.tabController,
    this.discountData,
  }) : super(key: key);

  @override
  _ServicePageState createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  // List<dynamic> _myActivities = globalListService;
  List<dynamic> itemsData = new List();
  // List<dynamic> customerList = [
  //   {
  //     'name': 'Nguyen Thanh Dat',
  //     'phone': '0909065656',
  //     'isChoose': false,

  //   },
  // ];

  bool _isSelected = false;
  TextEditingController _addName = new TextEditingController();
  TextEditingController _addPhone = new TextEditingController();
  TextEditingController _updateName = new TextEditingController();
  TextEditingController _updatePhone = new TextEditingController();
  TextStyle textStyle(double size, FontWeight fontWeight, Color color) {
    return new TextStyle(fontSize: size, fontWeight: fontWeight, color: color);
  }

  bool _isChooseAll = false;
  // bool _rememberChoose = false;
  int idCustomer = 1;

  @override
  void initState() {
    super.initState();
    customerServiceList = [
      new CustomerService(1, 'Nguyen Thanh Dat', '0909065656', false),
    ];
    removeAmount();
    //this.setUp();
  }

  void removeAmount() {
    myService.forEach((service) {
      if (service['value']['isActive'] == false) {
        service['amount'] = '';
      }
    });
  }

  // void checkCombo(String comboId) {
  //   if (this.widget.comboId != null) {
  //     this.widget.tabController.animateTo(0);
  //     GeneralHelper.navigateToScreen(
  //         context,
  //         ServiceDetailScreen(
  //           tabController: this.widget.tabController,
  //           serviceId: comboId,
  //           fromBill: false,
  //         ),
  //         false);
  //   }
  // }

  Dialog updateDialog(String name, String phone, int index) {
    _updateName.text = name;
    _updatePhone.text = phone;
    return new Dialog(
      child: new Container(
        padding: EdgeInsets.all(20),
        height: SizeConfig.screenHeight * 0.3 - 25,
        width: SizeConfig.screenWidth * 0.8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                alignment: Alignment.centerLeft,
                child: Text('Update information',
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.bold))),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  // color: Colors.red,
                  alignment: Alignment.centerLeft,
                  width: getProportionateScreenWidth(80),
                  child: Text('Name',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold)),
                ),
                Spacer(),
                Container(
                  // color: Colors.yellow,
                  width: SizeConfig.screenWidth * 0.5 - 30,
                  child: TextField(
                    controller: _updateName,
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                    keyboardType: TextInputType.name,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'name',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  // color: Colors.red,
                  alignment: Alignment.centerLeft,
                  height: 20,
                  width: getProportionateScreenWidth(80),
                  child: Text('Phone',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold)),
                ),
                Spacer(),
                Container(
                  // color: Colors.yellow,
                  width: SizeConfig.screenWidth * 0.5 - 30,
                  child: TextField(
                    controller: _updatePhone,
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                    keyboardType: TextInputType.phone,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'phone number',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FlatButton(
                    height: 30,
                    color: Colors.blue,
                    onPressed: () {
                      Navigator.pop(context);
                      showDialog(
                        context: context,
                        builder: (_) => listCustomer(),
                      );
                      print('cancel');
                    },
                    child: Text('Cancel',
                        style: textStyle(18, FontWeight.w400, Colors.white))),
                SizedBox(width: getProportionateScreenWidth(20)),
                FlatButton(
                  height: 30,
                  color: Colors.blue,
                  onPressed: () {
                    // if (customerList.any((element) => element['phone'] == _phone.text)) {}
                    customerServiceList[index].name = _updateName.text;
                    customerServiceList[index].phone = _updatePhone.text;
                    Navigator.pop(context);
                    showDialog(
                      context: context,
                      builder: (_) => listCustomer(),
                    );
                  },
                  child: Text('Update',
                      style: textStyle(18, FontWeight.w400, Colors.white)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Dialog addDialog() {
    _addName.text = '';
    _addPhone.text = '';
    return new Dialog(
      child: new Container(
        padding: EdgeInsets.all(20),
        height: SizeConfig.screenHeight * 0.3 - 25,
        width: SizeConfig.screenWidth * 0.8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                alignment: Alignment.centerLeft,
                child: Text('Enter information',
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.bold))),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  // color: Colors.red,
                  alignment: Alignment.centerLeft,
                  width: getProportionateScreenWidth(80),
                  child: Text('Name',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold)),
                ),
                Spacer(),
                Container(
                  // color: Colors.yellow,
                  width: SizeConfig.screenWidth * 0.5 - 30,
                  child: TextField(
                    controller: _addName,
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                    keyboardType: TextInputType.name,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'name',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  // color: Colors.red,
                  alignment: Alignment.centerLeft,
                  height: 20,
                  width: getProportionateScreenWidth(80),
                  child: Text('Phone',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold)),
                ),
                Spacer(),
                Container(
                  // color: Colors.yellow,
                  width: SizeConfig.screenWidth * 0.5 - 30,
                  child: TextField(
                    controller: _addPhone,
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                    keyboardType: TextInputType.phone,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'phone number',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FlatButton(
                    height: 30,
                    color: Colors.blue,
                    onPressed: () {
                      Navigator.pop(context);
                      showDialog(
                        context: context,
                        builder: (_) => listCustomer(),
                      );
                      print('cancel');
                    },
                    child: Text('Cancel',
                        style: textStyle(18, FontWeight.w400, Colors.white))),
                SizedBox(width: getProportionateScreenWidth(20)),
                FlatButton(
                  height: 30,
                  color: Colors.blue,
                  onPressed: () {
                    if (customerServiceList
                        .any((element) => element.phone == _addPhone.text)) {
                      showDialog(
                        context: context,
                        builder: (_) => ErrorPopup(
                          errorMessage:
                              'So sorry!!! Your phone already exists in the current list',
                        ),
                      );
                    } else {
                      customerServiceList.add(new CustomerService(
                          idCustomer += 1,
                          _addName.text,
                          _addPhone.text,
                          false));
                      // customerList.addAll([
                      //   {
                      //     'name': _addName.text,
                      //     'phone': _addPhone.text,
                      //     'isChoose': false,
                      //   }
                      // ]);
                      Navigator.pop(context);
                      showDialog(
                        context: context,
                        builder: (_) => listCustomer(),
                      );
                    }
                  },
                  child: Text('Save',
                      style: textStyle(18, FontWeight.w400, Colors.white)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Dialog chooseCustomerForService(dataService) {
    return new Dialog(
      child: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
        return Container(
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight * 0.5,
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text('Customer using service',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  Spacer(),
                  IconButton(
                      icon: Icon(
                        Icons.cancel_outlined,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      })
                ],
              ),
              SizedBox(height: getProportionateScreenHeight(10)),
              Container(
                margin: EdgeInsets.only(
                  left: getProportionateScreenWidth(20),
                  right: getProportionateScreenWidth(20),
                ),
                child: Row(
                  children: [
                    Text(
                      'Choose all',
                      style: textStyle(16, FontWeight.bold, Colors.black),
                    ),
                    Checkbox(
                      value: _isChooseAll,
                      onChanged: (value) {
                        setState(() {
                          _isChooseAll = value;
                          customerServiceList.forEach((choose) {
                            if (_isChooseAll) {
                              choose.isChoose = true;
                            } else {
                              choose.isChoose = false;
                            }
                          });
                          if (_isChooseAll) {
                            customerServiceList.forEach((selecteForAll) {
                              selecteForAll.servicePerCus.add(dataService);
                            });
                          }
                        });
                        Timer(Duration(seconds: 1), () {
                          Navigator.pop(context);
                        });
                      },
                    ),
                    // Text(
                    //   'Remember',
                    //   style: textStyle(16, FontWeight.bold, Colors.black),
                    // ),
                    // Checkbox(
                    //   value: _rememberChoose,
                    //   onChanged: (value) {
                    //     setState(() {
                    //       _rememberChoose = value;
                    //       customerList.forEach((element) {
                    //         if (_isChooseAll) {
                    //           element['isChoose'] = true;
                    //         } else {
                    //           element['isChoose'] = false;
                    //         }
                    //       });
                    //     });
                    //   },
                    // )
                  ],
                ),
              ),
              Container(
                // color: Colors.red,
                height: SizeConfig.screenHeight * 0.3,
                child: ListView.builder(
                  itemCount: customerServiceList.length,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        // choose 1
                        setState(() {
                          // if (customerServiceList[index].servicePerCus.any(
                          //     (serviceId) =>
                          //         serviceId['id'] != dataService['id'])) {
                          customerServiceList[index]
                              .servicePerCus
                              .add(dataService);
                          // }
                          customerServiceList[index].isChoose =
                              !customerServiceList[index].isChoose;
                        });
                        Timer(Duration(seconds: 1), () {
                          Navigator.pop(context);
                        });
                        print('Choose this');
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: getProportionateScreenHeight(50),
                        width: SizeConfig.screenWidth,
                        padding: EdgeInsets.only(
                            left: getProportionateScreenWidth(10)),
                        margin: EdgeInsets.only(
                          bottom: getProportionateScreenHeight(20),
                          left: getProportionateScreenWidth(20),
                          right: getProportionateScreenWidth(20),
                        ),
                        decoration: BoxDecoration(
                          color: customerServiceList[index].isChoose
                              ? Colors.blue[300]
                              : Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Text(customerServiceList[index].name,
                            style: textStyle(
                                20,
                                FontWeight.bold,
                                customerServiceList[index].isChoose
                                    ? Colors.white
                                    : Colors.black)),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Dialog listCustomer() {
    return new Dialog(
      child: StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Container(
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight * 0.4,
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text('Customer list',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold)),
                    Spacer(),
                    IconButton(
                        icon: Icon(
                          Icons.cancel_outlined,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        })
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(10)),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Container(
                      // color: Colors.yellow,
                      height: SizeConfig.screenHeight * 0.3,
                      child: Column(
                        children: [
                          Container(
                            // color: Colors.red,
                            height: SizeConfig.screenHeight * 0.2,
                            child: ListView.builder(
                              itemCount: customerServiceList.length,
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                    showDialog(
                                      context: context,
                                      barrierDismissible: false,
                                      builder: (_) => updateDialog(
                                          customerServiceList[index].name,
                                          customerServiceList[index].phone,
                                          index),
                                    );
                                    print('Update');
                                  },
                                  child: Container(
                                    height: getProportionateScreenHeight(50),
                                    width: SizeConfig.screenWidth,
                                    padding: EdgeInsets.only(
                                        left: getProportionateScreenWidth(10)),
                                    margin: EdgeInsets.only(
                                        bottom:
                                            getProportionateScreenHeight(20)),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 2,
                                          blurRadius: 7,
                                          offset: Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                    customerServiceList[index]
                                                            .name +
                                                        ' - ',
                                                    style: textStyle(
                                                        17,
                                                        FontWeight.w400,
                                                        Colors.black)),
                                                Text(
                                                    customerServiceList[index]
                                                        .phone,
                                                    style: textStyle(
                                                        17,
                                                        FontWeight.w400,
                                                        Colors.black)),
                                              ],
                                            ),
                                            Spacer(),
                                            IconButton(
                                                icon: Icon(
                                                  Icons.delete_forever_outlined,
                                                  color: Colors.red,
                                                ),
                                                onPressed: () {
                                                  setState(() {
                                                    customerServiceList
                                                        .removeAt(index);
                                                  });
                                                  print('Delete');
                                                })
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          Spacer(),
                          FlatButton(
                              height: 30,
                              color: Colors.blue,
                              onPressed: () {
                                Navigator.pop(context);
                                showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (_) => addDialog(),
                                );
                                print('add more');
                              },
                              child: Text('Add more',
                                  style: textStyle(
                                      18, FontWeight.w400, Colors.white))),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void setUp() {
    List<Widget> listCategoryServiceData = [];

    categoryService.forEach((element) {
      listCategoryServiceData.add(
        DropdownService(
          name: element["name"],
          id: element["id"],
          presenter: this.widget.presenter,
        ),
      );
    });
    setState(() {
      itemsData = listCategoryServiceData;
    });
  }

  List<Widget> listHappyComboService() {
    List<Widget> listComboServiceData = [];
    myService.forEach((element) {
      if (element["categoryID"] == "4") {
        listComboServiceData.add(
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(15),
                vertical: getProportionateScreenHeight(15)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blue[50],
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 5),
                  blurRadius: 10,
                  color: kShadowColor,
                )
              ],
            ),
            height: SizeConfig.screenHeight * 0.2,
            width: SizeConfig.screenWidth * 0.75,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                image: DecorationImage(
                  image: NetworkImage(
                      "https://raw.githubusercontent.com/sonhoang1809/Assets/master/Images/Project_Hair_Time/happy_combo.png"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    right: getProportionateScreenWidth(45),
                    child: FlatButton(
                        height: getProportionateScreenHeight(25),
                        onPressed: () {
                          setState(() {
                            this
                                .widget
                                .presenter
                                .removeCheckedComboServiceInCard(
                                    element["categoryID"]);
                            // this
                            //     .widget
                            //     .presenter
                            //     .removeCheckedComboServiceInCard(element["4"]);
                            if (element["value"]["isActive"] == false) {
                              this
                                  .widget
                                  .presenter
                                  .addComboServiceToCard(element["id"]);
                            }

                            element["value"]["isActive"] =
                                !element["value"]["isActive"];
                            myService.forEach((_eachCombo) {
                              if (_eachCombo["id"] != element["id"]) {
                                _eachCombo["value"]["isActive"] = false;
                              }
                            });
                          });
                          print('selectd combo');
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(
                                color: element["value"]["isActive"]
                                    ? Colors.red
                                    : Colors.black)),
                        color: element["value"]["isActive"]
                            ? Colors.red
                            : Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              element["value"]["isActive"]
                                  ? Icons.check
                                  : Icons.add,
                              color: element["value"]["isActive"]
                                  ? Colors.white
                                  : Colors.black,
                              size: 16,
                            ),
                            SizedBox(width: getProportionateScreenWidth(10)),
                            element["value"]["isActive"]
                                ? Text(
                                    "Selected",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.white),
                                  )
                                : Text(
                                    "Selection",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black),
                                  ),
                          ],
                        )),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    });
    return listComboServiceData;
  }

  List<Widget> listComboService() {
    List<Widget> listComboServiceData = [];
    myService.forEach((comboData) {
      if (comboData["categoryID"] == "3") {
        listComboServiceData.add(
          GestureDetector(
            onTap: () {
              print('ahihi combo');
              // if (customerList.length > 1) {
              //   // if (_rememberChoose == false) {
              //   //   _isChooseAll = false;
              //   // customerList.forEach((element) {
              //   //   element['isChoose'] = false;
              //   // });
              //   showDialog(
              //     context: context,
              //     barrierDismissible: false,
              //     builder: (_) => choosCustomer(),
              //   );
              //   // }
              // }

              // if (customerServiceList.length > 1) {
              //   // if (_rememberChoose == false) {
              //   //

              //   customerServiceList.forEach((choose) {
              //     choose.isChoose = false;
              //   });
              //   _isChooseAll = false;
              //   showDialog(
              //     context: context,
              //     barrierDismissible: false,
              //     builder: (_) => chooseCustomerForService(comboData),
              //   );
              //   // }
              // } else if (customerServiceList.length == 0) {
              //   showDialog(
              //     context: context,
              //     builder: (_) => listCustomer(),
              //   );
              // } else {
              //   customerServiceList.first.servicePerCus.add(comboData);
              // }

              this.widget.tabController.animateTo(0);
              // GeneralHelper.navigateToScreen(
              //     context,
              //     ServiceDetailScreen(
              //       tabController: this.widget.tabController,
              //       serviceId: comboData['id'],
              //       fromBill: false,
              //       isComboFromMain: false,
              //     ),
              //     false);
              GeneralHelper.navigateToScreen(
                  context,
                  CalendarPage(
                    servicesId: '5',
                    amount: '3',
                    serviceId: comboData['id'],
                    storeName: "Liem Barber Shop",
                    address: '49 Hoa Su, Q.Phu Nhuan, TP. HCM',
                    tabController: this.widget.tabController,
                    isDiscount: false,
                    discountData: this.widget.discountData,
                    methodPayment: methodPaymentList[0],
                    fromBill: false,
                    isComboFromMain: false,
                  ),
                  false);
              // this
              //     .widget
              //     .presenter
              //     .removeCheckedComboServiceInCard(comboData["categoryID"]);
              // if (comboData["value"]["isActive"] == false) {
              //   List<dynamic> singleService = [];
              //   singleService.add(comboData["id"]);
              //   this.widget.presenter.addListService(singleService);
              // } else {
              //   this.widget.presenter.removeAStoreService(comboData["id"]);
              // }
              // myService.forEach((_eachCombo) {
              //   if (_eachCombo["id"] != comboData["id"] &&
              //       _eachCombo["categoryID"] == comboData['categoryID']) {
              //     _eachCombo["value"]["isActive"] = false;
              //   }
              // });
              // comboData["value"]["isActive"] =
              //     !comboData["value"]["isActive"];
            },
            child: Container(
              margin: EdgeInsets.symmetric(
                  vertical: getProportionateScreenHeight(10)),
              padding: EdgeInsets.only(top: 0, bottom: 0, left: 10, right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 0.5),
                    blurRadius: 4,
                    color: kShadowColor,
                  )
                ],
              ),
              height: getProportionateScreenHeight(85),
              width: SizeConfig.screenWidth * 0.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Expanded(
                  //   flex: 7,
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //       color: Colors.white,
                  //       borderRadius: BorderRadius.only(
                  //           topLeft: Radius.circular(10),
                  //           topRight: Radius.circular(10)),
                  //       image: DecorationImage(
                  //         image: NetworkImage(comboData["display"]),
                  //         fit: BoxFit.fill,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        // color: Colors.red,
                        width: SizeConfig.screenWidth * 0.5,
                        child: Text(
                          comboData["value"]["name"],
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: getProportionateScreenHeight(18)),
                          maxLines: 2,
                        ),
                      ),
                      comboData["amount"] != ''
                          ? Container(
                              // width: SizeConfig.screenWidth * 0.05,
                              child: Text(
                                comboData["amount"] + 'x',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: getProportionateScreenHeight(18)),
                                maxLines: 2,
                              ),
                            )
                          : Container(),
                    ],
                  ),
                  Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "\$" + comboData["value"]["price"],
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: getProportionateScreenHeight(18),
                            fontWeight: FontWeight.bold),
                      ),
                      // SizedBox(height: getProportionateScreenHeight(10)),
                      comboData["value"]["originPrice"] != null
                          ? Text(
                              "\$" + comboData["value"]["originPrice"],
                              style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: getProportionateScreenHeight(14),
                                  decoration: TextDecoration.lineThrough),
                            )
                          : Container(),
                    ],
                  ),

                  // Expanded(
                  //   flex: 3,
                  //   child: Container(
                  //     // color: Colors.red,
                  //     padding: EdgeInsets.symmetric(
                  //         vertical: getProportionateScreenHeight(10)),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //       crossAxisAlignment: CrossAxisAlignment.center,
                  //       children: [
                  //         Column(
                  //           mainAxisAlignment: MainAxisAlignment.center,
                  //           crossAxisAlignment: CrossAxisAlignment.center,
                  //           children: [
                  //             Expanded(
                  //               flex: 4,
                  //               child: Container(
                  //                 child: Row(
                  //                   children: [
                  //                     Icon(
                  //                       Icons.favorite,
                  //                       size: getProportionateScreenHeight(12),
                  //                       color: Colors.pink[300],
                  //                     ),
                  //                     Text("1,452,169 selected ones",
                  //                         style: TextStyle(
                  //                           fontSize:
                  //                               getProportionateScreenHeight(
                  //                                   10),
                  //                         )),
                  //                   ],
                  //                 ),
                  //               ),
                  //             ),
                  //             Expanded(
                  //               flex: 6,
                  //               child: FlatButton(
                  //                   onPressed: () {
                  //                     setState(() {
                  //                     });
                  //                     print('selectd combo');
                  //                   },
                  //                   shape: RoundedRectangleBorder(
                  //                       borderRadius:
                  //                           BorderRadius.circular(10.0),
                  //                       side: BorderSide(
                  //                           color: comboData["value"]
                  //                                   ["isActive"]
                  //                               ? Colors.red
                  //                               : Colors.black)),
                  //                   color: comboData["value"]["isActive"]
                  //                       ? Colors.red
                  //                       : Colors.white,
                  //                   child: Row(
                  //                     mainAxisAlignment:
                  //                         MainAxisAlignment.spaceAround,
                  //                     children: [
                  //                       Icon(
                  //                         comboData["value"]["isActive"]
                  //                             ? Icons.check
                  //                             : Icons.add,
                  //                         color: comboData["value"]["isActive"]
                  //                             ? Colors.white
                  //                             : Colors.black,
                  //                         size: 16,
                  //                       ),
                  //                       SizedBox(
                  //                           width: getProportionateScreenWidth(
                  //                               10)),
                  //                       comboData["value"]["isActive"]
                  //                           ? Text(
                  //                               "Selected",
                  //                               style: TextStyle(
                  //                                   fontSize: 14,
                  //                                   color: Colors.white),
                  //                             )
                  //                           : Text(
                  //                               "Selection",
                  //                               style: TextStyle(
                  //                                   fontSize: 14,
                  //                                   color: Colors.black),
                  //                             ),
                  //                     ],
                  //                   )),
                  //             ),

                  //           ],
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),
          ),
        );
      }
    });
    return listComboServiceData;
  }

  List<Widget> listSingleService(String idCate) {
    List<Widget> listComboServiceData = [];
    myService.forEach((serviceData) {
      if (serviceData["categoryID"] == idCate) {
        listComboServiceData.add(
          GestureDetector(
            onTap: () {
              // if (customerServiceList.length > 1) {
              //   // if (_rememberChoose == false) {
              //   //

              //   customerServiceList.forEach((choose) {
              //     choose.isChoose = false;
              //   });
              //   _isChooseAll = false;
              //   showDialog(
              //     context: context,
              //     barrierDismissible: false,
              //     builder: (_) =>
              //         chooseCustomerForService(serviceData),
              //   );
              //   // }
              // } else if (customerServiceList.length == 0) {
              //   showDialog(
              //     context: context,
              //     builder: (_) => listCustomer(),
              //   );
              // } else {
              //   customerServiceList.first.servicePerCus
              //       .add(serviceData);
              // }
              this.widget.tabController.animateTo(0);
              // GeneralHelper.navigateToScreen(
              //     context,
              //     ServiceDetailScreen(
              //       tabController: this.widget.tabController,
              //       serviceId: serviceData['id'],
              //       fromBill: false,
              //       isComboFromMain: false,
              //     ),
              //     false);
              GeneralHelper.navigateToScreen(
                  context,
                  CalendarPage(
                    servicesId: '5',
                    amount: '3',
                    serviceId: serviceData['id'],
                    storeName: "Liem Barber Shop",
                    address: '49 Hoa Su, Q.Phu Nhuan, TP. HCM',
                    tabController: this.widget.tabController,
                    isDiscount: false,
                    discountData: this.widget.discountData,
                    methodPayment: methodPaymentList[0],
                    fromBill: false,
                    isComboFromMain: false,
                  ),
                  false);
              // this
              //     .widget
              //     .presenter
              //     .removeCheckedComboServiceInCard(serviceData["categoryID"]);
              // if (serviceData["value"]["isActive"] == false) {
              //   List<dynamic> singleService = [];
              //   singleService.add(serviceData["id"]);
              //   this.widget.presenter.addListService(singleService);
              // } else {
              //   this.widget.presenter.removeAStoreService(serviceData["id"]);
              // }
              // myService.forEach((_eachCombo) {
              //   if (_eachCombo["id"] != serviceData["id"] &&
              //       _eachCombo["categoryID"] == serviceData['categoryID']) {
              //     _eachCombo["value"]["isActive"] = false;
              //   }
              // });
            },
            child: Container(
              margin: EdgeInsets.symmetric(
                  vertical: getProportionateScreenHeight(15)),
              padding: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                // borderRadius: BorderRadius.circular(10),
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 0.5),
                    blurRadius: 4,
                    color: kShadowColor,
                  )
                ],
              ),
              height: getProportionateScreenHeight(85),
              width: SizeConfig.screenWidth * 0.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        // color: Colors.red,
                        width: SizeConfig.screenWidth * 0.5,
                        child: Text(
                          serviceData["value"]["name"],
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: getProportionateScreenHeight(18)),
                          maxLines: 2,
                        ),
                      ),
                      serviceData["amount"] != ''
                          ? Container(
                              // width: SizeConfig.screenWidth * 0.05,
                              child: Text(
                                serviceData["amount"] + 'x',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: getProportionateScreenHeight(18)),
                                maxLines: 2,
                              ),
                            )
                          : Container(),
                    ],
                  ),
                  Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "\$" + serviceData["value"]["price"],
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: getProportionateScreenHeight(18),
                            fontWeight: FontWeight.bold),
                      ),
                      // SizedBox(height: getProportionateScreenHeight(20)),
                      serviceData["value"]["originPrice"] != null
                          ? Text(
                              "\$" + serviceData["value"]["originPrice"],
                              style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: getProportionateScreenHeight(14),
                                  decoration: TextDecoration.lineThrough),
                            )
                          : Container(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }
    });
    return listComboServiceData;
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        _buildSliverContent(context),
      ],
    );
  }

  SliverFillRemaining _buildSliverContent(BuildContext context) {
    return SliverFillRemaining(
        child: Stack(
      children: [
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            padding: EdgeInsets.only(top: getProportionateScreenHeight(10)),
            margin: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(10)),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(
                      left: getProportionateScreenWidth(15),
                      top: getProportionateScreenHeight(15),
                      right: getProportionateScreenWidth(15)),
                  padding:
                      EdgeInsets.only(top: getProportionateScreenHeight(10)),
                  child: Text('Hot Combo',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.blue[400])),
                ),
                // SingleChildScrollView(
                //   scrollDirection: Axis.vertical,
                // child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: this.listComboService(),
                ),
                // ),
                // Container(
                //   alignment: Alignment.centerLeft,
                //   margin: EdgeInsets.only(
                //       left: getProportionateScreenWidth(15),
                //       top: getProportionateScreenHeight(15),
                //       right: getProportionateScreenWidth(15)),
                //   padding: EdgeInsets.only(top: getProportionateScreenHeight(10)),
                //   child: Text('Happy Combo',
                //       style: TextStyle(
                //           fontSize: 20,
                //           fontWeight: FontWeight.w500,
                //           color: Colors.blue[400])),
                // ),
                // SingleChildScrollView(
                //   scrollDirection: Axis.horizontal,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: this.listHappyComboService(),
                //   ),
                // ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(
                      left: getProportionateScreenWidth(15),
                      top: getProportionateScreenHeight(15),
                      right: getProportionateScreenWidth(15)),
                  padding:
                      EdgeInsets.only(top: getProportionateScreenHeight(10)),
                  child: Text('Hair Service',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.blue[400])),
                ),
                // SingleChildScrollView(
                //   scrollDirection: Axis.horizontal,
                //   child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: this.listSingleService("1"),
                ),
                // ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(
                      left: getProportionateScreenWidth(15),
                      top: getProportionateScreenHeight(15),
                      right: getProportionateScreenWidth(15)),
                  padding:
                      EdgeInsets.only(top: getProportionateScreenHeight(10)),
                  child: Text('Skin Service',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.blue[400])),
                ),
                // SingleChildScrollView(
                //   scrollDirection: Axis.horizontal,
                // child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: this.listSingleService("2"),
                ),
                // ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(
                      left: getProportionateScreenWidth(15),
                      top: getProportionateScreenHeight(15),
                      right: getProportionateScreenWidth(15)),
                  padding:
                      EdgeInsets.only(top: getProportionateScreenHeight(10)),
                  child: Text('Other Service',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.blue[400])),
                ),
                // SingleChildScrollView(
                //   scrollDirection: Axis.horizontal,
                //   child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: this.listSingleService("4"),
                ),
                // ),
                SizedBox(height: getProportionateScreenHeight(60)),
              ],
            ),
          ),
        ),
        // Positioned(
        //   right: 10,
        //   bottom: 20,
        //   child: GestureDetector(
        //     onTap: () {
        //       showDialog(
        //         context: context,
        //         builder: (_) => listCustomer(),
        //       );
        //       // showDialog(
        //       //   context: context,
        //       //   builder: (BuildContext context) {
        //       //     return new BillDetailsScreen();
        //       //   },
        //       // );
        //       // GeneralHelper.navigateToScreen(
        //       //     context, new BillDetailsScreen(), false);
        //     },
        //     child: Container(
        //       alignment: Alignment.center,
        //       decoration: BoxDecoration(
        //         color: Colors.blue,
        //         borderRadius: BorderRadius.circular(50),
        //         boxShadow: [
        //           BoxShadow(
        //             color: Colors.grey.withOpacity(0.2),
        //             spreadRadius: 2,
        //             blurRadius: 5,
        //             offset: Offset(0, 3),
        //           ),
        //         ],
        //       ),
        //       height: 50,
        //       width: 50,
        //       child: new Icon(
        //         Icons.list_alt,
        //         color: Colors.white,
        //         size: 35,
        //       ),
        //     ),
        //   ),
        // ),
      ],
    ));
  }
}
