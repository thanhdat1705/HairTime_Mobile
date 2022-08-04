import 'dart:async';

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:project_hair_time_mobile/screens/bill_confirm/bill_confirm.dart';
import 'package:project_hair_time_mobile/screens/booking/data/data.dart';
import 'package:project_hair_time_mobile/screens/booking_bill/booking_bill_screen.dart';
import 'package:project_hair_time_mobile/screens/booking_bill/components/stepper.dart';
import 'package:project_hair_time_mobile/screens/calendar_page/data/data.dart';
import 'package:project_hair_time_mobile/screens/methods_payment/data/methods_payment_data.dart';
import 'package:project_hair_time_mobile/screens/service_detail/service_detail_screen.dart';
import 'package:project_hair_time_mobile/screens/store_detail/detail_screen.dart';
import 'package:project_hair_time_mobile/shared/general_helpers/general_helpers.dart';
import 'package:project_hair_time_mobile/shared/shared_variables/contants.dart';
import 'package:project_hair_time_mobile/shared/size/size_config.dart';
import 'package:project_hair_time_mobile/shared_data/hot_combo_service_list.dart';
import 'package:project_hair_time_mobile/shared_data/service_list.dart';

class CalendarPage extends StatefulWidget {
  final String serviceId;
  final TabController tabController;
  final discountData;
  final bool fromBill;
  final bool isComboFromMain;
  final String servicesId;
  final methodPayment;
  final String storeName;
  final String address;
  final String amount;
  final bool isDiscount;

  CalendarPage(
      {Key key,
      this.servicesId,
      this.storeName,
      this.address,
      this.discountData,
      this.methodPayment,
      this.amount,
      this.isDiscount,
      this.serviceId,
      this.tabController,
      this.fromBill,
      this.isComboFromMain})
      : super(key: key);
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  final customerFiledController = TextEditingController();
  final phoneFiledController = TextEditingController();
  String customer, phone = '';
  int numberSelected = 6;
  String tmpValue = '15h00';
  String barberName = '';
  bool defaulChoosen = true;
  bool tmpChoosen = false;
  bool mon = false;
  bool tue = false;
  bool wed = false;
  bool thu = false;
  bool fri = true;
  bool sat = false;
  bool sun = false;
  bool seven = false;
  bool eight = false;
  bool nine = false;
  bool ten = false;
  bool eleven = false;
  bool twelve = false;
  bool t13 = false;
  bool t14 = false;
  bool t15 = true;
  bool t16 = false;
  bool t17 = false;
  bool t18 = false;
  bool t19 = false;
  bool t20 = false;
  int nonProssesBarber = 1;
  String day, date, month, year = '';
  List<Widget> itemProfile = new List<Widget>();
  List<Widget> itemProfileTwo = new List<Widget>();
  List<Widget> itemData = [];
  int numberUsedService = 2;

  String imgUrl = '';
  String serviceName = '';
  String originalServicePrice = '';
  String servicePrice = '';
  String serviceNote;
  String btnConfirmName = 'Choose appointment';
  int initServiceAmount;
  TextEditingController _serviceNoteController = new TextEditingController();

