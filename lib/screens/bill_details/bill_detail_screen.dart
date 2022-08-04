import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:project_hair_time_mobile/screens/main/main_screen.dart';
import 'package:project_hair_time_mobile/screens/main/services/main_screen_service.dart';
import 'package:project_hair_time_mobile/screens/notify/notify_screen.dart';
import 'package:project_hair_time_mobile/shared/general_helpers/general_helpers.dart';
import 'package:project_hair_time_mobile/shared/size/size_config.dart';
import 'package:project_hair_time_mobile/shared_data/service_list.dart';
import 'package:rating_dialog/rating_dialog.dart';

class BillDetailScreen extends StatefulWidget {
  final bool isFromNotifyScreenData;
  final String hideBack;
  String isfeedBack;
  BillDetailScreen(
      {Key key, this.isFromNotifyScreenData, this.hideBack, this.isfeedBack})
      : super(key: key);

  @override
  _BillDetailScreenState createState() => _BillDetailScreenState();
}

class _BillDetailScreenState extends State<BillDetailScreen> {
  final String pictureStore =
      'https://raw.githubusercontent.com/sonhoang1809/Assets/master/Images/Project_Hair_Time/hairBarber.jpg';
  final String store =
      'https://raw.githubusercontent.com/sonhoang1809/Assets/master/Images/Project_Hair_Time/shops.svg';
  final String addressStore =
      'https://raw.githubusercontent.com/sonhoang1809/Assets/master/Images/Project_Hair_Time/address.svg';
  DateTime dateTime = new DateTime.now();
  String storeName;
  String storeAddress;
  TextEditingController _feedback = new TextEditingController();
  @override
  void initState() {
    super.initState();
    myService.forEach(
      (element) {
        if (element['value']['isActive'] == true) {
          this.storeName = element['name'];
        }
      },
    );
  }

