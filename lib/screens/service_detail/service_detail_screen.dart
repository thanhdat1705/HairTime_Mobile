import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:project_hair_time_mobile/screens/calendar_page/calendar_page.dart';
import 'package:project_hair_time_mobile/screens/methods_payment/data/methods_payment_data.dart';
import 'package:project_hair_time_mobile/screens/store_detail/detail_screen.dart';
import 'package:project_hair_time_mobile/screens/store_detail/presenter/store_detail_screen_persenter.dart';
import 'package:project_hair_time_mobile/shared/general_helpers/general_helpers.dart';
import 'package:project_hair_time_mobile/shared/size/size_config.dart';
import 'package:project_hair_time_mobile/shared_data/hot_combo_service_list.dart';
import 'package:project_hair_time_mobile/shared_data/service_list.dart';

bool isServiceExisted = false;

class ServiceDetailScreen extends StatefulWidget {
  // final IStoreDetailScreenPresenter presenter;
  final String serviceId;
  final TabController tabController;
  final discountData;
  bool fromBill;
  bool isComboFromMain;

  ServiceDetailScreen(
      {Key key,
      this.serviceId,
      // this.presenter,
      this.tabController,
      this.fromBill,
      this.isComboFromMain,
      this.discountData})
      : super(key: key);

  @override
  _ServiceDetailScreenState createState() => _ServiceDetailScreenState();
}

@override
class _ServiceDetailScreenState extends State<ServiceDetailScreen> {
  String imgUrl = '';
  String serviceName = '';
  String originalServicePrice = '';
  String servicePrice = '';
  String serviceNote;
  String btnConfirmName = 'Choose appointment';
  int initServiceAmount;
  TextEditingController _serviceNoteController = new TextEditingController();
  
  void initState() {
    super.initState();
    myService.forEach(
      (element) {
        if (element['id'] == this.widget.serviceId) {
          this.imgUrl = element['display'];
          this.serviceName = element['value']['name'];
          if (element['note'] != '') {
            this.serviceNote = element['note'];
          } else {
            this.serviceNote = 'Example: allergic to glue sprays';
          }

          if (element['value']['originPrice'] != null) {
            this.originalServicePrice = element['value']['originPrice'];
          }
          this.servicePrice = element['value']['price'];
          if (element['amount'] == '') {
            this.initServiceAmount = 1;
          } else {
            this.initServiceAmount = int.parse(element['amount']);
          }
        }
      },
    );
  }

  void getService() {}