  var downwardIcon = Icon(
    Icons.keyboard_arrow_down,
    color: Colors.black54,
  );
  @override
  initState() {
    super.initState();
    instanceProfilAvatar();
    instanceProfilAvatarTwo();
    getListTimeData();
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

//------------------------------------------

  void add() {
    setState(() {
      nonProssesBarber++;
    });
  }

  void minus() {
    setState(() {
      if (nonProssesBarber > 3) {
        nonProssesBarber--;
      }
    });
  }

  Widget bookTimeContainer(
      bool isEmpty, String time, dynamic groupValue, int index) {
    return InkWell(
      onTap: () {
        setState(() {
          isEmpty
              ? setState(() {
                  tmpValue = tmpValue;
                })
              : setState(() {
                  tmpValue = groupValue;
                });
          slotIndex = index;
          print(index);
        });
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 0.2),
          ),
        ),
        child: Row(
          children: [
            Radio(
                value: tmpValue,
                groupValue: groupValue,
                onChanged: (value) {
                  isEmpty
                      ? setState(() {
                          tmpValue = tmpValue;
                        })
                      : setState(() {
                          tmpValue = groupValue;
                        });
                }),
            isEmpty
                ? Text(
                    '$time',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  )
                : Text(
                    '$time',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
            Spacer(),
            isEmpty
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: kRed,
                          ),
                          width: 100,
                          height: 30,
                          child: Center(
                            child: Text(
                              'Unavailable',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: kBlues,
                          ),
                          width: 100,
                          height: 30,
                          child: Center(
                            child: Text(
                              slot[index].toString() + ' Slots',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
          ],
        ),
      ),
    );
  }

//--------------------------------------------------
  void getListTimeData() {
    List<dynamic> responseList = [];
    if (fri == true) {
      responseList = TIME_DATA;
    }
    if (sat == true) {
      responseList = TIME_DATA_TWO;
    }
    if (sun == true) {
      responseList = TIME_DATA_THREE;
    }
    if (tmpChoosen == true) {
      responseList = JANE_DO;
    }

    List<Widget> tmp = [];
    responseList.forEach((eachTimeData) {
      tmp.add(
        bookTimeContainer(
          eachTimeData['isEmpty'],
          eachTimeData['time'],
          eachTimeData['time'],
          eachTimeData['index'],
        ),
      );
    });
    setState(() {
      itemData = tmp;
    });
  }

  //-------------------------------------------
  Widget _dashedText() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 1),
      child: Text(
        '------------------------------------------',
        maxLines: 1,
        style:
            TextStyle(fontSize: 20.0, color: Colors.black12, letterSpacing: 5),
      ),
    );
  }

  //---------------------------------------------
  void instanceProfilAvatar() {
    List<Widget> tmp = [];
    stylist.forEach((eachOnlineStylist) {
      tmp.add(Column(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                this.defaulChoosen = false;
                tmpChoosen = !tmpChoosen;
                barberName = eachOnlineStylist.name;
                eachOnlineStylist.isActive = !eachOnlineStylist.isActive;
                // stylist.forEach((_eachOnlineStylist) {
                //   if (_eachOnlineStylist.id != eachOnlineStylist.id) {
                //     _eachOnlineStylist.isActive = false;
                //   }
                // });
              });
            },
            child: CircleAvatar(
              radius: 30.0,
              backgroundColor: kRed,
              child: CircleAvatar(
                radius: eachOnlineStylist.isActive ? 27.0 : 30.0,
                backgroundColor: Colors.grey[200],
                backgroundImage: NetworkImage(eachOnlineStylist.imageUrl),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Container(
              child: Center(
                child: Text(
                  '${eachOnlineStylist.name}',
                  style: TextStyle(color: Colors.black, fontSize: 15.0),
                ),
              ),
            ),
          ),
        ],
      ));
    });
    setState(() {
      this.itemProfile = tmp;
    });
  }

  void instanceProfilAvatarTwo() {
    List<Widget> tmp = [];
    stylist_2.forEach((eachOnlineStylist) {
      tmp.add(Column(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                this.defaulChoosen = false;
                tmpChoosen = !tmpChoosen;
                barberName = eachOnlineStylist.name;
                eachOnlineStylist.isActive = !eachOnlineStylist.isActive;
                // stylist.forEach((_eachOnlineStylist) {
                //   if (_eachOnlineStylist.id != eachOnlineStylist.id) {
                //     _eachOnlineStylist.isActive = false;
                //   }
                // });
              });
            },
            child: CircleAvatar(
              radius: 30.0,
              backgroundColor: kRed,
              child: CircleAvatar(
                radius: eachOnlineStylist.isActive ? 27.0 : 30.0,
                backgroundColor: Colors.grey[200],
                backgroundImage: NetworkImage(eachOnlineStylist.imageUrl),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Container(
              child: Center(
                child: Text(
                  '${eachOnlineStylist.name}',
                  style: TextStyle(color: Colors.black, fontSize: 15.0),
                ),
              ),
            ),
          ),
        ],
      ));
    });
    setState(() {
      this.itemProfileTwo = tmp;
    });
  }

  //---------------------------------------------------------------
  viewBookTimeContainers(itemData) {
    return ListView.builder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: itemData.length,
      itemBuilder: (BuildContext context, int index) {
        return itemData[index];
        // return Container(height: 100, width: 100, color: Colors.amber);
      },
    );
  }

  //---------------------------------------------------------------
  Widget calendarDate(
      String day, String date, Color dayColor, Color dateColor) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: Column(
        children: <Widget>[
          Text(
            day,
            style: TextStyle(
                fontSize: 16, color: dayColor, fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 10.0),
          Text(
            date,
            style: TextStyle(
                fontSize: 16, color: dateColor, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }

  DateTime _date = DateTime.now();
  Future<Null> _selectDate(BuildContext context) async {
    DateTime _datePicker = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime(2018),
        lastDate: DateTime(2021),
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData(
              primaryColor: kGreen,
              accentColor: kLightYellow,
            ),
            child: child,
          );
        });
    if (_datePicker != null && _datePicker != _date) {
      setState(() {
        _date = _datePicker;
        day = _date.day.toString();
        month = _date.month.toString();
        year = _date.year.toString();
      });
      print(_date.day);
    }
  }

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

  void serveInformation() {
    if (mon == true) {
      date = 'Mon';
      day = '9';
      year = '2020';
    }
    if (tue == true) {
      date = 'Tue';
      day = '10';
      year = '2020';
    }
    if (wed == true) {
      date = 'Wed';
      day = '11';
      year = '2020';
    }
    if (thu == true) {
      date = 'Thu';
      day = '12';
      year = '2020';
    }
    if (fri == true) {
      date = 'Fri';
      day = '13';
      year = '2020';
    }

    bookingServices.forEach((eachBooking) {
      if (this.widget.servicesId == eachBooking['id']) {
        eachBooking['barberName'] = barberName;
        eachBooking['timeInfo'] = '$tmpValue $date $day Nov $year';
      }
    });
    if (this.widget.servicesId == '4') {
      bookingServices[0]['barberName'] = barberName;
      bookingServices[0]['timeInfo'] = '$tmpValue Tue $day Nov $year';
      bookingServices[1]['barberName'] = barberName;
      bookingServices[1]['timeInfo'] = '$tmpValue Tue $day Nov $year';
    }
    if (this.widget.servicesId == '5') {
      bookingServices[2]['barberName'] = barberName;
      bookingServices[2]['timeInfo'] = '$tmpValue $date $day Nov $year';
    }
    if (this.widget.servicesId == '6') {
      bookingServices[0]['barberName'] = barberName;
      bookingServices[0]['timeInfo'] = '$tmpValue Tue $day Nov $year';
      bookingServices[1]['barberName'] = barberName;
      bookingServices[1]['timeInfo'] = '$tmpValue Tue $day Nov $year';
      bookingServices[2]['barberName'] = barberName;
      bookingServices[2]['timeInfo'] = '$tmpValue Tue $day Nov $year';
    }
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

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    instanceProfilAvatar();
    instanceProfilAvatarTwo();
    getListTimeData();
    return Container(
      margin: EdgeInsets.only(top: 50),
      child: Scaffold(
        backgroundColor: Colors.white,
        // appBar: AppBar(
        //   elevation: 10,
        //   brightness: Brightness.dark,
        //   backgroundColor: Colors.blue,
        //   centerTitle: true,
        //   title: RichText(
        //     textAlign: TextAlign.center,
        //     text: TextSpan(
        //       children: [
        //         TextSpan(
        //             text: 'Barber Shop',
        //             style: TextStyle(
        //               fontSize: 18,
        //               fontWeight: FontWeight.w500,
        //             )),
        //         TextSpan(text: '\n'),
        //         TextSpan(
        //           text: 'Distance from you 2.7km',
        //           style: TextStyle(
        //             fontSize: 11,
        //             fontWeight: FontWeight.w400,
        //           ),
        //         )
        //       ],
        //     ),
        //   ),
        //   leading: IconButton(
        //       icon: Icon(Icons.arrow_back_ios),
        //       color: Colors.white,
        //       onPressed: () {
        //         Navigator.pop(context);
        //       }),
        // ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              20,
              20,
              20,
              0,
            ),
            child: Column(
              children: <Widget>[
                // Steper(
                //   steper1: '1',
                //   contentSteper1: 'Choose Service',
                //   colorBorderSteper1: Colors.blue,
                //   colorFillSteper1: Colors.blue,
                //   steper2: '2',
                //   contentSteper2: 'Booking',
                //   colorBorderSteper2: Colors.blue,
                //   colorFillSteper2: Colors.blue,
                //   steper3: '3',
                //   contentSteper3: 'Confirm',
                //   colorBorderSteper3: Colors.black,
                //   colorFillSteper3: Colors.white,
                //   steper4: '4',
                //   contentSteper4: 'Complete',
                //   colorBorderSteper4: Colors.black,
                //   colorFillSteper4: Colors.white,
                //   colorSteper1: Colors.white,
                //   colorSteper2: Colors.white,
                //   colorSteper3: Colors.black,
                //   colorSteper4: Colors.black,
                // ),

                Container(
                  color: Colors.grey[300],
                  height: getProportionateScreenHeight(540),
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
                                  padding: EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 0),
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
                                      // GeneralHelper.navigateToScreen(
                                      //     context,
                                      //     DetailScreen(
                                      //       address: hotComboList[0]
                                      //           ['storeAddress'],
                                      //       description: hotComboList[0]
                                      //           ['description'],
                                      //       guestCheckout: '35',
                                      //       imageUrl: hotComboList[0]
                                      //           ['storeLogo'],
                                      //       isLike: true,
                                      //       phone: hotComboList[0]['phone'],
                                      //       ratingNum: double.parse(
                                      //           hotComboList[0]['ratingStar']),
                                      //       storeName: hotComboList[0]
                                      //           ['storeName'],
                                      //       servicePage: 1,
                                      //     ),
                                      //     true);
                                      Navigator.of(context).pop();
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
                                  SizedBox(
                                      width: getProportionateScreenWidth(10)),
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        vertical:
                                            getProportionateScreenHeight(20)),
                                    child: Text(
                                      this.serviceName,
                                      style: TextStyle(
                                        fontSize:
                                            getProportionateScreenWidth(18),
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
                                        fontSize:
                                            getProportionateScreenWidth(18),
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
                                        fontSize:
                                            getProportionateScreenWidth(18),
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                      width: getProportionateScreenWidth(10)),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal:
                                        getProportionateScreenWidth(20)),
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
                                        fontSize:
                                            getProportionateScreenWidth(18),
                                      ),
                                      children: [
                                        TextSpan(
                                            text: '(Optional)',
                                            style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontSize:
                                                  getProportionateScreenWidth(
                                                      14),
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
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
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
                                        left: getProportionateScreenWidth(85),
                                      ),
                                      height: getProportionateScreenHeight(50),
                                      width: getProportionateScreenWidth(50),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey[300],
                                            width: 0.5),
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
                                        horizontal:
                                            getProportionateScreenWidth(30),
                                      ),
                                      child: Text(
                                        this.initServiceAmount.toString(),
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize:
                                              getProportionateScreenWidth(18),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: getProportionateScreenHeight(50),
                                      width: getProportionateScreenWidth(50),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey[300],
                                            width: 0.5),
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

                _dashedText(),
                // Container(
                //   // margin: EdgeInsets.symmetric(
                //   //     vertical: getProportionateScreenHeight(10)),
                //   // padding: EdgeInsets.only(top: 10),
                //   decoration: BoxDecoration(
                //     // borderRadius: BorderRadius.circular(10),
                //     // borderRadius: BorderRadius.circular(10),
                //     color: Colors.white,
                //     // border: Border(
                //     //     bottom: BorderSide(color: Colors.grey, width: 0.5))
                //     // boxShadow: [
                //     //   BoxShadow(
                //     //     offset: Offset(0, 0.5),
                //     //     blurRadius: 4,
                //     //     color: kShadowColor,
                //     //   )
                //     // ],
                //   ),
                //   height: getProportionateScreenHeight(60),
                //   width: SizeConfig.screenWidth,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: <Widget>[
                //       Container(
                //         width: getProportionateScreenWidth(30),
                //         height: getProportionateScreenWidth(30),
                //         alignment: Alignment.center,
                //         decoration: BoxDecoration(
                //           border: Border.all(color: Colors.grey[800], width: 1),
                //           borderRadius: BorderRadius.all(Radius.circular(5)),
                //         ),
                //         child: Text(
                //           '1' + 'x',
                //           style: TextStyle(
                //               color: Colors.blue,
                //               fontWeight: FontWeight.bold,
                //               fontSize: getProportionateScreenHeight(16)),
                //           maxLines: 2,
                //         ),
                //       ),
                //       SizedBox(width: getProportionateScreenWidth(10)),
                //       Column(
                //         mainAxisAlignment: MainAxisAlignment.start,
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Container(
                //             // color: Colors.red,
                //             width: SizeConfig.screenWidth * 0.7 - 60,
                //             child: Text(
                //               'Hair Dye',
                //               style: TextStyle(
                //                   fontWeight: FontWeight.bold,
                //                   fontSize: getProportionateScreenHeight(16)),
                //               maxLines: 2,
                //             ),
                //           ),
                //           Container(
                //             // width: SizeConfig.screenWidth * 0.05,
                //             child: Text(
                //               'A tomboy might have a very short',
                //               style: TextStyle(
                //                   color: Colors.black,
                //                   fontWeight: FontWeight.w400,
                //                   fontSize: getProportionateScreenHeight(14)),
                //               maxLines: 2,
                //             ),
                //           ),
                //           SizedBox(height: getProportionateScreenHeight(8)),
                //         ],
                //       ),
                //       Spacer(),
                //       Column(
                //         mainAxisAlignment: MainAxisAlignment.start,
                //         crossAxisAlignment: CrossAxisAlignment.end,
                //         children: [
                //           Text(
                //             "\$" + '5.0',
                //             style: TextStyle(
                //                 color: Colors.black,
                //                 fontSize: getProportionateScreenHeight(16),
                //                 fontWeight: FontWeight.bold),
                //           ),
                //           // SizedBox(height: getProportionateScreenHeight(20)),
                //           Text(
                //             "\$" + '6.0',
                //             style: TextStyle(
                //                 color: Colors.grey[600],
                //                 fontSize: getProportionateScreenHeight(14),
                //                 decoration: TextDecoration.lineThrough),
                //           )
                //         ],
                //       ),
                //     ],
                //   ),
                // ),

                // Container(
                //   // margin: EdgeInsets.symmetric(
                //   //     vertical: getProportionateScreenHeight(10)),
                //   // padding: EdgeInsets.only(top: 10),
                //   decoration: BoxDecoration(
                //     // borderRadius: BorderRadius.circular(10),
                //     // borderRadius: BorderRadius.circular(10),
                //     color: Colors.white,
                //     // border: Border(
                //     //     bottom: BorderSide(color: Colors.grey, width: 0.5))
                //     // boxShadow: [
                //     //   BoxShadow(
                //     //     offset: Offset(0, 0.5),
                //     //     blurRadius: 4,
                //     //     color: kShadowColor,
                //     //   )
                //     // ],
                //   ),
                //   height: getProportionateScreenHeight(60),
                //   width: SizeConfig.screenWidth,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: <Widget>[
                //       Container(
                //         width: getProportionateScreenWidth(30),
                //         height: getProportionateScreenWidth(30),
                //         alignment: Alignment.center,
                //         decoration: BoxDecoration(
                //           border: Border.all(color: Colors.grey[800], width: 1),
                //           borderRadius: BorderRadius.all(Radius.circular(5)),
                //         ),
                //         child: Text(
                //           '2' + 'x',
                //           style: TextStyle(
                //               color: Colors.blue,
                //               fontWeight: FontWeight.bold,
                //               fontSize: getProportionateScreenHeight(16)),
                //           maxLines: 2,
                //         ),
                //       ),
                //       SizedBox(width: getProportionateScreenWidth(10)),
                //       Column(
                //         mainAxisAlignment: MainAxisAlignment.start,
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Container(
                //             // color: Colors.red,
                //             width: SizeConfig.screenWidth * 0.7 - 60,
                //             child: Text(
                //               'Hair Cut',
                //               style: TextStyle(
                //                   fontWeight: FontWeight.bold,
                //                   fontSize: getProportionateScreenHeight(16)),
                //               maxLines: 2,
                //             ),
                //           ),
                //           Container(
                //             // width: SizeConfig.screenWidth * 0.05,
                //             child: Text(
                //               '',
                //               style: TextStyle(
                //                   color: Colors.black,
                //                   fontWeight: FontWeight.w400,
                //                   fontSize: getProportionateScreenHeight(14)),
                //               maxLines: 2,
                //             ),
                //           ),
                //           SizedBox(height: getProportionateScreenHeight(8)),
                //         ],
                //       ),
                //       Spacer(),
                //       Column(
                //         mainAxisAlignment: MainAxisAlignment.start,
                //         crossAxisAlignment: CrossAxisAlignment.end,
                //         children: [
                //           Text(
                //             "\$" + '5.0',
                //             style: TextStyle(
                //                 color: Colors.black,
                //                 fontSize: getProportionateScreenHeight(16),
                //                 fontWeight: FontWeight.bold),
                //           ),
                //           // SizedBox(height: getProportionateScreenHeight(20)),
                //           Text(
                //             "\$" + '6.0',
                //             style: TextStyle(
                //                 color: Colors.grey[600],
                //                 fontSize: getProportionateScreenHeight(14),
                //                 decoration: TextDecoration.lineThrough),
                //           )
                //         ],
                //       ),
                //     ],
                //   ),
                // ),

                // getTitle('Address', 'abc'),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'November, 2020',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 20),
                        ),
                      ),
                      Container(
                        height: 40.0,
                        width: 70,
                        decoration: BoxDecoration(
                          color: kBlues,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: FlatButton(
                          onPressed: () {
                            setState(() {
                              _selectDate(context);
                            });
                          },
                          child: Center(
                            // child: Text(
                            //   'Pick Date',
                            //   style: TextStyle(
                            //       color: Colors.white,
                            //       fontWeight: FontWeight.w700,
                            //       fontSize: 16),
                            // ),
                            child: Icon(
                              MdiIcons.calendar,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ]),
                SizedBox(height: 20.0),
                Container(
                  height: 58.0,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: days.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            if (index + 1 == 6) {
                              nonProssesBarber = 1;
                              wed = false;
                              thu = false;
                              fri = true;
                              sat = false;
                              sun = false;
                              tmpValue = '';
                              tmpChoosen = false;
                              tmpValue = '14h00';
                              slotIndex = 6;
                              eight = false;
                              nine = false;
                              ten = false;
                              eleven = false;
                              twelve = false;
                              t13 = false;
                              t14 = true;
                              t15 = false;
                              t16 = false;
                              t17 = false;
                              t18 = false;
                              t19 = false;
                              t20 = false;
                            }
                            if (index + 1 == 7) {
                              nonProssesBarber = 2;
                              wed = false;
                              thu = false;
                              fri = false;
                              sat = true;
                              sun = false;
                              tmpValue = '';
                              tmpChoosen = false;
                              tmpValue = '8h00';
                              slotIndex = 0;
                              eight = true;
                              nine = false;
                              ten = false;
                              eleven = false;
                              twelve = false;
                              t13 = false;
                              t14 = false;
                              t15 = false;
                              t16 = false;
                              t17 = false;
                              t18 = false;
                              t19 = false;
                              t20 = false;
                            }
                            if (index + 1 == 8) {
                              nonProssesBarber = 1;
                              wed = false;
                              thu = false;
                              fri = false;
                              sat = false;
                              sun = true;
                              tmpValue = '';
                              tmpChoosen = false;
                              tmpValue = '8h00';
                              slotIndex = 0;
                              eight = true;
                              nine = false;
                              ten = false;
                              eleven = false;
                              twelve = false;
                              t13 = false;
                              t14 = false;
                              t15 = false;
                              t16 = false;
                              t17 = false;
                              t18 = false;
                              t19 = false;
                              t20 = false;
                            }
                            index + 1 < 2
                                ? numberSelected = 2
                                : numberSelected = index + 1;
                          });
                        },
                        child: calendarDate(
                          days[index],
                          dates[index],
                          // numberSelected == index + 1 ? kRed : Colors.black54,
                          // numberSelected == index + 1 ? kRed : kDarkBlue,
                          index + 1 < 6
                              ? Colors.black12
                              : numberSelected == index + 1
                                  ? kRed
                                  : Colors.black54,
                          index + 1 < 6
                              ? Colors.black12
                              : numberSelected == index + 1
                                  ? kRed
                                  : kDarkBlue,
                        ),
                      );
                    },
                  ),
                ),

                // _dashedText(),
                SizedBox(height: 10),
                // Align(
                //   alignment: Alignment.centerLeft,
                //   child: Text(
                //     'Make Apointment',
                //     style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                //   ),
                // ),
                //--------------------------------------------------------
                _dashedText(),
                // Expanded(
                // child:
                Container(
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.start,
                        //direction: Axis.vertical,
                        alignment: WrapAlignment.start,
                        verticalDirection: VerticalDirection.down,
                        runSpacing: 5,
                        //textDirection: TextDirection.rtl,
                        spacing: 5.0,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              setState(() {
                                nonProssesBarber = 1;
                                tmpValue = '8h00';
                                slotIndex = 0;
                                eight = true;
                                nine = false;
                                ten = false;
                                eleven = false;
                                twelve = false;
                                t13 = false;
                                t14 = false;
                                t15 = false;
                                t16 = false;
                                t17 = false;
                                t18 = false;
                                t19 = false;
                                t20 = false;
                              });
                            },
                            child: Chip(
                              padding: EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 10,
                              ),
                              label: Column(
                                children: [
                                  Text("8h00"),
                                  SizedBox(height: 5),
                                  Text(slot[0].toString() + ' Slots'),
                                ],
                              ),
                              // shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20))),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              backgroundColor:
                                  eight ? kBlue : Colors.grey.shade400,
                              labelStyle: eight
                                  ? TextStyle(color: Colors.white)
                                  : TextStyle(color: Colors.black),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                nonProssesBarber = 1;
                                slotIndex = 1;
                                eight = false;
                                nine = true;
                                ten = false;
                                eleven = false;
                                twelve = false;
                                t13 = false;
                                t14 = false;
                                t15 = false;
                                t16 = false;
                                t17 = false;
                                t18 = false;
                                t19 = false;
                                t20 = false;
                              });
                            },
                            child: Chip(
                              padding: EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 10,
                              ),
                              label: Column(
                                children: [
                                  Text("9h00"),
                                  SizedBox(height: 5),
                                  Text(slot[1].toString() + ' Slots'),
                                ],
                              ),
                              // shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20))),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              backgroundColor:
                                  nine ? kBlue : Colors.grey.shade400,
                              labelStyle: nine
                                  ? TextStyle(color: Colors.white)
                                  : TextStyle(color: Colors.black),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                nonProssesBarber = 2;
                                slotIndex = 2;
                                eight = false;
                                nine = false;
                                ten = true;
                                eleven = false;
                                twelve = false;
                                t13 = false;
                                t14 = false;
                                t15 = false;
                                t16 = false;
                                t17 = false;
                                t18 = false;
                                t19 = false;
                                t20 = false;
                              });
                            },
                            child: Chip(
                              padding: EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 10,
                              ),
                              label: Column(
                                children: [
                                  Text("10h00"),
                                  SizedBox(height: 5),
                                  Text(slot[2].toString() + ' Slots'),
                                ],
                              ),
                              // shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20))),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              backgroundColor:
                                  ten ? kBlue : Colors.grey.shade400,
                              labelStyle: ten
                                  ? TextStyle(color: Colors.white)
                                  : TextStyle(color: Colors.black),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                nonProssesBarber = 1;
                                tmpValue = '11h00';
                                slotIndex = 3;
                                eight = false;
                                nine = false;
                                ten = false;
                                eleven = true;
                                twelve = false;
                                t13 = false;
                                t14 = false;
                                t15 = false;
                                t16 = false;
                                t17 = false;
                                t18 = false;
                                t19 = false;
                                t20 = false;
                              });
                            },
                            child: Chip(
                              padding: EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 10,
                              ),
                              label: Column(
                                children: [
                                  Text("11h00"),
                                  SizedBox(height: 5),
                                  Text(slot[3].toString() + ' Slots'),
                                ],
                              ),
                              // shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20))),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              backgroundColor:
                                  eleven ? kBlue : Colors.grey.shade400,
                              labelStyle: eleven
                                  ? TextStyle(color: Colors.white)
                                  : TextStyle(color: Colors.black),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                nonProssesBarber = 2;
                                tmpValue = '12h00';
                                slotIndex = 4;
                                eight = false;
                                nine = false;
                                ten = false;
                                eleven = false;
                                twelve = true;
                                t13 = false;
                                t14 = false;
                                t15 = false;
                                t16 = false;
                                t17 = false;
                                t18 = false;
                                t19 = false;
                                t20 = false;
                              });
                            },
                            child: Chip(
                              padding: EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 10,
                              ),
                              label: Column(
                                children: [
                                  Text("12h00"),
                                  SizedBox(height: 5),
                                  Text(slot[4].toString() + ' Slots'),
                                ],
                              ),
                              // shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20))),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              backgroundColor:
                                  twelve ? kBlue : Colors.grey.shade400,
                              labelStyle: twelve
                                  ? TextStyle(color: Colors.white)
                                  : TextStyle(color: Colors.black),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                nonProssesBarber = 1;
                                tmpValue = '13h00';
                                slotIndex = 5;
                                eight = false;
                                nine = false;
                                ten = false;
                                eleven = false;
                                twelve = false;
                                t13 = true;
                                t14 = false;
                                t15 = false;
                                t16 = false;
                                t17 = false;
                                t18 = false;
                                t19 = false;
                                t20 = false;
                              });
                            },
                            child: Chip(
                              padding: EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 10,
                              ),
                              label: Column(
                                children: [
                                  Text("13h00"),
                                  SizedBox(height: 5),
                                  Text(slot[5].toString() + ' Slots'),
                                ],
                              ),
                              // shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20))),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              backgroundColor:
                                  t13 ? kBlue : Colors.grey.shade400,
                              labelStyle: t13
                                  ? TextStyle(color: Colors.white)
                                  : TextStyle(color: Colors.black),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                nonProssesBarber = 2;
                                tmpValue = '14h00';
                                slotIndex = 6;
                                eight = false;
                                nine = false;
                                ten = false;
                                eleven = false;
                                twelve = false;
                                t13 = false;
                                t14 = true;
                                t15 = false;
                                t16 = false;
                                t17 = false;
                                t18 = false;
                                t19 = false;
                                t20 = false;
                              });
                            },
                            child: Chip(
                              padding: EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 10,
                              ),
                              label: Column(
                                children: [
                                  Text("14h00"),
                                  SizedBox(height: 5),
                                  Text(slot[6].toString() + ' Slots'),
                                ],
                              ),
                              // shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20))),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              backgroundColor:
                                  t14 ? kBlue : Colors.grey.shade400,
                              labelStyle: t14
                                  ? TextStyle(color: Colors.white)
                                  : TextStyle(color: Colors.black),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                nonProssesBarber = 1;
                                tmpValue = '15h00';
                                slotIndex = 7;
                                eight = false;
                                nine = false;
                                ten = false;
                                eleven = false;
                                twelve = false;
                                t13 = false;
                                t14 = false;
                                t15 = true;
                                t16 = false;
                                t17 = false;
                                t18 = false;
                                t19 = false;
                                t20 = false;
                              });
                            },
                            child: Chip(
                              padding: EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 10,
                              ),
                              label: Column(
                                children: [
                                  Text("15h00"),
                                  SizedBox(height: 5),
                                  Text(slot[7].toString() + ' Slots'),
                                ],
                              ),
                              // shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20))),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              backgroundColor:
                                  t15 ? kBlue : Colors.grey.shade400,
                              labelStyle: t15
                                  ? TextStyle(color: Colors.white)
                                  : TextStyle(color: Colors.black),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                nonProssesBarber = 2;
                                tmpValue = '16h00';
                                slotIndex = 8;
                                eight = false;
                                nine = false;
                                ten = false;
                                eleven = false;
                                twelve = false;
                                t13 = false;
                                t14 = false;
                                t15 = false;
                                t16 = true;
                                t17 = false;
                                t18 = false;
                                t19 = false;
                                t20 = false;
                              });
                            },
                            child: Chip(
                              padding: EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 10,
                              ),
                              label: Column(
                                children: [
                                  Text("16h00"),
                                  SizedBox(height: 5),
                                  Text(slot[8].toString() + ' Slots'),
                                ],
                              ),
                              // shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20))),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              backgroundColor:
                                  t16 ? kBlue : Colors.grey.shade400,
                              labelStyle: t16
                                  ? TextStyle(color: Colors.white)
                                  : TextStyle(color: Colors.black),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                tmpValue = '17h00';
                                nonProssesBarber = 1;
                                slotIndex = 9;
                                eight = false;
                                nine = false;
                                ten = false;
                                eleven = false;
                                twelve = false;
                                t13 = false;
                                t14 = false;
                                t15 = false;
                                t16 = false;
                                t17 = true;
                                t18 = false;
                                t19 = false;
                                t20 = false;
                              });
                            },
                            child: Chip(
                              padding: EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 10,
                              ),
                              label: Column(
                                children: [
                                  Text("17h00"),
                                  SizedBox(height: 5),
                                  Text(slot[9].toString() + ' Slots'),
                                ],
                              ),
                              // shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20))),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              backgroundColor:
                                  t17 ? kBlue : Colors.grey.shade400,
                              labelStyle: t17
                                  ? TextStyle(color: Colors.white)
                                  : TextStyle(color: Colors.black),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                nonProssesBarber = 2;
                                tmpValue = '18h00';
                                slotIndex = 10;
                                eight = false;
                                nine = false;
                                ten = false;
                                eleven = false;
                                twelve = false;
                                t13 = false;
                                t14 = false;
                                t15 = false;
                                t16 = false;
                                t17 = false;
                                t18 = true;
                                t19 = false;
                                t20 = false;
                              });
                            },
                            child: Chip(
                              padding: EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 10,
                              ),
                              label: Column(
                                children: [
                                  Text("18h00"),
                                  SizedBox(height: 5),
                                  Text(slot[10].toString() + ' Slots'),
                                ],
                              ),
                              // shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20))),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              backgroundColor:
                                  t18 ? kBlue : Colors.grey.shade400,
                              labelStyle: t18
                                  ? TextStyle(color: Colors.white)
                                  : TextStyle(color: Colors.black),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                nonProssesBarber = 1;
                                tmpValue = '19h00';
                                slotIndex = 11;
                                eight = false;
                                nine = false;
                                ten = false;
                                eleven = false;
                                twelve = false;
                                t13 = false;
                                t14 = false;
                                t15 = false;
                                t16 = false;
                                t17 = false;
                                t18 = false;
                                t19 = true;
                                t20 = false;
                              });
                            },
                            child: Chip(
                              padding: EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 10,
                              ),
                              label: Column(
                                children: [
                                  Text("19h00"),
                                  SizedBox(height: 5),
                                  Text(slot[11].toString() + ' Slots'),
                                ],
                              ),
                              // shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20))),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              backgroundColor:
                                  t19 ? kBlue : Colors.grey.shade400,
                              labelStyle: t19
                                  ? TextStyle(color: Colors.white)
                                  : TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // ),
                _dashedText(),
                // Expanded(
                //   child:
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  // margin: EdgeInsets.only(bottom: 30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Center(
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        SizedBox(width: 20),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Number of Seat',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 15),
                          ),
                        ),
                        SizedBox(width: 100),
                        Container(
                          width: 40,
                          height: 40,
                          child: FloatingActionButton(
                            heroTag: 'btn1',
                            onPressed: () {
                              setState(() {
                                if (numberUsedService > 2) {
                                  --numberUsedService;
                                }
                              });
                            },
                            child: Center(
                              child: Text(
                                '-',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 30),
                              ),
                            ),
                            backgroundColor: Colors.white,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          child: Text('$numberUsedService',
                              style: new TextStyle(fontSize: 30.0)),
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          child: FloatingActionButton(
                            heroTag: 'btn2',
                            onPressed: () {
                              setState(() {
                                // ++numberUsedService;
                                if (numberUsedService <
                                    int.parse(this.widget.amount)) {
                                  ++numberUsedService;
                                }
                              });
                            },
                            child: new Icon(
                              Icons.add,
                              color: Colors.black,
                            ),
                            backgroundColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // ),
                _dashedText(),
                // Align(
                //   alignment: Alignment.centerLeft,
                //   child: Text(
                //     'Serve Staff (Choose up to ' +
                //         this.widget.amount +
                //         ' Barbers)',
                //     style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                //   ),
                // ),
                // _dashedText(),
                // Row(
                //   children: [
                //     Column(
                //       children: [
                //         InkWell(
                //           onTap: () {
                //             setState(() {
                //               tmpChoosen = false;
                //               this.defaulChoosen = !this.defaulChoosen;
                //               stylist.forEach((e) {
                //                 e.isActive = false;
                //               });
                //             });
                //           },
                //           child: Container(
                //             child: CircleAvatar(
                //               radius: 30.0,
                //               backgroundColor: kRed,
                //               child: CircleAvatar(
                //                 radius: defaulChoosen ? 27.0 : 30.0,
                //                 backgroundColor: Colors.grey[200],
                //                 child: Icon(
                //                   Icons.people,
                //                   color: kBlues,
                //                   size: 35,
                //                 ),
                //               ),
                //             ),
                //           ),
                //         ),
                //         Padding(
                //           padding: const EdgeInsets.symmetric(vertical: 5.0),
                //           child: Container(
                //             child: Center(
                //               child: Text(
                //                 'Default Barber',
                //                 style: TextStyle(
                //                     color: Colors.black, fontSize: 15.0),
                //               ),
                //             ),
                //           ),
                //         ),
                //       ],
                //     ),
                //     Expanded(
                //       child: Container(
                //         height: 100.0,
                //         child: ListView.builder(
                //           padding: const EdgeInsets.symmetric(
                //               vertical: 5.0, horizontal: 4.0),
                //           scrollDirection: Axis.horizontal,
                //           itemCount: stylist.length,
                //           itemBuilder: (BuildContext context, int index) {
                //             return Padding(
                //               padding:
                //                   const EdgeInsets.symmetric(horizontal: 8.0),
                //               child: nonProssesBarber == 1
                //                   ? itemProfile[index]
                //                   : itemProfileTwo[index],
                //             );
                //           },
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                // ),
                // _dashedText(),
                // Expanded(
                //   child: Container(
                //     height: getProportionateScreenHeight(300),
                //     child: viewBookTimeContainers(itemData),
                //   ),
                // ),
                tmpValue != ''
                    ? Container(
                        height: getProportionateScreenHeight(80),
                        width: SizeConfig.screenWidth,
                        decoration: BoxDecoration(
                          color: kLightYellow,
                          border: Border.all(width: 0.5),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Container(
                            //   width: getProportionateScreenWidth(30),
                            // ),
                            // InkWell(
                            //   onTap: () {
                            //     setState(() {
                            //       tmpValue = '';
                            //       // Navigator.pop(context);
                            //       // GeneralHelper.navigateToScreen(
                            //       //   context, Service, false);
                            //     });
                            //   },
                            //   child: Container(
                            //     height: getProportionateScreenHeight(50),
                            //     width: getProportionateScreenWidth(80),
                            //     decoration: BoxDecoration(
                            //       border: Border.all(
                            //         color: Colors.blue,
                            //         width: 1.0,
                            //       ),
                            //       color: Colors.white,
                            //       borderRadius: BorderRadius.circular(2.0),
                            //     ),
                            //     child: Center(
                            //       child: Text(
                            //         'Back',
                            //         style: TextStyle(
                            //           fontSize: 18.0,
                            //           color: Colors.blue,
                            //           fontWeight: FontWeight.bold,
                            //         ),
                            //       ),
                            //     ),
                            //   ),
                            // ),

                            // Container(
                            //   width: getProportionateScreenWidth(100),
                            // ),
                            InkWell(
                              onTap: () {
                                // bookingServices.add([
                                //   {
                                //     'id': '1',
                                //     'name': barberName,
                                //     'info':
                                //         '$tmpValue, Saturday, $year - $month -$day',
                                //     'username': 'Thanh Dat',
                                //     'phone': '0123456789'
                                //   },
                                // ]);
                                print(slot);
                                serveInformation();
                                // print(
                                //     '$tmpValue, Saturday, $year - $month -$day, $phone, $customer, $barberName');
                                print(bookingServices);
                                setState(() {
                                  tmpChoosen = false;
                                  defaulChoosen = true;
                                  stylist.forEach((element) {
                                    element.isActive = false;
                                  });
                                  // if (slot[slotIndex] != 0) {
                                  //   slot[slotIndex] =
                                  //       slot[slotIndex] - nonProssesBarber;
                                  // }
                                  slot[slotIndex] == 0
                                      ? slot[slotIndex] = slot[slotIndex]
                                      : slot[slotIndex] =
                                          slot[slotIndex] - numberUsedService;
                                });
                                // setState(() {
                                //   slot == 0 ? slot = slot : slot--;
                                // });

                                // Timer(Duration(seconds: 3), () {
                                // GeneralHelper.navigateToScreen(
                                //     context,
                                //     BookingBillScreen(
                                //       storeName: this.widget.storeName,
                                //       address: this.widget.address,
                                //       discountData: this.widget.discountData,
                                //       methodPayment: this.widget.methodPayment,
                                //     ),
                                //     true);
                                // });
                                // this.widget.presenter.getRefeshStore();
                                // myService.forEach((eachService) {
                                //   if (eachService['id'] == this.widget.serviceId) {
                                //     eachService['value']['isActive'] = true;
                                //     eachService['amount'] = initServiceAmount.toString();
                                //     print(eachService['amount'] + "  - 123123");
                                //     return;
                                //   }
                                // });
                                // if (this.widget.isComboFromMain) {
                                //   GeneralHelper.navigateToScreen(
                                //       context,
                                //       // DetailScreen(
                                //       //   address: hotComboList[0]['storeAddress'],
                                //       //   description: hotComboList[0]['description'],
                                //       //   guestCheckout: '35',
                                //       //   imageUrl: hotComboList[0]['storeLogo'],
                                //       //   isLike: true,
                                //       //   phone: hotComboList[0]['phone'],
                                //       //   ratingNum: double.parse(hotComboList[0]['ratingStar']),
                                //       //   storeName: hotComboList[0]['storeName'],
                                //       //   servicePage: 1,
                                //       // ),
                                //       CalendarPage(
                                //         servicesId: '5',
                                //         amount: '3',
                                //         discountData: this.widget.discountData,
                                //         methodPayment: methodPaymentList[0],
                                //       ),
                                //       false);
                                // } else {
                                // if (this.widget.fromBill == false) {
                                //   this.widget.tabController.animateTo(1);
                                // }
                                // GeneralHelper.navigateToScreen(
                                //     context,
                                //     CalendarPage(
                                //       servicesId: '5',
                                //       amount: '3',
                                //       discountData: this.widget.discountData,
                                //       methodPayment: methodPaymentList[0],
                                //     ),
                                //     false);
                                // }
                                print('ahihi');
                                // GeneralHelper.navigateToScreen(
                                //     context,
                                //     BillConfirm(
                                //       discountData: this.widget.discountData,
                                //       methodPayment: methodPaymentList[0],
                                //       isDiscount: false,
                                //       address: this.widget.address,
                                //       storeName: this.widget.storeName,
                                //       storeDiscount: '',
                                //       total: '',
                                //     ),
                                //     false);
                                var serviceTmp = myService.firstWhere(
                                    (eachService) =>
                                        eachService['id'] ==
                                        this.widget.serviceId);
                                serviceTmp['value']['isActive'] = true;
                                serviceTmp['amount'] =
                                    initServiceAmount.toString();
                                print(serviceTmp['amount'] + "  - 123123");
                                isServiceExisted = true;
                                GeneralHelper.navigateToScreen(
                                    context,
                                    BookingBillScreen(
                                      address: this.widget.address,
                                      storeName: this.widget.storeName,
                                      methodPayment: methodPaymentList[0],
                                    ),
                                    false);
                              },
                              child: Container(
                                height: getProportionateScreenHeight(50),
                                width: getProportionateScreenWidth(200),
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
                                    'Make Appointment',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : Container(
                        width: 10,
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
