import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_hair_time_mobile/screens/booking_bill/components/stepper.dart';
import 'package:project_hair_time_mobile/screens/booking_bill_step3/booking_bill_step3_screen.dart';
import 'package:project_hair_time_mobile/screens/discounts_store/discounts_store_screen.dart';
import 'package:project_hair_time_mobile/screens/methods_payment/methods_payment_screen.dart';
import 'package:project_hair_time_mobile/screens/thanks_you/thanks_you_screen.dart';
import 'package:project_hair_time_mobile/shared/general_helpers/general_helpers.dart';
import 'package:project_hair_time_mobile/shared/shared_variables/contants.dart';
import 'package:project_hair_time_mobile/shared/size/size_config.dart';
import 'package:intl/intl.dart';

class BookingBillStep2Screen extends StatefulWidget {
  final methodPayment;
  final discountData;
  final String storeDiscount;
  final String total;
  final bool isDiscount;
  final String storeName;
  final String address;

  BookingBillStep2Screen({
    Key key,
    this.total,
    this.discountData,
    this.storeName,
    this.address,
    this.methodPayment, this.storeDiscount, this.isDiscount,
  }) : super(key: key);

  @override
  _BookingBillStep2ScreenState createState() => _BookingBillStep2ScreenState();
}

class _BookingBillStep2ScreenState extends State<BookingBillStep2Screen> {
  DateTime date = new DateTime.now();
  TextEditingController _number = new TextEditingController();
  text(String text) {
    return Text(text,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15));
  }

  paddingText(String text) {
    return Padding(
        padding: EdgeInsets.only(left: 15),
        child: Text(text,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 15)));
  }

  Container serviceCard(
      String name, String price, bool check, String discount) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey, width: 0.5))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: getProportionateScreenHeight(10),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              RichText(
                maxLines: 2,
                textAlign: TextAlign.end,
                text: TextSpan(
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: price + "\n",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 15),
                    ),
                    TextSpan(
                      text: discount,
                      style: TextStyle(
                          color: kLightBlackColor,
                          decoration: TextDecoration.lineThrough,
                          fontSize: 15),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: getProportionateScreenHeight(5),
          ),
          // check
          //     ? GestureDetector(
          //         onTap: () {
          //           print('Edit');
          //         },
          //         child: Text('Edit',
          //             style: TextStyle(
          //                 fontSize: 14,
          //                 fontWeight: FontWeight.bold,
          //                 color: Colors.blue[600])),
          //       )
          //     : Container(),
          // SizedBox(
          //   height: getProportionateScreenHeight(10),
          // )
        ],
      ),
    );
  }

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

  @override
  void initState() {
    super.initState();
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
                  text: this.widget.storeName,
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
              physics: BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // getTitle('Hair Stylist', 'Jane Doe'),
                  // getTitle('Amount of Person',
                  //     this.widget.amountOfPerson.toString()),
                  // getTitle('Date', '04/11/2020'),
                  // getTitle('Appointment', '16:30'),
                  getTitle('Address', this.widget.address),
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
                          'Information',
                          style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          // color: Colors.red,
                          alignment: Alignment.centerLeft,
                          height: 50,
                          width: getProportionateScreenWidth(120),
                          child: Text('Username',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Spacer(),
                        Container(
                          // color: Colors.yellow,
                          width: SizeConfig.screenWidth * 0.5 - 10,
                          child: TextField(
                            controller: _number,
                            style: TextStyle(
                             
                                color: Colors.blue,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Enter amount of person',
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                   Padding(
                    padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          // color: Colors.red,
                          alignment: Alignment.centerLeft,
                          height: 50,
                          width: getProportionateScreenWidth(120),
                          child: Text('Phone',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Spacer(),
                        Container(
                          // color: Colors.yellow,
                          width: SizeConfig.screenWidth * 0.5 - 10,
                          child: TextField(
                            controller: _number,
                            style: TextStyle(
                             
                                color: Colors.blue,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Enter your phone number',
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

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
                      ],
                    ),
                  ),
                  // serviceCard('Short Cut', '\$5.0', true, null),
                  // serviceCard('Beard Trim', '\$5.0', true, null),
                  // serviceCard('Oil Massage', '\$10.0', true, null),
                  // serviceCard('Vurve Director Cut', '\$10.0', true, null),
                  // serviceCard('Beard Design', '\$5.0', true, null),
                  // serviceCard('Sampo and Dry off', '\$10.0', true, null),
                  // serviceCard('Beard Trim', '\$0.0', false, '\$5'),
                  Row(
                    children: [
                      Container(
                        // color: Colors.grey[200],
                        width: getProportionateScreenWidth(150),
                        // padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                padding: EdgeInsets.only(top: 15, left: 15),
                                child: Text(
                                  'Service',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                )),
                            LinePadding(),
                            paddingText("Short Cut"),
                            LinePadding(),
                            paddingText("Beard Trim"),
                            LinePadding(),
                            paddingText("Oil Massage"),
                            LinePadding(),
                            paddingText("Hair dye"),
                            LinePadding(),
                            Container(
                                padding: EdgeInsets.only(left: 15),
                                child: Text(
                                  'Total',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                )),
                          ],
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          // physics: BouncingScrollPhysics(),
                          child: Row(
                            children: [
                              Container(
                                width: 100,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                        padding: EdgeInsets.only(top: 15),
                                        child: Text(
                                          'Price',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        )),
                                    LinePadding(),
                                    Container(child: text('\$5')),
                                    LinePadding(),
                                    Container(child: text('\$2')),
                                    LinePadding(),
                                    Container(child: text('\$8')),
                                    LinePadding(),
                                    Container(child: text('\$5')),
                                    LinePadding(),
                                    Container(
                                        padding: EdgeInsets.only(left: 15),
                                        child: Text(
                                          '\$20',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        )),
                                  ],
                                ),
                              ),
                              Container(
                                width: 200,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                        padding: EdgeInsets.only(top: 15),
                                        child: Text(
                                          'Time',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        )),
                                    LinePadding(),
                                    Container(
                                        child: text(
                                            DateFormat('kk:mm EEE d MMM y')
                                                .format(date))),
                                    LinePadding(),
                                    Container(
                                        child: text(
                                            DateFormat('kk:mm EEE d MMM y')
                                                .format(date))),
                                    LinePadding(),
                                    Container(
                                        child: text(
                                            DateFormat('kk:mm EEE d MMM y')
                                                .format(date))),
                                    LinePadding(),
                                    Container(
                                        child: text(
                                            DateFormat('kk:mm EEE d MMM y')
                                                .format(date))),
                                    LinePadding(),
                                    Container(
                                        padding: EdgeInsets.only(left: 15),
                                        child: Text(
                                          '',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        )),
                                  ],
                                ),
                              ),
                              Container(
                                width: 100,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                        padding: EdgeInsets.only(top: 15),
                                        child: Text(
                                          'Server',
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold),
                                        )),
                                    LinePadding(),
                                    Container(child: text("ahihi")),
                                    LinePadding(),
                                    Container(child: text("ahuhu")),
                                    LinePadding(),
                                    Container(child: text("ahehe")),
                                    LinePadding(),
                                    Container(child: text("ahoho")),
                                    LinePadding(),
                                    Container(
                                        padding: EdgeInsets.only(left: 15),
                                        child: Text(
                                          '',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  LinePadding(),

                  SizedBox(height: getProportionateScreenHeight(15)),
                  Container(
                    height: getProportionateScreenHeight(100),
                    width: SizeConfig.screenWidth,
                    color: Colors.grey[300],
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: SizeConfig.screenHeight * 0.1,
            width: SizeConfig.screenWidth,
            decoration: BoxDecoration(
              border: Border.all(width: 0.3, color: Colors.blue),
              color: Colors.white,
              borderRadius: BorderRadius.circular(2.0),
            ),
            child: Center(
              child: Container(
                // color: Colors.white,
                height: SizeConfig.screenHeight * 0.08,
                margin: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(15)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: getProportionateScreenHeight(10)),
                    // Container(
                    //   margin: EdgeInsets.symmetric(
                    //       horizontal: getProportionateScreenWidth(15)),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       Text(
                    //         'Total',
                    //         style: TextStyle(fontSize: 20, color: Colors.blue),
                    //       ),
                    //       RichText(
                    //         maxLines: 2,
                    //         textAlign: TextAlign.end,
                    //         text: TextSpan(
                    //           style: TextStyle(color: Colors.black),
                    //           children: [
                    //             this.widget.discountData != null
                    //                 ? TextSpan(
                    //                     text: "\$" +
                    //                         (double.parse(this.widget.total) -
                    //                                 double.parse(this
                    //                                         .widget
                    //                                         .discountData[
                    //                                     "discount"]))
                    //                             .toString() +
                    //                         "\n",
                    //                     style: TextStyle(
                    //                         fontWeight: FontWeight.bold,
                    //                         color: Colors.blue,
                    //                         fontSize: 20),
                    //                   )
                    //                 : TextSpan(
                    //                     text: "\$45.0\n",
                    //                     style: TextStyle(
                    //                         fontWeight: FontWeight.bold,
                    //                         color: Colors.blue,
                    //                         fontSize: 20),
                    //                   ),
                    //             TextSpan(
                    //               text: "\$44.0",
                    //               style: TextStyle(
                    //                 color: kLightBlackColor,
                    //                 decoration: TextDecoration.lineThrough,
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // SizedBox(height: getProportionateScreenHeight(20)),
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
                            GeneralHelper.navigateToScreen(
                                context, BookingBillStep3Screen(
                                  storeName: this.widget.storeName,
                                  address: this.widget.address,
                                  methodPayment: this.widget.methodPayment,
                                ), false);
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
                                'Continue',
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
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: SizedBox(
        width: double.infinity,
        child: Container(height: 2, color: Colors.grey),
      ),
    );
  }
}
