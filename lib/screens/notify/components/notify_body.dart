import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_hair_time_mobile/screens/bill_details/bill_detail_screen.dart';
import 'package:project_hair_time_mobile/screens/main/main_screen.dart';
import 'package:project_hair_time_mobile/shared/general_helpers/general_helpers.dart';
import 'package:project_hair_time_mobile/shared/shared_variables/shared_variables.dart';
import 'package:project_hair_time_mobile/shared/size/size_config.dart';

class NotifyBody extends StatefulWidget {
  const NotifyBody({
    Key key,
  }) : super(key: key);
  @override
  _NotifyBodyState createState() => _NotifyBodyState();
}

class _NotifyBodyState extends State<NotifyBody> {
  DateTime time = new DateTime.now();

  GestureDetector _cardNotify(
      bool isUnread,
      String styleList,
      String storeName,
      String address,
      String bookingTime,
      String statusName,
      String statusIcon,
      Color colorName,
      bool isCancelApointment,
      String isFeedback) {
    return GestureDetector(
      onTap: () {
        GeneralHelper.navigateToScreen(
            context,
            BillDetailScreen(
              isFromNotifyScreenData: isCancelApointment,
              isfeedBack: isFeedback,
            ),
            false);
      },
      child: Container(
        color: Colors.white,
        // height: getProportionateScreenHeight(120),
        width: SizeConfig.screenWidth,
        margin: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
          vertical: getProportionateScreenHeight(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(0),
              // height: getProportionateScreenHeight(40),
              // width: getProportionateScreenWidth(40),

              child: Opacity(
                opacity: isUnread ? 1 : 0.4,
                child: Image.network(
                  "https://raw.githubusercontent.com/sonhoang1809/Assets/master/Images/Project_Hair_Time/schedule.png",
                  fit: BoxFit.fill,
                  height: getProportionateScreenHeight(55),
                  // colorBlendMode: ,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.6 - 20,
              margin: EdgeInsets.only(
                left: getProportionateScreenWidth(25),
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    statusName,
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: colorName),
                  ),

                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      storeName,
                      style: TextStyle(
                        fontSize: 16,
                        color: isUnread ? Colors.black : Colors.grey[400],
                      ),
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(10)),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      address,
                      style: TextStyle(
                        fontSize: 14,
                        color: isUnread ? Colors.black : Colors.grey[400],
                      ),
                      maxLines: 2,
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(0)),
                  // Container(
                  //   alignment: Alignment.topLeft,
                  //   child: Text(
                  //     "Stylelist: " + styleList,
                  //     style: TextStyle(
                  //       fontSize: 14,
                  //       color: isUnread ? Colors.black : Colors.grey[400],
                  //     ),
                  //     maxLines: 2,
                  //   ),
                  // ),
                  SizedBox(height: getProportionateScreenHeight(10)),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Appointment: " +
                          bookingTime +
                          " - " +
                          // DateFormat.yMMMd().format(time),
                          "02/11/2020",
                      style: TextStyle(
                        fontSize: 14,
                        color: isUnread ? Colors.black : Colors.grey[400],
                      ),
                      maxLines: 2,
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(10)),
                ],
              ),
            ),
            Spacer(),
            Image.network(
              statusIcon,
              width: 35,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          brightness: Brightness.dark,
          backgroundColor: Colors.blue,
          elevation: 8,
          automaticallyImplyLeading: false,
          title: Text(
            'Appointment  ',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.playlist_add_check),
              color: Colors.white,
              iconSize: getProportionateScreenHeight(33),
              onPressed: () {},
            ),
          ],
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              cancelBill == false
                  ? this._cardNotify(
                      true,
                      "Jane Doe",
                      "Liem Barber Shop",
                      "2 Phan Van Tri, Phuong 14, Binh Thanh, TP.HCM",
                      "16:30",
                      "Cancel",
                      CANCEL,
                      Colors.red,
                      true,
                      '')
                  : this._cardNotify(
                      true,
                      "Jane Doe",
                      "Liem Barber Shop",
                      "2 Phan Van Tri, Phuong 14, Binh Thanh, TP.HCM",
                      "16:30",
                      "Pending",
                      WAITTING,
                      Colors.amber,
                      true,
                      ''),
              this._cardNotify(
                  true,
                  "Jane Doe",
                  "Barber Shop",
                  "2 Le Van Sy, Phuong 14, Q1, TP.HCM",
                  "16:30",
                  "Pending",
                  WAITTING,
                  Colors.amber,
                  true,
                  ''),
              this._cardNotify(
                  true,
                  "Dang Hoang Son",
                  "Barber Vu Tri",
                  "175 Phan Dinh Phung, P.17, Q.Phu Nhuan, TP.HCM",
                  "13:00",
                  "Check out apointment",
                  SUCCESSFULY,
                  Colors.green,
                  false,
                  '1'),
              this._cardNotify(
                  true,
                  "Nguyen Hoang Phuc Huy",
                  "Beauty Salon",
                  "225 Le Van Si, P.7, Q.Phu Nhuan. Tp.HCM",
                  "17:00",
                  "Check out apointment",
                  SUCCESSFULY,
                  Colors.green,
                  false,
                  '1'),
              this._cardNotify(
                  true,
                  "Duc Minh",
                  "Beauty Salon 100% Oganic",
                  "225 Le Van Si, P.7, Q.Phu Nhuan. Tp.HCM",
                  "17:00",
                  "Cancel",
                  CANCEL,
                  Colors.red,
                  false,
                  ''),
            ],
          ),
        ));
  }
}
