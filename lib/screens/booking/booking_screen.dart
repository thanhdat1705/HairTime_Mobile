import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:project_hair_time_mobile/screens/booking/components/room.dart';
import 'package:project_hair_time_mobile/screens/booking/components/title_survey.dart';
import 'package:project_hair_time_mobile/screens/booking/data/data.dart';
import 'package:project_hair_time_mobile/screens/booking_bill/booking_bill_screen.dart';
import 'package:project_hair_time_mobile/screens/booking_bill/components/stepper.dart';
import 'package:project_hair_time_mobile/screens/methods_payment/data/methods_payment_data.dart';
import 'package:project_hair_time_mobile/screens/notify/notify_screen.dart';
import 'package:project_hair_time_mobile/screens/search_store/search_screen.dart';
import 'package:project_hair_time_mobile/shared/general_helpers/general_helpers.dart';
import 'package:project_hair_time_mobile/shared/size/size_config.dart';

import 'components/list_service_card.dart';
import 'models/stylist_model.dart';

List<dynamic> globalStylist = new List<dynamic>();

class BookingScreen extends StatefulWidget {
  final double totalPriceService;
  final String storeName;
  final String address;
  final bool isDiscount;
  final String storeDiscount;
  const BookingScreen(
      {Key key,
      this.totalPriceService,
      this.storeName,
      this.address,
      this.isDiscount,
      this.storeDiscount})
      : super(key: key);
  @override
  _BookingScreenState createState() => _BookingScreenState();
}

enum SingingCharacter { lafayette, jefferson }

class _BookingScreenState extends State<BookingScreen> {
  bool isChoosenOne = true;
  bool isChoosenTwo = false;
  bool isChoosenThree = false;
  bool tmpChoosen = false;
  bool tmpChoosenTwo = false;
  bool defaulChoosen = true;
  bool defaulChoosenTwo = true;
  String tmpValue = '';
  SingingCharacter _character = SingingCharacter.lafayette;
  bool isActive = false;
  List<Widget> itemProfile = new List<Widget>();
  List<Widget> itemProfileTwo = new List<Widget>();
  List<Widget> itemData = [];
  List<Widget> listService = [];
  int _value = 1;
  bool _isOther = false;
  TextEditingController _number = new TextEditingController();

  @override
  initState() {
    super.initState();
    getListTimeData();
    instanceProfilAvatar();
    instanceProfilAvatarTwo();
  }

  getAmountOfPerson(int amount) {
    if (amount == 4) {
      return int.parse(_number.text);
    } else {
      return amount;
    }
  }

  // void getServiceInList(List<dynamic> list) {
  //   List<Widget> listServiceData = [];
  //   list.forEach((eachService) {
  //     listServiceData.add(
  //       ListServiceCard(
  //         serviceName: eachService['value']['name'],
  //         servicePrice: eachService['value']['price'],
  //       ),
  //     );
  //   });
  //   setState(() {
  //     listService = listServiceData;
  //   });
  // }

