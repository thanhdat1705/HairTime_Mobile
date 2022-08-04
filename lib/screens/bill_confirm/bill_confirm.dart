import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:project_hair_time_mobile/screens/booking_bill/components/stepper.dart';
import 'package:project_hair_time_mobile/screens/booking_bill_step2/booking_bill_step2_screen.dart';
import 'package:project_hair_time_mobile/screens/booking_bill_step3/booking_bill_step3_screen.dart';
import 'package:project_hair_time_mobile/screens/calendar_page/calendar_page.dart';
import 'package:project_hair_time_mobile/screens/discounts_store/discounts_store_screen.dart';
import 'package:project_hair_time_mobile/screens/methods_payment/methods_payment_screen.dart';
import 'package:project_hair_time_mobile/screens/service_detail/service_detail_screen.dart';
import 'package:project_hair_time_mobile/screens/store_detail/detail_screen.dart';
import 'package:project_hair_time_mobile/screens/thanks_you/thanks_you_screen.dart';
import 'package:project_hair_time_mobile/shared/general_helpers/general_helpers.dart';
import 'package:project_hair_time_mobile/shared/shared_variables/contants.dart';
import 'package:project_hair_time_mobile/shared/size/size_config.dart';
import 'package:intl/intl.dart';
import 'package:project_hair_time_mobile/shared_data/service_list.dart';

class BillConfirm extends StatefulWidget {
  // final String total;
  final discountData;
  final methodPayment;
  final String storeName;
  final String address;
  final bool isDiscount;
  final String storeDiscount;
  final String total;

  BillConfirm({
    Key key,
    this.total = "6.0",
    this.discountData,
    this.storeName,
    this.address,
    this.methodPayment,
    this.isDiscount,
    this.storeDiscount = '6.0',
  }) : super(key: key);

  @override
  _BillConfirmState createState() => _BillConfirmState();
}

class _BillConfirmState extends State<BillConfirm> {
  DateTime date = new DateTime.now();
  bool _checked = false;
  ScrollController _scrollController;