  Widget dialogServiceNote(String amount) {
    var serviceTmp = myService.firstWhere(
        (eachService) => eachService['id'] == this.widget.serviceId);

    return AlertDialog(
      title: Text("Special note"),
      content: TextField(
        decoration: InputDecoration(
          hintText: this.serviceNote,
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
        ),
        maxLength: null,
        maxLines: null,
        controller: this._serviceNoteController,
      ),
      actions: [
        FlatButton(
          child: Text('Ok'),
          onPressed: () {
            if (this._serviceNoteController.text != '') {
              this.serviceNote = this._serviceNoteController.text;
              var serviceTmp = myService.firstWhere(
                  (eachService) => eachService['id'] == this.widget.serviceId);
              serviceTmp['note'] = this.serviceNote;
              serviceTmp['amount'] = amount;
            }
            Navigator.pop(context);
          },
        ),
        FlatButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        body: 
        Container(
          color: Colors.grey[300],
          height: getProportionateScreenHeight(700),
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: getProportionateScreenHeight(150),
                      width: getProportionateScreenWidth(400),
                      child: Image.network(
                        this.imgUrl,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                        top: 10,
                        left: 10,
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          padding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                          minWidth: 40,
                          height: 40,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          color: Colors.black.withOpacity(0.5),
                          onPressed: () {
                            // if (this.widget.fromBill == false) {
                            //   this.widget.tabController.animateTo(1);
                            // }

                            // Navigator.pop(context);
                            if (this.widget.isComboFromMain) {
                              GeneralHelper.navigateToScreen(
                                  context,
                                  DetailScreen(
                                    address: hotComboList[0]['storeAddress'],
                                    description: hotComboList[0]['description'],
                                    guestCheckout: '35',
                                    imageUrl: hotComboList[0]['storeLogo'],
                                    isLike: true,
                                    phone: hotComboList[0]['phone'],
                                    ratingNum: double.parse(
                                        hotComboList[0]['ratingStar']),
                                    storeName: hotComboList[0]['storeName'],
                                    servicePage: 1,
                                  ),
                                  true);
                            } else {
                              if (this.widget.fromBill == false) {
                                this.widget.tabController.animateTo(1);
                              }
                              Navigator.of(context).pop();
                            }
                          },
                          child: Icon(
                            Icons.cancel,
                            color: Colors.white,
                            size: 30,
                          ),
                        )),
                  ],
                ),
                Container(
                  color: Colors.white,
                  margin: EdgeInsets.only(
                    top: getProportionateScreenHeight(5),
                    bottom: getProportionateScreenHeight(5),
                  ),
                  height: getProportionateScreenHeight(150),
                  width: getProportionateScreenWidth(400),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(width: getProportionateScreenWidth(10)),
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: getProportionateScreenHeight(20)),
                            child: Text(
                              this.serviceName,
                              style: TextStyle(
                                fontSize: getProportionateScreenWidth(18),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Spacer(),
                          Container(
                            margin: EdgeInsets.only(
                              top: getProportionateScreenHeight(20),
                            ),
                            child: Text(
                              '\$' + this.originalServicePrice,
                              style: TextStyle(
                                fontSize: getProportionateScreenWidth(18),
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              left: getProportionateScreenWidth(10),
                              top: getProportionateScreenHeight(20),
                            ),
                            child: Text(
                              '\$' + this.servicePrice,
                              style: TextStyle(
                                fontSize: getProportionateScreenWidth(18),
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(width: getProportionateScreenWidth(10)),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(20)),
                        child: Text(
                          'We believe that our craftsmen will make customers satisfied.',
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(18),
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: getProportionateScreenHeight(400),
                  width: getProportionateScreenWidth(400),
                  color: Colors.white,
                  child: Column(
                    children: [
                      Container(
                        height: getProportionateScreenHeight(40),
                        width: getProportionateScreenWidth(400),
                        margin: EdgeInsets.only(
                          top: getProportionateScreenHeight(20),
                        ),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.grey[300],
                              width: 1.0,
                            ),
                          ),
                        ),
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(20),
                          ),
                          child: RichText(
                            text: TextSpan(
                              text: 'Special note\t',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: getProportionateScreenWidth(18),
                              ),
                              children: [
                                TextSpan(
                                    text: '(Optional)',
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: getProportionateScreenWidth(14),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: getProportionateScreenWidth(400),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.grey[300],
                              width: 1.0,
                            ),
                          ),
                        ),
                        child: FlatButton(
                          minWidth: getProportionateScreenWidth(400),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (_) => this.dialogServiceNote(
                                    initServiceAmount.toString()),
                                barrierDismissible: false);
                          },
                          child: Text(
                            this.serviceNote,
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(top: 10, left: 22),
                        child: Text(
                          'Number of service',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        height: getProportionateScreenHeight(100),
                        width: getProportionateScreenWidth(400),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.grey[300],
                              width: 1.0,
                            ),
                          ),
                        ),
                        // margin: EdgeInsets.symmetric(
                        //   horizontal: getProportionateScreenWidth(70),
                        // ),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                left: getProportionateScreenWidth(110),
                              ),
                              height: getProportionateScreenHeight(50),
                              width: getProportionateScreenWidth(50),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.grey[300], width: 0.5),
                              ),
                              child: RaisedButton(
                                color: Colors.white,
                                onPressed: () {
                                  setState(
                                    () {
                                      if (this.initServiceAmount > 1) {
                                        --this.initServiceAmount;
                                      }
                                    },
                                  );
                                },
                                child: Icon(
                                  MdiIcons.minus,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: getProportionateScreenWidth(30),
                              ),
                              child: Text(
                                this.initServiceAmount.toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: getProportionateScreenWidth(18),
                                ),
                              ),
                            ),
                            Container(
                              height: getProportionateScreenHeight(50),
                              width: getProportionateScreenWidth(50),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.grey[300], width: 0.5),
                              ),
                              child: RaisedButton(
                                color: Colors.white,
                                onPressed: () {
                                  setState(() {
                                    ++this.initServiceAmount;
                                  });
                                },
                                child: Icon(
                                  MdiIcons.plus,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        
        bottomNavigationBar: Container(
          height: getProportionateScreenHeight(50),
          width: getProportionateScreenWidth(400),
          margin: EdgeInsets.fromLTRB(
              getProportionateScreenWidth(20),
              0,
              getProportionateScreenWidth(20),
              getProportionateScreenHeight(20)),
          child: RaisedButton(
            onPressed: () {
              // if (this.btnConfirmName.contains('Back')) {
              //   myService.forEach((eachService) {
              //     if (eachService['id'] == this.widget.serviceId) {
              //       eachService['value']['isActive'] = false;
              //       eachService['amount'] = '';
              //       print(eachService['amount'] + "  - 123123");
              //       return;
              //     }
              //   });
              //   this.widget.tabController.animateTo(1);
              //   this.widget.presenter.getRefeshStore();
              //   Navigator.pop(context);
              // } else {
              // myService.where((element) => false)

              var serviceTmp = myService.firstWhere(
                  (eachService) => eachService['id'] == this.widget.serviceId);
              serviceTmp['value']['isActive'] = true;
              serviceTmp['amount'] = initServiceAmount.toString();
              print(serviceTmp['amount'] + "  - 123123");
              isServiceExisted = true;
              // this.widget.presenter.getRefeshStore();
              // myService.forEach((eachService) {
              //   if (eachService['id'] == this.widget.serviceId) {
              //     eachService['value']['isActive'] = true;
              //     eachService['amount'] = initServiceAmount.toString();
              //     print(eachService['amount'] + "  - 123123");
              //     return;
              //   }
              // });
              if (this.widget.isComboFromMain) {
                GeneralHelper.navigateToScreen(
                    context,
                    // DetailScreen(
                    //   address: hotComboList[0]['storeAddress'],
                    //   description: hotComboList[0]['description'],
                    //   guestCheckout: '35',
                    //   imageUrl: hotComboList[0]['storeLogo'],
                    //   isLike: true,
                    //   phone: hotComboList[0]['phone'],
                    //   ratingNum: double.parse(hotComboList[0]['ratingStar']),
                    //   storeName: hotComboList[0]['storeName'],
                    //   servicePage: 1,
                    // ),
                    CalendarPage(
                      servicesId: '5',
                      amount: '3',
                      discountData: this.widget.discountData,
                      methodPayment: methodPaymentList[0],
                    ),
                    true);
              } else {
                if (this.widget.fromBill == false) {
                  this.widget.tabController.animateTo(1);
                }
                GeneralHelper.navigateToScreen(
                    context,
                    CalendarPage(
                      servicesId: '5',
                      amount: '3',
                      discountData: this.widget.discountData,
                      methodPayment: methodPaymentList[0],
                    ),
                    true);
              }
              print('ahihi');
              // }
            },
            color: Colors.blue[300],
            child: Text(
              this.widget.fromBill == false
                  ? this.btnConfirmName
                  : this.widget.isComboFromMain
                      ? 'Choose appointment'
                      : 'Update your card',
              style: TextStyle(
                fontSize: getProportionateScreenHeight(18),
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
