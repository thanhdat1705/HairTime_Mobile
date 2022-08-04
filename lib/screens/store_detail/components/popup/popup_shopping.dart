import 'package:flutter/material.dart';
import 'package:project_hair_time_mobile/screens/store_detail/components/customer_service.dart';
import 'package:project_hair_time_mobile/screens/store_detail/components/tab/service_page.dart';
import 'package:project_hair_time_mobile/screens/store_detail/presenter/store_detail_screen_persenter.dart';
import 'package:project_hair_time_mobile/shared/shared_variables/contants.dart';
import 'package:project_hair_time_mobile/shared/size/size_config.dart';
import 'package:project_hair_time_mobile/shared_data/service_list.dart';

class PopupShopping extends StatefulWidget {
  final TabController tabController;
  final IStoreDetailScreenPresenter presenter;

  const PopupShopping({Key key, this.presenter, this.tabController})
      : super(key: key);
  @override
  _PopupShoppingState createState() => _PopupShoppingState();
}

class _PopupShoppingState extends State<PopupShopping> {
  List<dynamic> selected = new List();
  double _totalPrice = 0.0;
  @override
  void initState() {
    // selectedService();
    super.initState();
  }

  void removeService(String serviceName) {
    this.widget.presenter.removeCheckedService(serviceName);
    this.widget.tabController.animateTo(0);
    setState(() {});
  }

  void removeComboService(String comboName, String idCombo) {
    this.widget.presenter.removeCheckedComboServiceInCard(idCombo);
    this.widget.tabController.animateTo(0);
    setState(() {});
  }

  List<Widget> servicePerCus(CustomerService customerServiceList) {
    List<Widget> serviceListPerCus = [];
    customerServiceList.servicePerCus.forEach(
      (eachService) {
        _totalPrice += double.parse(eachService["value"]["price"]);
        serviceListPerCus.add(
          RichText(
            maxLines: 2,
            text: TextSpan(
              style: TextStyle(color: Colors.black),
              children: [
                TextSpan(
                  text: eachService["value"]["name"] + " ",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                ),
                TextSpan(
                  text: "\$" +
                      double.parse(eachService["value"]["price"]).toString(),
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                ),
              ],
            ),
          ),
        );
      },
    );

    return serviceListPerCus;
  }

  void selectedService() {
    List<Widget> customerList = [];
    if (customerServiceList.isNotEmpty) {
      customerServiceList.forEach((eachCustomer) {
        customerList.add(Container(
          margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
          padding: EdgeInsets.symmetric(horizontal: 10),
          height: SizeConfig.screenHeight * 0.1,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 10),
                blurRadius: 33,
                color: kShadowColor,
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        eachCustomer.name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(10)),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: servicePerCus(eachCustomer),
                    )
                  ],
                ),
              ),
              FlatButton(
                height: getProportionateScreenHeight(65),
                minWidth: getProportionateScreenWidth(10),
                onPressed: () {
                  // removeService(dataService["value"]["name"]);
                  // removeComboService(
                  //     dataService["value"]["name"], dataService["id"]);
                  // dataService["value"]["isActive"] = false;
                  // deleteService(eachCustomer.id);
                  setState(() {
                    customerServiceList
                        .removeWhere((cusId) => cusId.id == eachCustomer.id);
                  });
                  print('clicked delete');
                },
                highlightColor: Colors.grey[50],
                color: Colors.blue[50],
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(40.0)),
                child: Icon(
                  Icons.cancel_presentation,
                  color: Colors.red[300],
                  size: 16,
                ),
              ),
            ],
          ),
        ));
      });
      setState(() {
        selected = customerList;
      });
    } else {
      customerList.add(
        Container(
          margin: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(10),
              vertical: getProportionateScreenHeight(90)),
          color: Colors.white,
          height: SizeConfig.screenHeight * 0.2,
          width: SizeConfig.screenWidth * 0.7,
          child: Text(
            "Please select some service!!!",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w500, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ),
      );
      setState(() {
        selected = customerList;
      });
    }
  }

  void deleteService(int id) {
    this.widget.presenter.getRefeshStore();
    customerServiceList.removeWhere((cusId) => cusId.id == id);
    setState(() {});
  }

  void deleteAllCard() {
    this.widget.presenter.removeListStoreServiceAll();
    customerServiceList.clear();
    myService.forEach((eachService) {
      eachService['value']['isActice'] = false;
      eachService['amount'] = '';
    });
    setState(() {
      _totalPrice = 0.0;
    });
  }

  void callBack() {
    this
        .widget
        .tabController
        .animateTo(1, duration: Duration(milliseconds: 100));
  }

  @override
  Widget build(BuildContext context) {
    selectedService();
    return Material(
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(25), topLeft: Radius.circular(25)),
      color: Colors.white,
      child: Container(
        height: SizeConfig.screenHeight * 0.75,
        margin: EdgeInsets.only(top: 0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                color: Colors.grey,
                width: 2.0,
              ))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      deleteAllCard();
                      print('clicked delete all');
                    },
                    child: Container(
                        color: Colors.white,
                        padding: EdgeInsets.fromLTRB(
                            0.0,
                            getProportionateScreenHeight(10),
                            0.0,
                            getProportionateScreenHeight(10)),
                        child: Text(
                          "Delete all",
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.blueAccent,
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.w400),
                        )),
                  ),
                  Container(
                    color: Colors.white,
                    margin: EdgeInsets.only(left: 0.0),
                    child: Text(
                      "Your Card",
                      style: TextStyle(fontSize: 25, color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.cancel_outlined,
                        size: 27,
                      ),
                      onPressed: () {
                        callBack();
                        Navigator.of(context).pop();
                      }),
                ],
              ),
            ),
            Expanded(
                child: Container(
              margin: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(10)),
              color: Colors.white,
              height: SizeConfig.screenHeight,
              width: SizeConfig.screenWidth,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: selected == null ? 0 : selected.length,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return selected[index];
                },
              ),
            )),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(
                    color: Colors.grey,
                    width: 2.0,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total:",
                      style: TextStyle(fontSize: 20, color: Colors.black)),
                  Text("\$" + this._totalPrice.toString(),
                      style: TextStyle(fontSize: 20, color: Colors.black)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