  getTitle(String title, String content) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: getProportionateScreenHeight(50),
          width: SizeConfig.screenWidth,
          color: Colors.grey[300],
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[600]),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20),
              vertical: getProportionateScreenHeight(10)),
          child: Text(
            content,
            maxLines: 3,
            style: TextStyle(
                fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
      ],
    );
  }

  stepper(String text, String step, Color colorStep, Color fillColor,
      Color borderColor) {
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          height: getProportionateScreenHeight(30),
          width: getProportionateScreenWidth(27),
          decoration: BoxDecoration(
              color: fillColor,
              border: Border.all(color: borderColor, width: 1),
              borderRadius: BorderRadius.circular(40)),
          child: Text(step, style: TextStyle(color: colorStep)),
        ),
        SizedBox(width: getProportionateScreenWidth(5)),
        Text(text)
      ],
    );
  }

  Widget _getBookingInfo(String servieId) {
    Column bookingInfo = new Column();
    bookingServices.forEach((eachInforService) {
      if (eachInforService['id'] == servieId) {
        bookingInfo = Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20),
                  vertical: getProportionateScreenHeight(5)),
              child: Row(
                children: [
                  Text('Service staff:',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
                  SizedBox(width: getProportionateScreenWidth(10)),
                  Text(eachInforService['barberName'].toString(),
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20),
                  vertical: getProportionateScreenHeight(5)),
              child: Row(
                children: [
                  Text('Time service:',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
                  SizedBox(width: getProportionateScreenWidth(10)),
                  Text(eachInforService['timeInfo'].toString(),
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
                ],
              ),
            ),
          ],
        );
      }
    });
    return bookingInfo;
  }

  @override
  void initState() {
    this._scrollController = new ScrollController(
      initialScrollOffset: 310.0,
      keepScrollOffset: true,
    );

    // double tmpTotal = 0.0;
    // myService.forEach((service) {
    //   if (service['value']['isActive'] == true) {
    //     tmpTotal += double.parse(service['value']['price']) *
    //         double.parse(service['amount']);
    //   }
    // });
    // setState(() {
    //   _total = tmpTotal;
    // });

    super.initState();
  }

  int getUnitService() {
    int tmpCount = 0;
    myService.forEach((service) {
      if (service['value']['isActive'] == true) {
        tmpCount += int.parse(service['amount']);
      }
    });
    return tmpCount;
  }

  List<Widget> listSingleService() {
    List<Widget> listComboServiceData = [];
    myService.forEach((serviceData) {
      if (serviceData["value"]["isActive"] == true) {
        listComboServiceData.add(
          Container(
            // margin: EdgeInsets.symmetric(
            //     vertical: getProportionateScreenHeight(10)),
            padding: EdgeInsets.only(top: 10, bottom: 10),
            decoration: BoxDecoration(
                // borderRadius: BorderRadius.circular(10),
                // borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                border:
                    Border(bottom: BorderSide(color: Colors.grey, width: 0.5))
                // boxShadow: [
                //   BoxShadow(
                //     offset: Offset(0, 0.5),
                //     blurRadius: 4,
                //     color: kShadowColor,
                //   )
                // ],
                ),
            height: getProportionateScreenHeight(80),
            width: SizeConfig.screenWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: getProportionateScreenWidth(30),
                  height: getProportionateScreenWidth(30),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[800], width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Text(
                    serviceData["amount"] + 'x',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: getProportionateScreenHeight(16)),
                    maxLines: 2,
                  ),
                ),
                SizedBox(width: getProportionateScreenWidth(10)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // color: Colors.red,
                      width: SizeConfig.screenWidth * 0.7 - 60,
                      child: Text(
                        serviceData["value"]["name"],
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: getProportionateScreenHeight(16)),
                        maxLines: 2,
                      ),
                    ),
                    serviceData["note"] != ''
                        ? Container(
                            // width: SizeConfig.screenWidth * 0.05,
                            child: Text(
                              serviceData["note"],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: getProportionateScreenHeight(14)),
                              maxLines: 2,
                            ),
                          )
                        : Container(),
                    SizedBox(height: getProportionateScreenHeight(8)),
                    GestureDetector(
                      onTap: () {
                        GeneralHelper.navigateToScreen(
                            context,
                            ServiceDetailScreen(
                              serviceId: serviceData['id'],
                              fromBill: true,
                            ),
                            false);
                        print(getUnitService().toString());
                      },
                      child: Container(
                        // width: SizeConfig.screenWidth * 0.05,
                        child: Text(
                          'Edit',
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: getProportionateScreenHeight(14)),
                          maxLines: 2,
                        ),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "\$" + serviceData["value"]["price"],
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: getProportionateScreenHeight(16),
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                        icon: Icon(
                          Icons.delete_forever_outlined,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          setState(() {
                            var serviceTmp = myService.firstWhere(
                                (eachService) =>
                                    eachService['id'] == serviceData['id']);
                            serviceTmp['amount'] = '';
                            serviceTmp['value']['isActive'] = false;
                            serviceTmp['note'] = '';
                            // customerServiceList.removeAt(index);
                          });
                          print('Delete');
                        }),
                  ],
                ),
              ],
            ),
          ),
        );
      }
    });
    return listComboServiceData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      appBar: AppBar(
        elevation: 10,
        brightness: Brightness.dark,
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                  text: 'Boutique Barber',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  )),
              TextSpan(text: '\n'),
              TextSpan(
                text: 'Distance from you 2.7km',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
        ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Steper(
            steper1: '1',
            contentSteper1: 'Choose Service',
            colorBorderSteper1: Colors.blue,
            colorFillSteper1: Colors.blue,
            steper2: '2',
            contentSteper2: 'Booking',
            colorBorderSteper2: Colors.blue,
            colorFillSteper2: Colors.blue,
            steper3: '3',
            contentSteper3: 'Confirm',
            colorBorderSteper3: Colors.blue,
            colorFillSteper3: Colors.blue,
            steper4: '4',
            contentSteper4: 'Complete',
            colorBorderSteper4: Colors.black,
            colorFillSteper4: Colors.white,
            colorSteper1: Colors.white,
            colorSteper2: Colors.white,
            colorSteper3: Colors.white,
            colorSteper4: Colors.black,
          ),
          Expanded(
            child: SingleChildScrollView(
              // physics: BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // getTitle('Hair Stylist', 'Jane Doe'),
                  // getTitle('Amount of Person',
                  //     this.widget.amountOfPerson.toString()),
                  // getTitle('Date', '04/11/2020'),
                  // getTitle('Appointment', '16:30'),
                  getTitle('Address', '78 Ngo Duc Ke, Q1, TP. HCM'),
                  Container(
                    height: getProportionateScreenHeight(50),
                    width: SizeConfig.screenWidth,
                    color: Colors.grey[300],
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Order Summary',
                          style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[600]),
                        ),
                        // FlatButton(
                        //     padding: EdgeInsets.symmetric(
                        //         vertical: 0, horizontal: 0),
                        //     minWidth: 160,
                        //     height: 30,
                        //     materialTapTargetSize:
                        //         MaterialTapTargetSize.shrinkWrap,
                        //     onPressed: () {
                        //       GeneralHelper.navigateToScreen(
                        //           context,
                        //           CalendarPage(
                        //             servicesId: '6',
                        //             storeName: this.widget.storeName,
                        //             address: this.widget.address,
                        //             discountData: this.widget.discountData,
                        //             methodPayment: this.widget.methodPayment,
                        //           ),
                        //           false);
                        //       print('ahihi');
                        //     },
                        //     // padding: Edge,
                        //     // height: 30,
                        //     // minWidth: 100,
                        //     color: Colors.blue,
                        //     child: Text(
                        //       'Choose time for all',
                        //       style: TextStyle(
                        //           color: Colors.white,
                        //           fontSize: 17,
                        //           fontWeight: FontWeight.bold),
                        //     )),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        left: 10, right: 10, top: 10, bottom: 10),
                    child: Text(
                      'Services Summary',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: getProportionateScreenWidth(17),
                        // fontFamily: 'Playball',
                      ),
                    ),
                  ),
                  // Container(
                  //   // margin: EdgeInsets.only(
                  //   //     left: getProportionateScreenWidth(5)),
                  //   padding: EdgeInsets.only(
                  //       left: 10, right: 10, top: 5, bottom: 10),
                  //   width: getProportionateScreenWidth(400),
                  //   child: RichText(
                  //     text: TextSpan(
                  //       text: '2x\t',
                  //       style: TextStyle(
                  //         color: Colors.blue,
                  //         fontWeight: FontWeight.bold,
                  //         fontSize: getProportionateScreenWidth(17),
                  //       ),
                  //       children: [
                  //         WidgetSpan(
                  //           child: Container(
                  //             margin: EdgeInsets.only(
                  //               left: getProportionateScreenWidth(30),
                  //             ),
                  //             child: Text(
                  //               'Haircut',
                  //               style: TextStyle(
                  //                 color: Colors.black,
                  //                 fontSize: getProportionateScreenWidth(17),
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //         WidgetSpan(
                  //           child: Container(
                  //             margin: EdgeInsets.only(
                  //               left: getProportionateScreenWidth(195),
                  //             ),
                  //             child: Text(
                  //               '\$3.6',
                  //               style: TextStyle(
                  //                 color: Colors.black,
                  //                 fontSize: getProportionateScreenWidth(17),
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),

                  // Container(
                  //   // margin: EdgeInsets.only(
                  //   //     left: getProportionateScreenWidth(5),
                  //   //     top: getProportionateScreenHeight(10)),
                  //   padding: EdgeInsets.only(
                  //       left: 10, right: 10, top: 10, bottom: 10),
                  //   width: getProportionateScreenWidth(400),
                  //   child: RichText(
                  //     text: TextSpan(
                  //       text: '1x\t',
                  //       style: TextStyle(
                  //         color: Colors.blue,
                  //         fontWeight: FontWeight.bold,
                  //         fontSize: getProportionateScreenWidth(17),
                  //       ),
                  //       children: [
                  //         WidgetSpan(
                  //           child: Container(
                  //             margin: EdgeInsets.only(
                  //               left: getProportionateScreenWidth(30),
                  //             ),
                  //             child: Text(
                  //               'Facial',
                  //               style: TextStyle(
                  //                 color: Colors.black,
                  //                 fontSize: getProportionateScreenWidth(17),
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //         WidgetSpan(
                  //           child: Container(
                  //             margin: EdgeInsets.only(
                  //               left: getProportionateScreenWidth(205),
                  //             ),
                  //             child: Text(
                  //               '\$4.8',
                  //               style: TextStyle(
                  //                 color: Colors.black,
                  //                 fontSize: getProportionateScreenWidth(17),
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                 
                  Container(
                    padding: EdgeInsets.only(
                        left: 10, right: 10, top: 10, bottom: 10),
                    child: Row(
                      children: [
                        Text(
                          '2x',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: getProportionateScreenWidth(17),
                          ),
                        ),
                        SizedBox(width: getProportionateScreenWidth(20)),
                        Text(
                          'Beard Design',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: getProportionateScreenWidth(17),
                          ),
                        ),
                        Spacer(),
                        Text(
                          '\$3.0',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: getProportionateScreenWidth(17),
                          ),
                        ),
                        SizedBox(width: getProportionateScreenWidth(20)),
                      ],
                    ),
                  ),

                  // Container(
                  //   // margin: EdgeInsets.only(
                  //   //     left: getProportionateScreenWidth(5),
                  //   //     top: getProportionateScreenHeight(10)),
                  //   padding: EdgeInsets.only(
                  //       left: 10, right: 10, top: 10, bottom: 10),
                  //   width: getProportionateScreenWidth(400),
                  //   child: RichText(
                  //     text: TextSpan(
                  //       text: '1x\t',
                  //       style: TextStyle(
                  //         color: Colors.blue,
                  //         fontWeight: FontWeight.bold,
                  //         fontSize: getProportionateScreenWidth(14),
                  //       ),
                  //       children: [
                  //         WidgetSpan(
                  //           child: Container(
                  //             margin: EdgeInsets.only(
                  //               left: getProportionateScreenWidth(30),
                  //             ),
                  //             child: Text(
                  //               'Beard Design',
                  //               style: TextStyle(
                  //                 color: Colors.black,
                  //                 fontSize: getProportionateScreenWidth(14),
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //         WidgetSpan(
                  //           child: Container(
                  //             margin: EdgeInsets.only(
                  //               left: getProportionateScreenWidth(180),
                  //             ),
                  //             child: Text(
                  //               '\$3.0',
                  //               style: TextStyle(
                  //                 color: Colors.black,
                  //                 fontSize: getProportionateScreenWidth(14),
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  Container(
                    margin: EdgeInsets.only(
                        left: getProportionateScreenWidth(10),
                        top: getProportionateScreenHeight(10)),
                    width: getProportionateScreenWidth(400),
                    child: Text(
                      'Number of seat: 2',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: getProportionateScreenWidth(18),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: getProportionateScreenWidth(10),
                        top: getProportionateScreenHeight(10)),
                    width: getProportionateScreenWidth(400),
                    child: RichText(
                      text: TextSpan(
                        text: 'Coming time     :\t',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: getProportionateScreenWidth(18),
                        ),
                        children: [
                          WidgetSpan(
                            child: Container(
                              // margin: EdgeInsets.only(
                              //   left: getProportionateScreenWidth(30),
                              // ),
                              child: Text(
                                '16:30 Sat 13 Nov 2020',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: getProportionateScreenWidth(15),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Container(
                  //   alignment: Alignment.center,
                  //   color: Colors.white,
                  //   padding: EdgeInsets.only(top: 10, left: 15, right: 15),
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.start,
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: this.listSingleService(),
                  //   ),
                  // ),
                  // Container(
                  //   // color: Colors.red,
                  //   padding: EdgeInsets.symmetric(
                  //       horizontal: getProportionateScreenWidth(20),
                  //       vertical: getProportionateScreenHeight(10)),
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.start,
                  //     children: [
                  //       Container(
                  //         // color: Colors.yellow,
                  //         padding: EdgeInsets.all(0),
                  //         child: Row(
                  //           children: [
                  //             Text('Nguyen Thanh Dat',
                  //                 style: TextStyle(
                  //                     fontSize: 18,
                  //                     fontWeight: FontWeight.bold)),
                  //             Spacer(),
                  //             FlatButton(
                  //                 padding: EdgeInsets.symmetric(
                  //                     vertical: 0, horizontal: 0),
                  //                 minWidth: 100,
                  //                 height: 25,
                  //                 materialTapTargetSize:
                  //                     MaterialTapTargetSize.shrinkWrap,
                  //                 onPressed: () {
                  //                   GeneralHelper.navigateToScreen(
                  //                       context,
                  //                       CalendarPage(
                  //                         servicesId: '4',
                  //                         storeName: this.widget.storeName,
                  //                         address: this.widget.address,
                  //                         discountData:
                  //                             this.widget.discountData,
                  //                         methodPayment:
                  //                             this.widget.methodPayment,
                  //                       ),
                  //                       false);
                  //                   print('ahihi');
                  //                 },
                  //                 // padding: Edge,
                  //                 // height: 30,
                  //                 // minWidth: 100,
                  //                 color: Colors.blue,
                  //                 child: Text(
                  //                   'Choose time',
                  //                   style: TextStyle(
                  //                       color: Colors.white,
                  //                       fontSize: 15,
                  //                       fontWeight: FontWeight.bold),
                  //                 )),
                  //           ],
                  //         ),
                  //       ),
                  //       SizedBox(height: getProportionateScreenHeight(10)),
                  //       Container(
                  //         padding: EdgeInsets.symmetric(
                  //             horizontal: getProportionateScreenWidth(20)),
                  //         child: Column(
                  //           children: [
                  //             Row(
                  //               children: [
                  //                 Text('Haircut',
                  //                     style: TextStyle(
                  //                         fontSize: 16,
                  //                         fontWeight: FontWeight.w400)),
                  //                 SizedBox(
                  //                     width: getProportionateScreenWidth(10)),
                  //                 FlatButton(
                  //                     padding: EdgeInsets.symmetric(
                  //                         vertical: 0, horizontal: 0),
                  //                     minWidth: 100,
                  //                     height: 25,
                  //                     materialTapTargetSize:
                  //                         MaterialTapTargetSize.shrinkWrap,
                  //                     onPressed: () {
                  //                       //id 1
                  //                       GeneralHelper.navigateToScreen(
                  //                           context,
                  //                           CalendarPage(
                  //                             servicesId: '1',
                  //                             storeName: this.widget.storeName,
                  //                             address: this.widget.address,
                  //                             discountData:
                  //                                 this.widget.discountData,
                  //                             methodPayment:
                  //                                 this.widget.methodPayment,
                  //                           ),
                  //                           false);
                  //                       print('ahihi');
                  //                     },
                  //                     color: Colors.blue,
                  //                     child: Text(
                  //                       'Choose time',
                  //                       style: TextStyle(
                  //                           color: Colors.white,
                  //                           fontSize: 15,
                  //                           fontWeight: FontWeight.bold),
                  //                     )),
                  //                 Spacer(),
                  //                 Text('\$3.5',
                  //                     style: TextStyle(
                  //                         fontSize: 16,
                  //                         fontWeight: FontWeight.w400)),
                  //               ],
                  //             ),
                  //             _getBookingInfo('1'),
                  //           ],
                  //         ),
                  //       ),
                  //       Container(
                  //         padding: EdgeInsets.symmetric(
                  //             horizontal: getProportionateScreenWidth(20)),
                  //         child: Column(
                  //           children: [
                  //             Row(
                  //               children: [
                  //                 Text('Facial',
                  //                     style: TextStyle(
                  //                         fontSize: 16,
                  //                         fontWeight: FontWeight.w400)),
                  //                 SizedBox(
                  //                     width: getProportionateScreenWidth(10)),
                  //                 FlatButton(
                  //                     padding: EdgeInsets.symmetric(
                  //                         vertical: 0, horizontal: 0),
                  //                     minWidth: 100,
                  //                     height: 25,
                  //                     materialTapTargetSize:
                  //                         MaterialTapTargetSize.shrinkWrap,
                  //                     onPressed: () {
                  //                       //id 2
                  //                       print('id 2');
                  //                       GeneralHelper.navigateToScreen(
                  //                           context,
                  //                           CalendarPage(
                  //                             servicesId: '2',
                  //                             storeName: this.widget.storeName,
                  //                             address: this.widget.address,
                  //                             discountData:
                  //                                 this.widget.discountData,
                  //                             methodPayment:
                  //                                 this.widget.methodPayment,
                  //                           ),
                  //                           false);
                  //                     },
                  //                     color: Colors.blue,
                  //                     child: Text(
                  //                       'Choose time',
                  //                       style: TextStyle(
                  //                           color: Colors.white,
                  //                           fontSize: 15,
                  //                           fontWeight: FontWeight.bold),
                  //                     )),
                  //                 Spacer(),
                  //                 Text('\$2.7',
                  //                     style: TextStyle(
                  //                         fontSize: 16,
                  //                         fontWeight: FontWeight.w400)),
                  //               ],
                  //             ),
                  //             _getBookingInfo('2'),
                  //           ],
                  //         ),
                  //       )
                  //     ],
                  //   ),
                  // ),
                  // LinePadding(),
                  // Container(
                  //   // color: Colors.red,
                  //   padding: EdgeInsets.symmetric(
                  //       horizontal: getProportionateScreenWidth(20),
                  //       vertical: getProportionateScreenHeight(10)),
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.start,
                  //     children: [
                  //       Container(
                  //         // color: Colors.yellow,
                  //         padding: EdgeInsets.all(0),
                  //         child: Row(
                  //           children: [
                  //             Text('Dang Hoang Son',
                  //                 style: TextStyle(
                  //                     fontSize: 18,
                  //                     fontWeight: FontWeight.bold)),
                  //             Spacer(),
                  //             FlatButton(
                  //                 padding: EdgeInsets.symmetric(
                  //                     vertical: 0, horizontal: 0),
                  //                 minWidth: 100,
                  //                 height: 25,
                  //                 materialTapTargetSize:
                  //                     MaterialTapTargetSize.shrinkWrap,
                  //                 onPressed: () {
                  //                   print('ahihi');
                  //                   GeneralHelper.navigateToScreen(
                  //                       context,
                  //                       CalendarPage(
                  //                         servicesId: '5',
                  //                         storeName: this.widget.storeName,
                  //                         address: this.widget.address,
                  //                         discountData:
                  //                             this.widget.discountData,
                  //                         methodPayment:
                  //                             this.widget.methodPayment,
                  //                       ),
                  //                       false);
                  //                 },
                  //                 // padding: Edge,
                  //                 // height: 30,
                  //                 // minWidth: 100,
                  //                 color: Colors.blue,
                  //                 child: Text(
                  //                   'Choose time',
                  //                   style: TextStyle(
                  //                       color: Colors.white,
                  //                       fontSize: 15,
                  //                       fontWeight: FontWeight.bold),
                  //                 )),
                  //           ],
                  //         ),
                  //       ),
                  //       SizedBox(height: getProportionateScreenHeight(10)),
                  //       Container(
                  //         padding: EdgeInsets.symmetric(
                  //             horizontal: getProportionateScreenWidth(20)),
                  //         child: Column(
                  //           children: [
                  //             Row(
                  //               children: [
                  //                 Text('Haircut',
                  //                     style: TextStyle(
                  //                         fontSize: 16,
                  //                         fontWeight: FontWeight.w400)),
                  //                 SizedBox(
                  //                     width: getProportionateScreenWidth(10)),
                  //                 FlatButton(
                  //                     padding: EdgeInsets.symmetric(
                  //                         vertical: 0, horizontal: 0),
                  //                     minWidth: 100,
                  //                     height: 25,
                  //                     materialTapTargetSize:
                  //                         MaterialTapTargetSize.shrinkWrap,
                  //                     onPressed: () {
                  //                       //id 3
                  //                       print('ahihi');
                  //                       GeneralHelper.navigateToScreen(
                  //                           context,
                  //                           CalendarPage(
                  //                             servicesId: '3',
                  //                             storeName: this.widget.storeName,
                  //                             address: this.widget.address,
                  //                             discountData:
                  //                                 this.widget.discountData,
                  //                             methodPayment:
                  //                                 this.widget.methodPayment,
                  //                           ),
                  //                           false);
                  //                     },
                  //                     color: Colors.blue,
                  //                     child: Text(
                  //                       'Choose time',
                  //                       style: TextStyle(
                  //                           color: Colors.white,
                  //                           fontSize: 15,
                  //                           fontWeight: FontWeight.bold),
                  //                     )),
                  //                 Spacer(),
                  //                 Text('\$3.5',
                  //                     style: TextStyle(
                  //                         fontSize: 16,
                  //                         fontWeight: FontWeight.w400)),
                  //               ],
                  //             ),
                  //             _getBookingInfo('3'),
                  //           ],
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),

                  // SizedBox(height: getProportionateScreenHeight(15)),
                  // Container(
                  //   padding: EdgeInsets.symmetric(
                  //       horizontal: getProportionateScreenWidth(20)),
                  //   child: Column(
                  //     children: [
                  //       Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         children: [
                  //           Text(
                  //             'Subtoal',
                  //             style: TextStyle(
                  //                 fontSize: 17,
                  //                 fontWeight: FontWeight.w400,
                  //                 color: Colors.black),
                  //           ),
                  //           Text('\$40.0',
                  //               style: TextStyle(
                  //                   fontSize: 17,
                  //                   fontWeight: FontWeight.w400,
                  //                   color: Colors.black)),
                  //         ],
                  //       ),
                  //       // Row(
                  //       //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       //   children: [
                  //       //     Text('Applicable Fees',
                  //       //         style: TextStyle(
                  //       //             fontSize: 17,
                  //       //             fontWeight: FontWeight.w400,
                  //       //             color: Colors.black)),
                  //       //     Text('\$2',
                  //       //         style: TextStyle(
                  //       //             fontSize: 17,
                  //       //             fontWeight: FontWeight.w400,
                  //       //             color: Colors.black)),
                  //       //   ],
                  //       // ),
                  //       SizedBox(height: getProportionateScreenHeight(15)),
                  //       Container(
                  //         alignment: Alignment.centerLeft,
                  //         child: RichText(
                  //           maxLines: 2,
                  //           textAlign: TextAlign.end,
                  //           text: TextSpan(
                  //             style: TextStyle(color: Colors.black),
                  //             children: [
                  //               TextSpan(
                  //                 text: "You\'ve got a ",
                  //                 style: TextStyle(
                  //                     fontWeight: FontWeight.w400,
                  //                     color: Colors.green,
                  //                     fontSize: 15),
                  //               ),
                  //               TextSpan(
                  //                 text: "free Beard Trim",
                  //                 style: TextStyle(
                  //                     color: Colors.green,
                  //                     fontSize: 17,
                  //                     fontWeight: FontWeight.w600),
                  //               ),
                  //               TextSpan(
                  //                 text: "!",
                  //                 style: TextStyle(
                  //                     color: Colors.green,
                  //                     decoration: TextDecoration.lineThrough,
                  //                     fontSize: 15),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  SizedBox(height: getProportionateScreenHeight(15)),
                  Container(
                    height: getProportionateScreenHeight(50),
                    width: SizeConfig.screenWidth,
                    color: Colors.grey[300],
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Payment details",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // color: Colors.red,
                    width: SizeConfig.screenWidth,
                    // height: 10,
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(20),
                        vertical: getProportionateScreenHeight(20)),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: GestureDetector(
                            onTap: () {
                              GeneralHelper.navigateToScreen(
                                  context,
                                  new MethodsPaymentScreen(
                                    methodPayment: this.widget.methodPayment,
                                    discountData: this.widget.discountData,
                                    total: '6.0',
                                    isDiscounted: false,
                                    storeName: this.widget.storeName,
                                    address: this.widget.address,
                                  ),
                                  true);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: getProportionateScreenHeight(5)),
                              decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(
                                          color: Colors.grey[600],
                                          width: 0.5))),
                              child: Row(
                                children: [
                                  Image.network(
                                      this
                                          .widget
                                          .methodPayment['imageMethodPayment'],
                                      width: getProportionateScreenWidth(20)),
                                  SizedBox(
                                      width: getProportionateScreenWidth(5)),
                                  Text(
                                    this.widget.methodPayment['description'],
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: GestureDetector(
                            onTap: () {
                              GeneralHelper.navigateToScreen(
                                  context,
                                  new DiscountsStoreScreen(
                                    discountData: this.widget.discountData,
                                    methodPayment: this.widget.methodPayment,
                                    total: '6.0',
                                    isDiscounted: false,
                                    storeName: this.widget.storeName,
                                    address: this.widget.address,
                                  ),
                                  true);
                            },
                            child: Container(
                              // color: Colors.yellow,
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(
                                  vertical: getProportionateScreenHeight(5)),
                              child: this.widget.discountData != null
                                  ? Text(
                                      "- \$" +
                                          this
                                              .widget
                                              .discountData["discount"]
                                              .toString(),
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    )
                                  : Text(
                                      'Discount',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400),
                                    ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  // LinePadding(),
                  // Container(
                  //   height: getProportionateScreenHeight(10),
                  //   width: SizeConfig.screenWidth,
                  //   color: Colors.white,
                  // ),
                ],
              ),
            ),
          ),
          Container(
            height: SizeConfig.screenHeight * 0.2 - 10,
            width: SizeConfig.screenWidth,
            decoration: BoxDecoration(
              border: Border.all(width: 0.3, color: Colors.blue),
              color: Colors.white,
              borderRadius: BorderRadius.circular(2.0),
            ),
            child: Center(
              child: Container(
                // color: Colors.red,
                height: SizeConfig.screenHeight * 0.2 - 20,
                margin: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(15)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: getProportionateScreenHeight(10)),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(15)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total',
                            style: TextStyle(fontSize: 20, color: Colors.blue),
                          ),
                          RichText(
                            maxLines: 2,
                            textAlign: TextAlign.end,
                            text: TextSpan(
                              style: TextStyle(color: Colors.black),
                              children: [
                                this.widget.discountData != null
                                    ? TextSpan(
                                        text: "\$" +
                                            (double.parse(this
                                                        .widget
                                                        .total
                                                        .toString()) -
                                                    double.parse(this
                                                            .widget
                                                            .discountData[
                                                        "discount"]))
                                                .toString() +
                                            "\n",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue,
                                            fontSize: 20),
                                      )
                                    : TextSpan(
                                        text: "\$" + '6.0' + "\n",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue,
                                            fontSize: 20),
                                      ),
                                TextSpan(
                                  text: this.widget.discountData != null
                                      ? "6.0"
                                      : "",
                                  style: TextStyle(
                                    color: kLightBlackColor,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(20)),
                    // Container(
                    //   alignment: Alignment.center,
                    //   height: getProportionateScreenHeight(40),
                    //   decoration: BoxDecoration(
                    //     border: Border.all(
                    //       width: 1.0,
                    //       color: Colors.blue,
                    //     ),
                    //     color: Colors.white,
                    //     borderRadius: BorderRadius.circular(7.0),
                    //   ),
                    //   child: Text(
                    //     'Confirm',
                    //     style: TextStyle(
                    //       fontSize: 20,
                    //       color: Colors.blue,
                    //       fontWeight: FontWeight.bold,
                    //     ),
                    //   ),
                    // ),
                    Row(
                      children: [
                        Container(
                          width: getProportionateScreenWidth(18),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              Navigator.pop(context);
                            });
                          },
                          child: Container(
                            height: getProportionateScreenHeight(50),
                            width: getProportionateScreenWidth(100),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.blue,
                                width: 1.0,
                              ),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(2.0),
                            ),
                            child: Center(
                              child: Text(
                                'Back',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: getProportionateScreenWidth(120),
                        ),
                        InkWell(
                          onTap: () {
                            // GeneralHelper.navigateToScreen(
                            //     context,
                            //     CalendarPage(
                            //       servicesId: '5',
                            //       amount: '3',
                            //     ),
                            //     false);

                            GeneralHelper.navigateToScreen(
                                context, ThanksYouScreen(), false);
                          },
                          child: Container(
                            height: getProportionateScreenHeight(50),
                            width: getProportionateScreenWidth(100),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: Colors.blue,
                              ),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(2.0),
                            ),
                            child: Center(
                              child: Text(
                                'Confirm',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class LinePadding extends StatelessWidget {
  const LinePadding({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        width: double.infinity,
        child: Container(height: 2, color: Colors.grey),
      ),
    );
  }
}
