import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_hair_time_mobile/screens/booking_bill/components/stepper.dart';
import 'package:project_hair_time_mobile/screens/calendar_page/calendar_page.dart';
import 'package:project_hair_time_mobile/screens/discounts_store/discounts_store_screen.dart';
import 'package:project_hair_time_mobile/screens/methods_payment/methods_payment_screen.dart';
import 'package:project_hair_time_mobile/screens/store_detail/detail_screen.dart';
import 'package:project_hair_time_mobile/screens/thanks_you/thanks_you_screen.dart';
import 'package:project_hair_time_mobile/shared/general_helpers/general_helpers.dart';
import 'package:project_hair_time_mobile/shared/shared_variables/contants.dart';
import 'package:project_hair_time_mobile/shared/size/size_config.dart';
import 'package:intl/intl.dart';

class BookingBillStep3Screen extends StatefulWidget {
  final methodPayment;
  final discountData;
  final String storeDiscount;
  final String total;
  final bool isDiscount;
  final String storeName;
  final String address;

  BookingBillStep3Screen({
    Key key,
    this.total = '9.7',
    this.discountData,
    this.storeName,
    this.address,
    this.methodPayment,
    this.storeDiscount,
    this.isDiscount,
  }) : super(key: key);

  @override
  _BookingBillStep3ScreenState createState() => _BookingBillStep3ScreenState();
}

class _BookingBillStep3ScreenState extends State<BookingBillStep3Screen> {
  DateTime date = new DateTime.now();
  TextEditingController _number = new TextEditingController();
  ScrollController _scrollController;
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
    this._scrollController = new ScrollController(
      initialScrollOffset: 310.0,
      keepScrollOffset: true,
    );
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
                          'Order Summary',
                          style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // color: Colors.red,
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(20),
                        vertical: getProportionateScreenHeight(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          // color: Colors.yellow,
                          padding: EdgeInsets.all(0),
                          child: Row(
                            children: [
                              Text('Nguyen Thanh Dat',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                              Spacer(),
                            ],
                          ),
                        ),
                        SizedBox(height: getProportionateScreenHeight(10)),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: getProportionateScreenWidth(20)),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text('Haircut',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400)),
                                  SizedBox(
                                      width: getProportionateScreenWidth(10)),
                                  Spacer(),
                                  Text('\$3.5',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400)),
                                ],
                              ),
                              _getBookingInfo('1'),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: getProportionateScreenWidth(20)),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text('Facial',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400)),
                                  SizedBox(
                                      width: getProportionateScreenWidth(10)),
                                  Spacer(),
                                  Text('\$2.7',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400)),
                                ],
                              ),
                              _getBookingInfo('2'),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  LinePadding(),
                  Container(
                    // color: Colors.red,
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(20),
                        vertical: getProportionateScreenHeight(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          // color: Colors.yellow,
                          padding: EdgeInsets.all(0),
                          child: Row(
                            children: [
                              Text('Dang Hoang Son',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                              Spacer(),
                            ],
                          ),
                        ),
                        SizedBox(height: getProportionateScreenHeight(10)),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: getProportionateScreenWidth(20)),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text('Haircut',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400)),
                                  SizedBox(
                                      width: getProportionateScreenWidth(10)),
                                  Spacer(),
                                  Text('\$3.5',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400)),
                                ],
                              ),
                              _getBookingInfo('3'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  LinePadding(),
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
                                    total: this.widget.total,
                                    isDiscounted: false,
                                    storeName: this.widget.storeName,
                                    address: this.widget.address,
                                  ),
                                  false);
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
                                    total: this.widget.total,
                                    isDiscounted: false,
                                    storeName: this.widget.storeName,
                                    address: this.widget.address,
                                  ),
                                  false);
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
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  Container(
                    height: getProportionateScreenHeight(0),
                    width: SizeConfig.screenWidth,
                    color: Colors.grey[300],
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: SizeConfig.screenHeight * 0.2,
            width: SizeConfig.screenWidth,
            decoration: BoxDecoration(
              border: Border.all(width: 0.3, color: Colors.blue),
              // color: Colors.yellow,
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
                                            (double.parse(this.widget.total) -
                                                    double.parse(this
                                                            .widget
                                                            .discountData[
                                                        "discount"]))
                                                .toStringAsFixed(3) +
                                            "\n",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue,
                                            fontSize: 20),
                                      )
                                    : TextSpan(
                                        text: "\$9.7\n",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue,
                                            fontSize: 20),
                                      ),
                                this.widget.discountData != null
                                    ? TextSpan(
                                        text: "\$9.7",
                                        style: TextStyle(
                                          color: kLightBlackColor,
                                          decoration:
                                              TextDecoration.lineThrough,
                                        ),
                                      )
                                    : TextSpan(
                                        text: "",
                                        style: TextStyle(
                                          color: kLightBlackColor,
                                          decoration:
                                              TextDecoration.lineThrough,
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
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: SizedBox(
        width: double.infinity,
        child: Container(height: 2, color: Colors.grey),
      ),
    );
  }
}
