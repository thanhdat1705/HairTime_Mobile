import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_hair_time_mobile/screens/bill_confirm/bill_confirm.dart';
import 'package:project_hair_time_mobile/screens/booking_bill/booking_bill_screen.dart';
import 'package:project_hair_time_mobile/screens/booking_bill_step3/booking_bill_step3_screen.dart';
import 'package:project_hair_time_mobile/screens/discounts_store/data/discount_data.dart';
import 'package:project_hair_time_mobile/screens/methods_payment/data/methods_payment_data.dart';
import 'package:project_hair_time_mobile/shared/general_helpers/general_helpers.dart';
import 'package:project_hair_time_mobile/shared/shared_variables/shared_variables.dart';
import 'package:project_hair_time_mobile/shared/size/size_config.dart';
import 'package:project_hair_time_mobile/widgets/header_profile/header_profile.dart';
import 'package:stripe_payment/stripe_payment.dart';

class MethodsPaymentScreen extends StatefulWidget {
  final String total;
  final bool isDiscounted;
  final String address;
  final String storeName;
  final discountData;
  final methodPayment;

  const MethodsPaymentScreen(
      {Key key,
      this.total,
      this.isDiscounted,
      this.address,
      this.storeName,
      this.discountData,
      this.methodPayment})
      : super(key: key);

  @override
  _MethodsPaymentScreenState createState() => _MethodsPaymentScreenState();
}

class _MethodsPaymentScreenState extends State<MethodsPaymentScreen> {
  bool cash = false;
  bool mastercard = false;
  bool momo = false;

  Token _paymentToken;
  PaymentMethod _paymentMethod;
  String _error;
  final String _currentSecret =
      "sk_test_51GxtPhGXrIPXXF3ql5cFhY3KCgCYfibaDLlep2xTvsQOOtOhWzxh1954eiKwx50sYuRycvb8dAYRFED4JMo4WRR500JMf8ZQjy"; //set this yourself, e.g using curl
  PaymentIntentResult _paymentIntent;
  Source _source;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  initState() {
    super.initState();

    StripePayment.setOptions(StripeOptions(
        publishableKey:
            "pk_test_51GxtPhGXrIPXXF3qyLJfrZKWSlSIq6iQNCD2XiyGAimnCvv2kE9cmgCIMcO3uzId0LS2vRKL7XHiAfoklrL5YEKU00GM0wkpdR",
        merchantId: "Test",
        androidPayMode: 'test'));
  }

  void executeChooseMethodPayment(context, methodPayment) {
    // if (methodPayment['id'] == '2') {
    //   StripePayment.paymentRequestWithCardForm(CardFormPaymentRequest())
    //       .then((paymentMethod) {
    //     _scaffoldKey.currentState.showSnackBar(
    //         SnackBar(content: Text('Received ${paymentMethod.id}')));
    //     setState(() {
    //       _paymentMethod = paymentMethod;
    //     });
    //   }).catchError((error) {
    //     print(error);
    //   });
    // }
    GeneralHelper.navigateToScreen(
        context,
        new BillConfirm(
          methodPayment: methodPayment,
          discountData: this.widget.discountData,
          address: this.widget.address,
          storeDiscount: "",
          storeName: this.widget.storeName,
          total: this.widget.total,
          isDiscount: false,
        ),
        true);
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
                headerName: 'Method payment',
                paddingIcon: EdgeInsets.fromLTRB(
                    getProportionateScreenWidth(15),
                    0,
                    getProportionateScreenWidth(90),
                    0),
                heightContainer: getProportionateScreenHeight(30),
                widthContainer: getProportionateScreenWidth(30),
                widthIcon: getProportionateScreenWidth(30),
                widthText: getProportionateScreenWidth(23),
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
              new SizedBox(height: getProportionateScreenHeight(30)),
              new Container(
                height: getProportionateScreenHeight(660),
                width: getProportionateScreenWidth(440),
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: methodPaymentList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(0)),
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: getProportionateScreenHeight(5)),
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom: getProportionateScreenHeight(0)),
                              child: InkWell(
                                onTap: () {
                                  this.executeChooseMethodPayment(
                                      context, methodPaymentList[index]);
                                },
                                child: Container(
                                  height: getProportionateScreenHeight(60),
                                  width: getProportionateScreenWidth(350),
                                  decoration: BoxDecoration(
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
                                                6.5,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                6,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                fit: BoxFit.fill,
                                                image: NetworkImage(
                                                  methodPaymentList[index]
                                                      ["imageMethodPayment"],
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
                                                      210),
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
                                                            50),
                                                    child: Text(
                                                      methodPaymentList[index]
                                                          ["description"],
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      softWrap: false,
                                                      style: TextStyle(
                                                          fontSize:
                                                              getProportionateScreenWidth(
                                                                  18),
                                                          fontWeight: FontWeight
                                                              .normal),
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
