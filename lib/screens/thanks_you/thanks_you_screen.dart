import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_hair_time_mobile/screens/bill_details/bill_detail_screen.dart';
import 'package:project_hair_time_mobile/screens/main/main_screen.dart';
import 'package:project_hair_time_mobile/screens/ticket_user_service/ticket_user_screen.dart';
import 'package:project_hair_time_mobile/shared/general_helpers/general_helpers.dart';
import 'package:project_hair_time_mobile/shared/shared_variables/contants.dart';
import 'package:project_hair_time_mobile/shared/shared_variables/shared_variables.dart';
import 'package:project_hair_time_mobile/shared/size/size_config.dart';
import 'package:project_hair_time_mobile/screens/main/services/main_screen_service.dart';

bool isExistedQR = false;

class ThanksYouScreen extends StatefulWidget {
  ThanksYouScreen({Key key}) : super(key: key);

  @override
  _ThanksYouScreenState createState() => _ThanksYouScreenState();
}

class _ThanksYouScreenState extends State<ThanksYouScreen> {

@override
  void initState() {
    super.initState();
    cancelBill = true;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return new SafeArea(
        child: new Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      body: new Container(
        height: SizeConfig.screenHeight,
        decoration: new BoxDecoration(color: greyWhite),
        alignment: Alignment.center,
        child: new Column(
          children: <Widget>[
            Container(
              width: SizeConfig.screenWidth,
              height: SizeConfig.screenHeight * 0.4 - 50,
              child: new Image.network(
                ThanksBG,
                fit: BoxFit.fill,
              ),
            ),
            new Container(
              // color: Colors.red,
              // height: getProportionateScreenHeight(630),
              width: getProportionateScreenWidth(440),
              child: new Column(children: [
                SizedBox(height: getProportionateScreenHeight(0)),
                new Padding(
                  padding:
                      EdgeInsets.only(bottom: getProportionateScreenHeight(0)),
                  child: new Container(
                      alignment: Alignment.center,
                      height: getProportionateScreenHeight(70),
                      width: getProportionateScreenWidth(440),
                      decoration: BoxDecoration(color: Colors.white),
                      child: new Column(
                        children: [
                          SizedBox(height: getProportionateScreenHeight(7)),
                          new Container(
                            width: 140.0,
                            height: 30.0,
                            decoration: new BoxDecoration(
                              borderRadius: new BorderRadius.circular(30.0),
                              border:
                                  Border.all(width: 1.0, color: Colors.green),
                            ),
                            child: new Center(
                              child: new Text(
                                'Booking Success',
                                style: new TextStyle(color: Colors.green),
                              ),
                            ),
                          ),
                          new Text(
                            'Hope you have a good experience !',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                            style: TextStyle(
                                fontSize: getProportionateScreenWidth(15),
                                fontWeight: FontWeight.normal),
                          )
                        ],
                      )),
                ),
                SizedBox(height: getProportionateScreenHeight(10)),
                new Padding(
                  padding:
                      EdgeInsets.only(bottom: getProportionateScreenHeight(0)),
                  child: new Container(
                      alignment: Alignment.center,
                      height: getProportionateScreenHeight(70),
                      width: getProportionateScreenWidth(440),
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: new Row(
                        children: [
                          SizedBox(height: getProportionateScreenHeight(5)),
                          new Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: new Icon(
                              Icons.book_online,
                              color: Colors.pink,
                            ),
                          ),
                          Text(
                            'ID Booking: ',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              '#1809',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: getProportionateScreenWidth(110),
                                right: 8.0),
                            child: new GestureDetector(
                              child: Text(
                                'Check Appointment',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.normal),
                              ),
                              onTap: () {
                                GeneralHelper.navigateToScreen(context,
                                    new BillDetailScreen(isFromNotifyScreenData: false, hideBack: '1', isfeedBack: '',), false);
                                isExistedQR = true;
                              },
                            ),
                          ),
                        ],
                      )),
                ),
              ], crossAxisAlignment: CrossAxisAlignment.center),
            ),
            new Spacer(),
            new Padding(
              padding: EdgeInsets.only(bottom: getProportionateScreenHeight(0)),
              child: new Container(
                  alignment: Alignment.center,
                  height: getProportionateScreenHeight(70),
                  width: getProportionateScreenWidth(440),
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: new Column(
                    children: [
                      SizedBox(height: getProportionateScreenHeight(5)),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: new GestureDetector(
                          child: new Container(
                            width: 300.0,
                            height: 40.0,
                            decoration: new BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(width: 1, color: Colors.blue),
                            ),
                            child: new Center(
                              child: new Text(
                                'Back to Home Screen',
                                style: new TextStyle(
                                    color: Colors.blue,
                                    fontSize: getProportionateScreenWidth(20),
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ),
                          onTap: () {
                            initMainScreen(context);
                            isExistedQR = true;
                          },
                        ),
                      ),
                    ],
                  )),
            ),
            //new Image.network(ThanksBG)
          ],
        ),
      ),
    ));
  }
}