  Widget dialogCancel() {
    return AlertDialog(
      title: Text("Please tell us the reason"),
      content: TextField(
        maxLength: null,
        maxLines: null,
      ),
      actions: [
        FlatButton(
          child: Text('OK'),
          onPressed: () {
            cancelBill = false;
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NotifyScreen()),
            );
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

  void _showRatingDialog() {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return Center(
            child: SingleChildScrollView(
              child: RatingDialog(
                icon: Column(
                  children: [
                    Text('Feed back',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 10,
                    ),
                    Image.network(
                      'https://raw.githubusercontent.com/sonhoang1809/Assets/master/Images/Project_Hair_Time/Logo_Stores/barber_logo.jpg',
                      height: 180,
                    ),
                    SingleChildScrollView(
                      child: Container(
                        width: SizeConfig.screenWidth,
                        margin: EdgeInsets.only(top: 10),
                        padding: EdgeInsets.all(10),
                        height: 120,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black),
                        ),
                        child: TextField(
                          readOnly: false,
                          // onChanged: this.onChanged,
                          // onTap: this.onTap,
                          style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 15,
                              fontWeight: FontWeight.w400),
                          keyboardType: TextInputType.text,
                          textAlign: TextAlign.left,
                          autofocus: false,
                          decoration: InputDecoration.collapsed(
                            border: InputBorder.none,
                            hintText: 'type your feed back',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                title: "Liem Barber Shop",
                description:
                    "Tap a star to set your rating. Add more description here if you want.",
                submitButton: "SUBMIT",
                alternativeButton: "Contact us instead?",
                positiveComment: "We are so happy to hear :)",
                negativeComment: "We're sad to hear :(",
                accentColor: Colors.red, // optional
                onSubmitPressed: (int rating) {
                  setState(() {
                    this.widget.isfeedBack = '';
                  });

                  print("onSubmitPressed: rating = $rating");
                },
                onAlternativePressed: () {
                  print("onAlternativePressed: do something");
                },
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return new SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          child: Container(
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    this.widget.hideBack == null
                        ? IconButton(
                            icon: Icon(Icons.arrow_back_ios),
                            iconSize: getProportionateScreenWidth(36),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          )
                        : Container(
                            width: getProportionateScreenWidth(60),
                          ),
                    Container(
                      padding: EdgeInsets.only(
                          left: getProportionateScreenWidth(28)),
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Your Appointment',
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(30),
                          color: Colors.blue,
                          fontFamily: 'PlayBall',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(5),
                    vertical: getProportionateScreenHeight(10),
                  ),
                  height: getProportionateScreenHeight(100),
                  width: getProportionateScreenWidth(400),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: Container(
                    alignment: Alignment.topLeft,
                    width: getProportionateScreenWidth(200),
                    margin: EdgeInsets.only(
                      left: getProportionateScreenWidth(10),
                    ),
                    child: Column(
                      children: <Widget>[
                        RichText(
                          maxLines: 10,
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                child: Container(
                                  margin: EdgeInsets.only(
                                      top: getProportionateScreenHeight(15)),
                                  height: getProportionateScreenHeight(25),
                                  width: getProportionateScreenWidth(30),
                                  child: SvgPicture.network(store),
                                ),
                              ),
                              TextSpan(
                                text: '\t' + 'Boutique Barber' + '\n',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: getProportionateScreenWidth(18),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              WidgetSpan(
                                child: Container(
                                  margin: EdgeInsets.only(
                                      top: getProportionateScreenHeight(10)),
                                  height: getProportionateScreenHeight(25),
                                  width: getProportionateScreenWidth(30),
                                  child: SvgPicture.network(addressStore),
                                ),
                              ),
                              TextSpan(
                                text:
                                    '\t' + '78 Ngo Duc Ke, Q.1, TP. HCM' + '\n',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: getProportionateScreenWidth(14),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: getProportionateScreenHeight(220),
                  width: getProportionateScreenWidth(400),
                  margin: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(5),
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: getProportionateScreenHeight(200),
                        width: getProportionateScreenWidth(400),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: getProportionateScreenWidth(400),
                              padding: EdgeInsets.symmetric(
                                horizontal: getProportionateScreenWidth(5),
                                vertical: getProportionateScreenHeight(5),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      // Container(
                                      //   height:
                                      //       getProportionateScreenHeight(50),
                                      //   width: getProportionateScreenWidth(30),
                                      //   padding: EdgeInsets.symmetric(
                                      //     horizontal:
                                      //         getProportionateScreenWidth(5),
                                      //     vertical:
                                      //         getProportionateScreenHeight(5),
                                      //   ),
                                      //   child: SvgPicture.network(INFO),
                                      // ),
                                      Container(
                                        child: Text(
                                          'Services Summary',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize:
                                                getProportionateScreenWidth(18),
                                            // fontFamily: 'Playball',
                                          ),
                                        ),
                                      ),
                                      // Container(
                                      //   margin: EdgeInsets.only(
                                      //     left: getProportionateScreenWidth(10),
                                      //   ),
                                      //   child: FlatButton(
                                      //     onPressed: null,
                                      //     child: Text(
                                      //       'Booking again',
                                      //       style: TextStyle(
                                      //         color: Colors.blue[300],
                                      //         fontWeight: FontWeight.bold,
                                      //       ),
                                      //     ),
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            Container(
                              margin: EdgeInsets.only(
                                  left: getProportionateScreenWidth(5)),
                              width: getProportionateScreenWidth(400),
                              child: RichText(
                                text: TextSpan(
                                  text: '2x\t',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: getProportionateScreenWidth(18),
                                  ),
                                  children: [
                                    WidgetSpan(
                                      child: Container(
                                        margin: EdgeInsets.only(
                                          left: getProportionateScreenWidth(30),
                                        ),
                                        child: Text(
                                          'Haircut',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize:
                                                getProportionateScreenWidth(18),
                                          ),
                                        ),
                                      ),
                                    ),
                                    WidgetSpan(
                                      child: Container(
                                        margin: EdgeInsets.only(
                                          left:
                                              getProportionateScreenWidth(199),
                                        ),
                                        child: Text(
                                          '\$3.6',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize:
                                                getProportionateScreenWidth(18),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            Container(
                              margin: EdgeInsets.only(
                                  left: getProportionateScreenWidth(5),
                                  top: getProportionateScreenHeight(10)),
                              width: getProportionateScreenWidth(400),
                              child: RichText(
                                text: TextSpan(
                                  text: '1x\t',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: getProportionateScreenWidth(18),
                                  ),
                                  children: [
                                    WidgetSpan(
                                      child: Container(
                                        margin: EdgeInsets.only(
                                          left: getProportionateScreenWidth(30),
                                        ),
                                        child: Text(
                                          'Facial',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize:
                                                getProportionateScreenWidth(18),
                                          ),
                                        ),
                                      ),
                                    ),
                                    WidgetSpan(
                                      child: Container(
                                        margin: EdgeInsets.only(
                                          left:
                                              getProportionateScreenWidth(210),
                                        ),
                                        child: Text(
                                          '\$4.8',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize:
                                                getProportionateScreenWidth(18),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: getProportionateScreenWidth(5),
                                  top: getProportionateScreenHeight(10)),
                              width: getProportionateScreenWidth(400),
                              child: RichText(
                                text: TextSpan(
                                  text: '1x\t',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: getProportionateScreenWidth(18),
                                  ),
                                  children: [
                                    WidgetSpan(
                                      child: Container(
                                        margin: EdgeInsets.only(
                                          left: getProportionateScreenWidth(30),
                                        ),
                                        child: Text(
                                          'Beard Design',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize:
                                                getProportionateScreenWidth(18),
                                          ),
                                        ),
                                      ),
                                    ),
                                    WidgetSpan(
                                      child: Container(
                                        margin: EdgeInsets.only(
                                          left:
                                              getProportionateScreenWidth(151),
                                        ),
                                        child: Text(
                                          '\$3.0',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize:
                                                getProportionateScreenWidth(18),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.only(
                                    left: getProportionateScreenWidth(5),
                                    top: getProportionateScreenHeight(10)),
                                child: Text(
                                  'Number of seat : 2',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: getProportionateScreenWidth(18),
                                  ),
                                )),
                            Container(
                              margin: EdgeInsets.only(
                                  left: getProportionateScreenWidth(5),
                                  top: getProportionateScreenHeight(10)),
                              width: getProportionateScreenWidth(400),
                              child: RichText(
                                text: TextSpan(
                                  text: 'Coming time      :',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: getProportionateScreenWidth(18),
                                  ),
                                  children: [
                                    WidgetSpan(
                                      child: Container(
                                        margin: EdgeInsets.only(
                                          left: getProportionateScreenWidth(3),
                                        ),
                                        child: Text('16:30 Sat 11 Nov 2020',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize:
                                                getProportionateScreenWidth(18),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // Container(
                            //   margin: EdgeInsets.only(
                            //       left: getProportionateScreenWidth(5),
                            //       top: getProportionateScreenHeight(10)),
                            //   width: getProportionateScreenWidth(400),
                            //   child: Row(
                            //     children: <Widget>[
                            //       Container(
                            //         child: Text(
                            //           'Service staff: ',
                            //           style: TextStyle(
                            //             fontSize:
                            //                 getProportionateScreenWidth(16),
                            //           ),
                            //         ),
                            //       ),
                            //       Container(
                            //         margin: EdgeInsets.only(
                            //             left: getProportionateScreenWidth(35)),
                            //         child: Text(
                            //           'Alan Dark',
                            //           style: TextStyle(
                            //             fontSize:
                            //                 getProportionateScreenWidth(14),
                            //           ),
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),

                            // old code

                            // Container(
                            //   width: getProportionateScreenWidth(400),
                            //   padding: EdgeInsets.symmetric(
                            //       horizontal: getProportionateScreenWidth(5),
                            //       vertical: getProportionateScreenHeight(5)),
                            //   child: Text(
                            //     'Nguyen Thanh Dat - 0909065656',
                            //     style: TextStyle(
                            //       fontSize: getProportionateScreenWidth(15),
                            //       fontWeight: FontWeight.bold,
                            //     ),
                            //   ),
                            // ),
                            // Container(
                            //   width: getProportionateScreenWidth(400),
                            //   margin: EdgeInsets.only(
                            //       left: getProportionateScreenWidth(20)),
                            //   child: Row(
                            //     children: <Widget>[
                            //       Container(
                            //         width: getProportionateScreenWidth(280),
                            //         child: Text(
                            //           'Haircut',
                            //           style: TextStyle(
                            //             fontSize:
                            //                 getProportionateScreenWidth(14),
                            //           ),
                            //         ),
                            //       ),
                            //       Container(
                            //         width: getProportionateScreenWidth(50),
                            //         child: Text(
                            //           '\$3.5',
                            //           style: TextStyle(
                            //             fontSize:
                            //                 getProportionateScreenWidth(14),
                            //           ),
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            // Container(
                            //   width: getProportionateScreenWidth(400),
                            //   margin: EdgeInsets.only(
                            //       left: getProportionateScreenWidth(60)),
                            //   child: Row(
                            //     children: <Widget>[
                            //       Container(
                            //         width: getProportionateScreenWidth(280),
                            //         child: Text(
                            //           'Service staff: Alan Dark',
                            //           style: TextStyle(
                            //             fontSize:
                            //                 getProportionateScreenWidth(12.5),
                            //           ),
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            // Container(
                            //   width: getProportionateScreenWidth(400),
                            //   margin: EdgeInsets.only(
                            //       left: getProportionateScreenWidth(60)),
                            //   child: Row(
                            //     children: <Widget>[
                            //       Container(
                            //         width: getProportionateScreenWidth(280),
                            //         child: Text(
                            //           'Time service: ' +
                            //               DateFormat('kk:mm EEE d MMM y')
                            //                   .format(dateTime),
                            //           style: TextStyle(
                            //             fontSize:
                            //                 getProportionateScreenWidth(12.5),
                            //           ),
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            // Container(
                            //   width: getProportionateScreenWidth(400),
                            //   margin: EdgeInsets.only(
                            //       left: getProportionateScreenWidth(20)),
                            //   child: Row(
                            //     children: <Widget>[
                            //       Container(
                            //         width: getProportionateScreenWidth(280),
                            //         child: Text(
                            //           'Facial',
                            //           style: TextStyle(
                            //             fontSize:
                            //                 getProportionateScreenWidth(14),
                            //           ),
                            //         ),
                            //       ),
                            //       Container(
                            //         width: getProportionateScreenWidth(50),
                            //         child: Text(
                            //           '\$2.7',
                            //           style: TextStyle(
                            //             fontSize:
                            //                 getProportionateScreenWidth(14),
                            //           ),
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            // Container(
                            //   width: getProportionateScreenWidth(400),
                            //   margin: EdgeInsets.only(
                            //       left: getProportionateScreenWidth(60)),
                            //   child: Row(
                            //     children: <Widget>[
                            //       Container(
                            //         width: getProportionateScreenWidth(280),
                            //         child: Text(
                            //           'Service staff: Las Luna',
                            //           style: TextStyle(
                            //             fontSize:
                            //                 getProportionateScreenWidth(12.5),
                            //           ),
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            // Container(
                            //   width: getProportionateScreenWidth(400),
                            //   margin: EdgeInsets.only(
                            //       left: getProportionateScreenWidth(60)),
                            //   child: Row(
                            //     children: <Widget>[
                            //       Container(
                            //         width: getProportionateScreenWidth(280),
                            //         child: Text(
                            //           'Time service: ' +
                            //               DateFormat('kk:mm EEE d MMM y')
                            //                   .format(dateTime),
                            //           style: TextStyle(
                            //             fontSize:
                            //                 getProportionateScreenWidth(12.5),
                            //           ),
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            // Container(
                            //   width: getProportionateScreenWidth(400),
                            //   margin: EdgeInsets.only(
                            //       left: getProportionateScreenWidth(20)),
                            //   child: Row(
                            //     children: <Widget>[
                            //       Container(
                            //         width: getProportionateScreenWidth(280),
                            //         child: Text(
                            //           'Beard Design',
                            //           style: TextStyle(
                            //             fontSize:
                            //                 getProportionateScreenWidth(14),
                            //           ),
                            //         ),
                            //       ),
                            //       Container(
                            //         width: getProportionateScreenWidth(50),
                            //         child: Text(
                            //           '\$5.2',
                            //           style: TextStyle(
                            //             fontSize:
                            //                 getProportionateScreenWidth(14),
                            //           ),
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            // Container(
                            //   width: getProportionateScreenWidth(400),
                            //   margin: EdgeInsets.only(
                            //       left: getProportionateScreenWidth(60)),
                            //   child: Row(
                            //     children: <Widget>[
                            //       Container(
                            //         width: getProportionateScreenWidth(280),
                            //         child: Text(
                            //           'Service staff: Badin Alark',
                            //           style: TextStyle(
                            //             fontSize:
                            //                 getProportionateScreenWidth(12.5),
                            //           ),
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            // Container(
                            //   width: getProportionateScreenWidth(400),
                            //   margin: EdgeInsets.only(
                            //       left: getProportionateScreenWidth(60)),
                            //   child: Row(
                            //     children: <Widget>[
                            //       Container(
                            //         width: getProportionateScreenWidth(280),
                            //         child: Text(
                            //           'Time service: ' +
                            //               DateFormat('kk:mm EEE d MMM y')
                            //                   .format(dateTime),
                            //           style: TextStyle(
                            //             fontSize:
                            //                 getProportionateScreenWidth(12.5),
                            //           ),
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            // Container(
                            //   width: getProportionateScreenWidth(400),
                            //   padding: EdgeInsets.symmetric(
                            //       horizontal: getProportionateScreenWidth(5),
                            //       vertical: getProportionateScreenHeight(5)),
                            //   child: Text(
                            //     'Dang Hoang Son - 0789008130',
                            //     style: TextStyle(
                            //       fontSize: getProportionateScreenWidth(15),
                            //       fontWeight: FontWeight.bold,
                            //     ),
                            //   ),
                            // ),
                            // Container(
                            //   width: getProportionateScreenWidth(400),
                            //   margin: EdgeInsets.only(
                            //       left: getProportionateScreenWidth(20)),
                            //   child: Row(
                            //     children: <Widget>[
                            //       Container(
                            //         width: getProportionateScreenWidth(280),
                            //         child: Text(
                            //           'Haircut',
                            //           style: TextStyle(
                            //             fontSize:
                            //                 getProportionateScreenWidth(14),
                            //           ),
                            //         ),
                            //       ),
                            //       Container(
                            //         width: getProportionateScreenWidth(50),
                            //         child: Text(
                            //           '\$3.5',
                            //           style: TextStyle(
                            //             fontSize:
                            //                 getProportionateScreenWidth(14),
                            //           ),
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            // Container(
                            //   width: getProportionateScreenWidth(400),
                            //   margin: EdgeInsets.only(
                            //       left: getProportionateScreenWidth(60)),
                            //   child: Row(
                            //     children: <Widget>[
                            //       Container(
                            //         width: getProportionateScreenWidth(280),
                            //         child: Text(
                            //           'Service staff: Wage Scale',
                            //           style: TextStyle(
                            //             fontSize:
                            //                 getProportionateScreenWidth(12.5),
                            //           ),
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            // Container(
                            //   width: getProportionateScreenWidth(400),
                            //   margin: EdgeInsets.only(
                            //       left: getProportionateScreenWidth(60)),
                            //   child: Row(
                            //     children: <Widget>[
                            //       Container(
                            //         width: getProportionateScreenWidth(280),
                            //         child: Text(
                            //           'Time service: ' +
                            //               DateFormat('kk:mm EEE d MMM y')
                            //                   .format(dateTime),
                            //           style: TextStyle(
                            //             fontSize:
                            //                 getProportionateScreenWidth(12.5),
                            //           ),
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            // Container(
                            //   width: getProportionateScreenWidth(400),
                            //   margin: EdgeInsets.only(
                            //       left: getProportionateScreenWidth(20)),
                            //   child: Row(
                            //     children: <Widget>[
                            //       Container(
                            //         width: getProportionateScreenWidth(280),
                            //         child: Text(
                            //           'Facial',
                            //           style: TextStyle(
                            //             fontSize:
                            //                 getProportionateScreenWidth(14),
                            //           ),
                            //         ),
                            //       ),
                            //       Container(
                            //         width: getProportionateScreenWidth(50),
                            //         child: Text(
                            //           '\$2.7',
                            //           style: TextStyle(
                            //             fontSize:
                            //                 getProportionateScreenWidth(14),
                            //           ),
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            // Container(
                            //   width: getProportionateScreenWidth(400),
                            //   margin: EdgeInsets.only(
                            //       left: getProportionateScreenWidth(60)),
                            //   child: Row(
                            //     children: <Widget>[
                            //       Container(
                            //         width: getProportionateScreenWidth(280),
                            //         child: Text(
                            //           'Service staff: Scapton',
                            //           style: TextStyle(
                            //             fontSize:
                            //                 getProportionateScreenWidth(12.5),
                            //           ),
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            // Container(
                            //   width: getProportionateScreenWidth(400),
                            //   margin: EdgeInsets.only(
                            //       left: getProportionateScreenWidth(60)),
                            //   child: Row(
                            //     children: <Widget>[
                            //       Container(
                            //         width: getProportionateScreenWidth(280),
                            //         child: Text(
                            //           'Time service: ' +
                            //               DateFormat('kk:mm EEE d MMM y')
                            //                   .format(dateTime),
                            //           style: TextStyle(
                            //             fontSize:
                            //                 getProportionateScreenWidth(12.5),
                            //           ),
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            // Container(
                            //   width: getProportionateScreenWidth(400),
                            //   margin: EdgeInsets.only(
                            //       left: getProportionateScreenWidth(20)),
                            //   child: Row(
                            //     children: <Widget>[
                            //       Container(
                            //         width: getProportionateScreenWidth(280),
                            //         child: Text(
                            //           'Beard Design',
                            //           style: TextStyle(
                            //             fontSize:
                            //                 getProportionateScreenWidth(14),
                            //           ),
                            //         ),
                            //       ),
                            //       Container(
                            //         width: getProportionateScreenWidth(50),
                            //         child: Text(
                            //           '\$5.2',
                            //           style: TextStyle(
                            //             fontSize:
                            //                 getProportionateScreenWidth(14),
                            //           ),
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            // Container(
                            //   width: getProportionateScreenWidth(400),
                            //   margin: EdgeInsets.only(
                            //       left: getProportionateScreenWidth(60)),
                            //   child: Row(
                            //     children: <Widget>[
                            //       Container(
                            //         width: getProportionateScreenWidth(280),
                            //         child: Text(
                            //           'Service staff: Las Luna',
                            //           style: TextStyle(
                            //             fontSize:
                            //                 getProportionateScreenWidth(12.5),
                            //           ),
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            // Container(
                            //   width: getProportionateScreenWidth(400),
                            //   margin: EdgeInsets.only(
                            //       left: getProportionateScreenWidth(60)),
                            //   child: Row(
                            //     children: <Widget>[
                            //       Container(
                            //         width: getProportionateScreenWidth(280),
                            //         child: Text(
                            //           'Time service: ' +
                            //               DateFormat('kk:mm EEE d MMM y')
                            //                   .format(dateTime),
                            //           style: TextStyle(
                            //             fontSize:
                            //                 getProportionateScreenWidth(12.5),
                            //           ),
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: getProportionateScreenHeight(150),
                  width: getProportionateScreenWidth(400),
                  margin: EdgeInsets.symmetric(
                    vertical: getProportionateScreenHeight(10),
                    horizontal: getProportionateScreenWidth(5),
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: Container(
                    alignment: Alignment.topLeft,
                    height: getProportionateScreenHeight(120),
                    width: getProportionateScreenWidth(400),
                    margin: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(5),
                      vertical: getProportionateScreenHeight(5),
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(
                            bottom: getProportionateScreenHeight(5),
                          ),
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: getProportionateScreenWidth(100),
                                child: Text('Subtotal',
                                    style: TextStyle(fontSize: 17)),
                              ),
                              Spacer(),
                              Container(
                                width: getProportionateScreenWidth(48),
                                child: Text('\$11.4',
                                    style: TextStyle(fontSize: 17)),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // color: Colors.red,
                          margin: EdgeInsets.only(
                            bottom: getProportionateScreenHeight(5),
                          ),
                          child: Row(
                            children: <Widget>[
                              Container(
                                child: Text('Discount',
                                    style: TextStyle(fontSize: 17)),
                              ),
                              SizedBox(width: getProportionateScreenWidth(10)),
                              Container(
                                width: getProportionateScreenWidth(60),
                                child: Text('(30%)',
                                    style: TextStyle(fontSize: 17)),
                              ),
                              Spacer(),
                              Container(
                                width: getProportionateScreenWidth(52),
                                child: Text('-\$3.42',
                                    style: TextStyle(fontSize: 17)),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: getProportionateScreenWidth(400),
                          height: getProportionateScreenHeight(10),
                          margin: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(40),
                          ),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom:
                                  BorderSide(width: 1.0, color: Colors.grey),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: getProportionateScreenHeight(10),
                          ),
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: getProportionateScreenWidth(312),
                                child: Text(
                                  'Payment methods',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Container(
                                width: getProportionateScreenWidth(40),
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Cash',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize:
                                              getProportionateScreenWidth(16),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: getProportionateScreenHeight(5),
                          ),
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: getProportionateScreenWidth(265),
                                child: Text(
                                  'Total',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: getProportionateScreenWidth(30)),
                                width: getProportionateScreenWidth(58),
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      WidgetSpan(
                                        child: Container(
                                          child: Icon(
                                            MdiIcons.cashUsdOutline,
                                            color: Colors.green,
                                            size:
                                                getProportionateScreenWidth(18),
                                          ),
                                        ),
                                      ),
                                      TextSpan(
                                        text: '\t7.98',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize:
                                              getProportionateScreenWidth(16),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: this.widget.isFromNotifyScreenData,
                  child: Container(
                    width: getProportionateScreenWidth(400),
                    margin: EdgeInsets.fromLTRB(
                      getProportionateScreenWidth(20),
                      getProportionateScreenHeight(70),
                      getProportionateScreenWidth(20),
                      getProportionateScreenHeight(10),
                    ),
                    color: Colors.blue[200],
                    child: FlatButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (_) => this.dialogCancel(),
                            barrierDismissible: false);
                      },
                      child: Text(
                        'Cancel the appointment',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: getProportionateScreenWidth(18),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                this.widget.isfeedBack != ''
                    ? Container(
                        width: getProportionateScreenWidth(400),
                        margin: EdgeInsets.fromLTRB(
                          getProportionateScreenWidth(20),
                          getProportionateScreenHeight(70),
                          getProportionateScreenWidth(20),
                          getProportionateScreenHeight(10),
                        ),
                        color: Colors.blue[200],
                        child: FlatButton(
                          onPressed: _showRatingDialog,
                          child: Text(
                            'Feed back',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: getProportionateScreenWidth(18),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    : Container(),
                // Container(
                //   width: getProportionateScreenWidth(400),
                //   margin: EdgeInsets.fromLTRB(
                //     getProportionateScreenWidth(20),
                //     0,
                //     // getProportionateScreenHeight(100),
                //     getProportionateScreenWidth(20),
                //     getProportionateScreenHeight(10),
                //   ),
                //   color: Colors.blue[200],
                //   child: FlatButton(
                //     onPressed: () {
                //       Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //             builder: (context) => CancelServiceScreen()),
                //       );
                //     },
                //     child: Text(
                //       'Cancel Service',
                //       style: TextStyle(
                //         color: Colors.white,
                //         fontSize: getProportionateScreenWidth(18),
                //         fontWeight: FontWeight.bold,
                //       ),
                //     ),
                //   ),
                // ),

                Container(
                  width: getProportionateScreenWidth(400),
                  margin: this.widget.isFromNotifyScreenData
                      ? EdgeInsets.fromLTRB(
                          getProportionateScreenWidth(20),
                          0,
                          getProportionateScreenWidth(20),
                          getProportionateScreenHeight(10),
                        )
                      : EdgeInsets.fromLTRB(
                          getProportionateScreenWidth(20),
                          getProportionateScreenHeight(
                              this.widget.isfeedBack != '' ? 0 : 120),
                          getProportionateScreenWidth(20),
                          getProportionateScreenHeight(10),
                        ),
                  color: Colors.blue[200],
                  child: FlatButton(
                    onPressed: () {
                      GeneralHelper.delayTimeAndCallback(2, () {
                        initMainScreen(context);
                      });
                    },
                    child: Text(
                      'Back to home',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: getProportionateScreenWidth(18),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