  // confirmBookingCard(BuildContext context) {
  //   // set up the buttons
  //   Widget cancelButton = FlatButton(
  //     child: Text("Cancel"),
  //     onPressed: () {
  //       Navigator.pop(context);
  //     },
  //   );
  //   Widget confirmButton = FlatButton(
  //     child: Text("Confirm"),
  //     onPressed: () {
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => NotifyScreen(),
  //         ),
  //       );
  //     },
  //   );
  //   AlertDialog alert = AlertDialog(
  //     title: Text("Verify your booking card!"),
  //     content: Column(
  //       mainAxisSize: MainAxisSize.min,
  //       children: [
  //         Container(
  //           margin: EdgeInsets.only(bottom: getProportionateScreenHeight(10)),
  //           decoration: BoxDecoration(
  //             border: Border(
  //               bottom: BorderSide(
  //                 color: Colors.grey,
  //                 width: 1.0,
  //               ),
  //             ),
  //           ),
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.start,
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Text('Store: ',
  //                   style:
  //                       TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
  //               SizedBox(width: getProportionateScreenWidth(10)),
  //               Text(this.widget.storeName,
  //                   style: TextStyle(fontSize: 15), maxLines: 5),
  //             ],
  //           ),
  //         ),
  //         Container(
  //           margin: EdgeInsets.only(bottom: getProportionateScreenHeight(10)),
  //           decoration: BoxDecoration(
  //             border: Border(
  //               bottom: BorderSide(
  //                 color: Colors.grey,
  //                 width: 1.0,
  //               ),
  //             ),
  //           ),
  //           height: getProportionateScreenHeight(40),
  //           width: SizeConfig.screenWidth,
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.start,
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Text('Address: ',
  //                   style:
  //                       TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
  //               SizedBox(width: getProportionateScreenWidth(10)),
  //               Expanded(
  //                 child: AutoSizeText(
  //                   this.widget.address,
  //                   style: TextStyle(fontSize: 15),
  //                   maxLines: 5,
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //         Container(
  //           margin: EdgeInsets.only(bottom: getProportionateScreenHeight(10)),
  //           decoration: BoxDecoration(
  //             border: Border(
  //               bottom: BorderSide(
  //                 color: Colors.grey,
  //                 width: 1.0,
  //               ),
  //             ),
  //           ),
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.start,
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Text('Stylelist: ',
  //                   style:
  //                       TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
  //               SizedBox(width: getProportionateScreenWidth(10)),
  //               Text("Jane Doe", style: TextStyle(fontSize: 15), maxLines: 2),
  //             ],
  //           ),
  //         ),
  //         Container(
  //           margin: EdgeInsets.only(bottom: getProportionateScreenHeight(10)),
  //           decoration: BoxDecoration(
  //             border: Border(
  //               bottom: BorderSide(
  //                 color: Colors.grey,
  //                 width: 1.0,
  //               ),
  //             ),
  //           ),
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.start,
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Text('Date: ',
  //                   style:
  //                       TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
  //               SizedBox(width: getProportionateScreenWidth(10)),
  //               Text("31/10/2020", style: TextStyle(fontSize: 15), maxLines: 2),
  //             ],
  //           ),
  //         ),
  //         Container(
  //           margin: EdgeInsets.only(bottom: getProportionateScreenHeight(10)),
  //           decoration: BoxDecoration(
  //             border: Border(
  //               bottom: BorderSide(
  //                 color: Colors.grey,
  //                 width: 1.0,
  //               ),
  //             ),
  //           ),
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.start,
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Text('Appointment: ',
  //                   style:
  //                       TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
  //               SizedBox(width: getProportionateScreenWidth(10)),
  //               Text("16:30", style: TextStyle(fontSize: 15), maxLines: 5),
  //             ],
  //           ),
  //         ),
  //         Container(
  //           margin: EdgeInsets.only(bottom: getProportionateScreenHeight(10)),
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.start,
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Text('Service: ',
  //                   style:
  //                       TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
  //             ],
  //           ),
  //         ),
  //         Container(
  //           height: getProportionateScreenHeight(280),
  //           width: SizeConfig.screenWidth,
  //           // padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(25)),
  //           child: MediaQuery.removePadding(
  //             context: context,
  //             removeTop: true,
  //             removeBottom: true,
  //             child: ListView.builder(
  //               shrinkWrap: true,
  //               scrollDirection: Axis.vertical,
  //               itemCount: listService == null ? 0 : listService.length,
  //               // physics: const NeverScrollableScrollPhysics(),
  //               physics: BouncingScrollPhysics(),
  //               itemBuilder: (context, index) {
  //                 return listService[index];
  //               },
  //             ),
  //           ),
  //         ),
  //         Container(
  //           margin: EdgeInsets.only(
  //               top: getProportionateScreenHeight(10),
  //               bottom: getProportionateScreenHeight(10)),
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.start,
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Text('Total: ',
  //                   style:
  //                       TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
  //               Spacer(),
  //               Text("\$" + this.widget.totalPriceService.toString(),
  //                   style: TextStyle(fontSize: 15), maxLines: 5),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //     actions: [
  //       cancelButton,
  //       confirmButton,
  //     ],
  //   );

  //   // show the dialog
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return alert;
  //     },
  //   );
  // }

  void instanceProfilAvatar() {
    List<Widget> tmp = [];
    stylist.forEach((eachOnlineStylist) {
      tmp.add(Column(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                this.tmpValue = '';
                this.defaulChoosen = false;
                tmpChoosen = !tmpChoosen;
                eachOnlineStylist.isActive = !eachOnlineStylist.isActive;
                stylist.forEach((_eachOnlineStylist) {
                  if (_eachOnlineStylist.id != eachOnlineStylist.id) {
                    _eachOnlineStylist.isActive = false;
                  }
                });
              });
            },
            child: CircleAvatar(
              radius: 30.0,
              backgroundColor: Colors.amberAccent[400],
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
    stylistTwo.forEach((eachOnlineStylist) {
      tmp.add(Column(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                this.tmpValue = '';
                this.defaulChoosenTwo = false;
                tmpChoosenTwo = !tmpChoosenTwo;
                eachOnlineStylist.isActive = !eachOnlineStylist.isActive;
                stylistTwo.forEach((_eachOnlineStylist) {
                  if (_eachOnlineStylist.id != eachOnlineStylist.id) {
                    _eachOnlineStylist.isActive = false;
                  }
                });
              });
            },
            child: CircleAvatar(
              radius: 30.0,
              backgroundColor: Colors.amberAccent[400],
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

  viewBookTimeContainers(item) {
    return ListView.builder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: item.length,
      itemBuilder: (BuildContext context, int index) {
        return item[index];
        // return Container(height: 100, width: 100, color: Colors.amber);
      },
    );
  }

  void getListTimeData() {
    List<dynamic> responseList = [];
    if (isChoosenOne == true) {
      responseList = TIME_DATA;
    }
    if (isChoosenTwo == true) {
      responseList = TIME_DATA_TWO;
    }
    if (isChoosenThree == true) {
      responseList = TIME_DATA_THREE;
    }
    if (tmpChoosen == true) {
      responseList = JANE_DO;
    }
    if (tmpChoosenTwo == true) {
      responseList = MELANLE;
    }
    List<Widget> tmp = [];
    responseList.forEach((eachTimeData) {
      tmp.add(
        bookTimeContainer(
          eachTimeData['isEmpty'],
          eachTimeData['time'],
          eachTimeData['time'],
        ),
      );
    });
    setState(() {
      itemData = tmp;
    });
  }

  Container bookTimeContainer(bool isEmpty, String time, dynamic groupValue) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 0.5),
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
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                )
              : Text(
                  '$time',
                  style: TextStyle(
                    fontSize: 20.0,
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
                          color: Colors.red,
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
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 10.0),
                      //   child: InkWell(
                      //     onTap: () {
                      //       Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //           builder: (_) => SearchScreen(),
                      //         ),
                      //       );
                      //     },
                      //     child: Container(
                      //       decoration: BoxDecoration(
                      //         border: Border(
                      //           bottom: BorderSide(width: 1.0),
                      //         ),
                      //       ),
                      //       height: 30,
                      //       child: Center(
                      //         child: Text(
                      //           'another salon',
                      //           style: TextStyle(color: Colors.black),
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                )
              : Expanded(
                  child: Container(
                    width: 1,
                  ),
                ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    instanceProfilAvatar();
    instanceProfilAvatarTwo();
    getListTimeData();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Container(
          padding: EdgeInsets.only(right: getProportionateScreenWidth(20)),
          child: Text(
            'Booking',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: SizeConfig.screenWidth,
                    height: getProportionateScreenHeight(80),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(10),
                        vertical: getProportionateScreenHeight(10),
                      ),
                      child: Row(
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              setState(() {
                                this.isChoosenOne = !this.isChoosenOne;
                                if (this.isChoosenOne == true) {
                                  this.tmpValue = '';
                                  this.isChoosenTwo = false;
                                  this.isChoosenThree = false;
                                  this.tmpChoosen = false;
                                  this.defaulChoosen = true;
                                  this.defaulChoosenTwo = true;
                                  stylist.forEach((each) {
                                    each.isActive = false;
                                  });
                                  stylistTwo.forEach((each) {
                                    each.isActive = false;
                                  });
                                }
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: getProportionateScreenWidth(10),
                                vertical: getProportionateScreenHeight(10),
                              ),
                              width: SizeConfig.screenWidth * 0.3,
                              height: getProportionateScreenHeight(70),
                              color: isChoosenOne
                                  ? Colors.amberAccent[400]
                                  : Colors.grey,
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    'Today',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: getProportionateScreenWidth(12),
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    '04/11',
                                    style: TextStyle(
                                      fontSize: getProportionateScreenWidth(15),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              setState(() {
                                this.isChoosenTwo = !this.isChoosenTwo;
                                if (this.isChoosenTwo == true) {
                                  this.tmpValue = '';
                                  this.isChoosenOne = false;
                                  this.isChoosenThree = false;
                                  this.tmpChoosen = false;
                                  this.defaulChoosen = true;
                                  this.defaulChoosenTwo = true;
                                  stylist.forEach((each) {
                                    each.isActive = false;
                                  });
                                  stylistTwo.forEach((each) {
                                    each.isActive = false;
                                  });
                                }
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: getProportionateScreenWidth(10),
                                vertical: getProportionateScreenHeight(10),
                              ),
                              width: SizeConfig.screenWidth * 0.3,
                              height: getProportionateScreenHeight(70),
                              color: isChoosenTwo
                                  ? Colors.amberAccent[400]
                                  : Colors.grey,
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    'Tomorrow',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: getProportionateScreenWidth(12),
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    '05/11',
                                    style: TextStyle(
                                      fontSize: getProportionateScreenWidth(15),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              setState(() {
                                this.isChoosenThree = !this.isChoosenThree;
                                if (this.isChoosenThree == true) {
                                  this.tmpValue = '';
                                  this.isChoosenOne = false;
                                  this.isChoosenTwo = false;
                                  this.tmpChoosen = false;
                                  this.defaulChoosen = true;
                                  this.defaulChoosenTwo = true;
                                  stylist.forEach((each) {
                                    each.isActive = false;
                                  });
                                  stylistTwo.forEach((each) {
                                    each.isActive = false;
                                  });
                                }
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: getProportionateScreenWidth(10),
                                vertical: getProportionateScreenHeight(10),
                              ),
                              width: SizeConfig.screenWidth * 0.3,
                              height: getProportionateScreenHeight(70),
                              color: isChoosenThree
                                  ? Colors.amberAccent[400]
                                  : Colors.grey,
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    'N.Tomorrow',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: getProportionateScreenWidth(12),
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    '06/11',
                                    style: TextStyle(
                                      fontSize: getProportionateScreenWidth(15),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  LinePadding(),
                  TitleSurvey(text: '1. HAIR STYLIST'),
                  LinePadding(),
                  // Rooms(
                  //   onlineStylist: stylist,
                  // ),
//------------------------------------------------
                  Row(
                    children: [
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                this.defaulChoosen = !this.defaulChoosen;
                                stylist.forEach((e) {
                                  e.isActive = false;
                                });
                              });
                            },
                            child: Container(
                              child: CircleAvatar(
                                radius: 30.0,
                                backgroundColor: Colors.amberAccent[400],
                                child: CircleAvatar(
                                  radius: defaulChoosen ? 27.0 : 30.0,
                                  backgroundColor: Colors.grey[200],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Container(
                              child: Center(
                                child: Text(
                                  'Default Barber',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Container(
                          height: 100.0,
                          child: ListView.builder(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5.0, horizontal: 4.0),
                            scrollDirection: Axis.horizontal,
                            itemCount: stylist.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: itemProfile[index],
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
//------------------------------------------------
                  LinePadding(),
                  TitleSurvey(text: '2. AMOUNT OF PERSON'),
                  Row(
                    children: [
                      Container(
                        color: Colors.white,
                        alignment: Alignment.center,
                        height: getProportionateScreenHeight(50),
                        width: getProportionateScreenWidth(150),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                              value: _value,
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                              items: [
                                DropdownMenuItem(
                                  child: Text("1"),
                                  value: 1,
                                ),
                                DropdownMenuItem(
                                  child: Text("2"),
                                  value: 2,
                                ),
                                DropdownMenuItem(child: Text("3"), value: 3),
                                DropdownMenuItem(child: Text("Other"), value: 4)
                              ],
                              onChanged: (value) {
                                setState(() {
                                  _value = value;
                                  _isOther = false;
                                  if (value == 4) {
                                    _isOther = true;
                                  }
                                });
                              }),
                        ),
                      ),
                      Spacer(),
                      _isOther
                          ? Container(
                              alignment: Alignment.centerRight,
                              child: Container(
                                color: Colors.white,
                                width: SizeConfig.screenWidth * 0.5 - 10,
                                child: TextField(
                                  controller: _number,
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Enter amount of person',
                                    hintStyle: TextStyle(color: Colors.grey),
                                  ),
                                ),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                  LinePadding(),
                  // TitleSurvey(text: '2. FACE STYLIST'),
                  // LinePadding(),
                  // Row(
                  //   children: [
                  //     Column(
                  //       children: [
                  //         InkWell(
                  //           onTap: () {
                  //             setState(() {
                  //               this.defaulChoosenTwo = !this.defaulChoosenTwo;
                  //               stylistTwo.forEach((e) {
                  //                 e.isActive = false;
                  //               });
                  //             });
                  //           },
                  //           child: Container(
                  //             child: CircleAvatar(
                  //               radius: 30.0,
                  //               backgroundColor: Colors.amberAccent[400],
                  //               child: CircleAvatar(
                  //                 radius: defaulChoosenTwo ? 27.0 : 30.0,
                  //                 backgroundColor: Colors.grey[200],
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //         Padding(
                  //           padding: const EdgeInsets.symmetric(vertical: 5.0),
                  //           child: Container(
                  //             child: Center(
                  //               child: Text(
                  //                 'Default',
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
                  //               child: itemProfileTwo[index],
                  //             );
                  //           },
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),

                  // LinePadding(),
                  TitleSurvey(text: '3. MAKE APPOINTMENT'),
                  LinePadding(),
                  tmpValue != ''
                      ? Container(
                          height: getProportionateScreenHeight(300),
                          child: viewBookTimeContainers(itemData),
                        )
                      : Container(
                          height: getProportionateScreenHeight(400),
                          child: viewBookTimeContainers(itemData),
                        ),
                ],
              ),
            ),
          ),
          tmpValue != ''
              ? Container(
                  height: getProportionateScreenHeight(100),
                  width: getProportionateScreenWidth(400),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 0.5),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: getProportionateScreenWidth(30),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            tmpValue = '';
                            Navigator.pop(context);
                            // GeneralHelper.navigateToScreen(
                            //   context, Service, false);
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
                          print('$tmpValue, $isChoosenOne, $isActive');
                          GeneralHelper.navigateToScreen(
                              context,
                              BookingBillScreen(
                                address: this.widget.address,
                                storeName: this.widget.storeName,
                                isDiscount: this.widget.isDiscount,
                                total: this.widget.totalPriceService.toString(),
                                methodPayment: methodPaymentList[0],
                                amountOfPerson: this.getAmountOfPerson(_value),
                              ),
                              false);
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
                )
              : Container(
                  width: 10,
                ),
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

class _CreateRoomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 5, 15, 35),
      height: 100.0,
      child: OutlineButton(
        onPressed: () => print('Create Room'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        color: Colors.white,
        borderSide: BorderSide(
          width: 3.0,
          color: Colors.amberAccent[400],
        ),
        // textColor: Palette.facebookBlue,
        child: Icon(
          Icons.people,
          size: 55.0,
          color: Colors.black87,
        ),
      ),
    );
  }
}
