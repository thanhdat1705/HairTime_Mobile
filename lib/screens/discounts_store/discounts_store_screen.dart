import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_hair_time_mobile/screens/bill_confirm/bill_confirm.dart';
import 'package:project_hair_time_mobile/screens/booking_bill/booking_bill_screen.dart';
import 'package:project_hair_time_mobile/screens/booking_bill_step3/booking_bill_step3_screen.dart';
import 'package:project_hair_time_mobile/screens/discounts_store/data/discount_data.dart';
import 'package:project_hair_time_mobile/shared/general_helpers/general_helpers.dart';
import 'package:project_hair_time_mobile/shared/size/size_config.dart';
import 'package:project_hair_time_mobile/widgets/header_profile/header_profile.dart';

class DiscountsStoreScreen extends StatefulWidget {
  final String total;
  final bool isDiscounted;
  final String address;
  final String storeName;
  final discountData;
  final methodPayment;

  const DiscountsStoreScreen(
      {Key key,
      this.total,
      this.isDiscounted,
      this.address,
      this.storeName,
      this.discountData,
      this.methodPayment})
      : super(key: key);

  @override
  _DiscountsStoreScreenState createState() => _DiscountsStoreScreenState();
}

class _DiscountsStoreScreenState extends State<DiscountsStoreScreen> {
  void executeDiscount(context, discountData) {
    if (!this.widget.isDiscounted) {
      double total = double.parse(this.widget.total);
      if (discountData['discountType'].toString() == '1') {
        double orderMin = double.parse(discountData['orderMin']);
        if (total < orderMin) {
          GeneralHelper.error(context, 400,
              errorMessage:
                  'Total of booking is not enough to use this discount !!');
        } else {
          GeneralHelper.navigateToScreen(
              context,
              new BillConfirm(
                methodPayment: this.widget.methodPayment,
                discountData: discountData,
                address: this.widget.address,
                storeDiscount: "",
                storeName: this.widget.storeName,
                total: this.widget.total,
                isDiscount: false,
              ),
              true);
        }
      } else if (discountData['discountType'].toString() == '0') {
        double percentDiscount = double.parse(discountData['percentDiscount']);
        double maxDiscount = double.parse(discountData['maxDiscount']);
        if (percentDiscount > maxDiscount) {
          discountData['discount'] = discountData['maxDiscount'];
          GeneralHelper.navigateToScreen(
              context,
              new BillConfirm(
                methodPayment: this.widget.methodPayment,
                discountData: discountData,
                address: this.widget.address,
                storeDiscount: "",
                storeName: this.widget.storeName,
                total: this.widget.total,
                isDiscount: false,
              ),
              true);
        } else {
          double discount = total * percentDiscount / 100;
          discountData['discount'] = discount.toString();
          GeneralHelper.navigateToScreen(
              context,
              new BillConfirm(
                methodPayment: this.widget.methodPayment,
                discountData: discountData,
                address: this.widget.address,
                storeDiscount: "",
                storeName: this.widget.storeName,
                total: this.widget.total,
                isDiscount: false,
              ),
              true);
        }
      }
    } else {
      GeneralHelper.error(context, 400,
          errorMessage:
              'This combo/service is discounted !!\n Can not apply more discount!!');
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        resizeToAvoidBottomPadding: false,
        body: Container(
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              HeaderProfile(
                headerName: 'Discount',
                paddingIcon: EdgeInsets.fromLTRB(
                    getProportionateScreenWidth(15),
                    0,
                    getProportionateScreenWidth(90),
                    0),
                heightContainer: getProportionateScreenHeight(30),
                widthContainer: getProportionateScreenWidth(30),
                widthIcon: getProportionateScreenWidth(30),
                widthText: getProportionateScreenWidth(30),
                textColor: Colors.black,
                onTap: () {
                  GeneralHelper.navigateToScreen(
                      context,
                      new BillConfirm(
                        methodPayment: this.widget.methodPayment,
                        discountData: this.widget.discountData,
                        address: this.widget.address,
                        storeDiscount: "",
                        storeName: this.widget.storeName,
                        total: this.widget.total,
                        isDiscount: false,
                      ),
                      true);
                },
              ),
              Container(
                height: getProportionateScreenHeight(660),
                width: getProportionateScreenWidth(400),
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: discountsList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(15)),
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: getProportionateScreenHeight(10)),
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom: getProportionateScreenHeight(20)),
                              child: InkWell(
                                onTap: () {
                                  this.executeDiscount(
                                      context, discountsList[index]);
                                },
                                child: Container(
                                  height: getProportionateScreenHeight(120),
                                  width: getProportionateScreenWidth(330),
                                  decoration: new BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 1,
                                        offset: Offset(1, 1),
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        child: ClipRRect(
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                4,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                4,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                fit: BoxFit.fill,
                                                image: NetworkImage(
                                                  discountsList[index]
                                                      ["imageDiscount"],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: getProportionateScreenWidth(230),
                                        padding: EdgeInsets.fromLTRB(
                                            getProportionateScreenWidth(20),
                                            getProportionateScreenHeight(5),
                                            0,
                                            0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              width:
                                                  getProportionateScreenWidth(
                                                      215),
                                              height:
                                                  getProportionateScreenHeight(
                                                      50),
                                              child: Row(
                                                children: <Widget>[
                                                  Container(
                                                    width:
                                                        getProportionateScreenWidth(
                                                            210),
                                                    height:
                                                        getProportionateScreenHeight(
                                                            55),
                                                    child: Text(
                                                      discountsList[index]
                                                          ["description"],
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      softWrap: false,
                                                      style: TextStyle(
                                                        fontSize:
                                                            getProportionateScreenWidth(
                                                                16),
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                                height:
                                                    getProportionateScreenHeight(
                                                        3)),
                                            new Row(
                                              children: [
                                                new Container(
                                                  width:
                                                      getProportionateScreenWidth(
                                                          60),
                                                  height:
                                                      getProportionateScreenHeight(
                                                          25),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30.0),
                                                    border: Border.all(
                                                        width: 1.0,
                                                        color: Colors.green),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      'Limit',
                                                      style: TextStyle(
                                                          color: Colors.green),
                                                    ),
                                                  ),
                                                ),
                                                new Container(
                                                  alignment: Alignment.center,
                                                  width:
                                                      getProportionateScreenWidth(
                                                          148),
                                                  height:
                                                      getProportionateScreenHeight(
                                                          40),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            18.0),
                                                    border: Border.all(
                                                        width: 1.0,
                                                        color: Colors.pink),
                                                  ),
                                                  child: Text(
                                                    'Not apply to discounted Combo',
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    softWrap: false,
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.pink,
                                                        fontSize:
                                                            getProportionateScreenWidth(
                                                                11)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                                height:
                                                    getProportionateScreenHeight(
                                                        3)),
                                            Text(
                                              'Available',
                                              style: TextStyle(
                                                fontSize:
                                                    getProportionateScreenWidth(
                                                        13),
                                                color: Colors.greenAccent,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
