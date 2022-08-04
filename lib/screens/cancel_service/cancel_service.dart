import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:project_hair_time_mobile/screens/bill_details/bill_detail_screen.dart';
import 'package:project_hair_time_mobile/screens/bill_details/data/service_user.dart';
import 'package:project_hair_time_mobile/screens/main/services/main_screen_service.dart';
import 'package:project_hair_time_mobile/shared/general_helpers/general_helpers.dart';
import 'package:project_hair_time_mobile/shared/size/size_config.dart';

class CancelServiceScreen extends StatefulWidget {
  List<ServiceUser> serviceUserData;
  CancelServiceScreen({Key key, this.serviceUserData}) : super(key: key);

  @override
  _CancelServiceScreenState createState() => _CancelServiceScreenState();
}

class _CancelServiceScreenState extends State<CancelServiceScreen> {
  List<ServiceUser> serviceUserList;
  final String pictureStore =
      'https://raw.githubusercontent.com/sonhoang1809/Assets/master/Images/Project_Hair_Time/hairBarber.jpg';
  final String store =
      'https://raw.githubusercontent.com/sonhoang1809/Assets/master/Images/Project_Hair_Time/shops.svg';
  final String addressStore =
      'https://raw.githubusercontent.com/sonhoang1809/Assets/master/Images/Project_Hair_Time/address.svg';
  DateTime dateTime = new DateTime.now();
  bool customer1 = true;
  bool customer2 = true;
  bool haircutCustomer1 = true;
  bool facialCustomer1 = true;
  bool beardDesignCustomer1 = true;

  bool haircutCustomer2 = true;
  bool facialCustomer2 = true;
  bool beardDesignCustomer2 = true;
  @override
  void initState() {
    super.initState();
    this.serviceUserList = this.widget.serviceUserData;
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
            GeneralHelper.delayTimeAndCallback(2, () {
              initMainScreen(context);
            });
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

  Widget dialogCancelEachService(Function agree) {
    return AlertDialog(
      title: Text("Please tell us the reason"),
      content: TextField(
        maxLength: null,
        maxLines: null,
      ),
      actions: [
        FlatButton(
          child: Text('OK'),
          onPressed: agree,
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

  Widget dialogCancelCustomer(Function agree) {
    return AlertDialog(
      title: Text("Please tell us the reason"),
      content: TextField(
        maxLength: null,
        maxLines: null,
      ),
      actions: [
        FlatButton(
          child: Text('OK'),
          onPressed: agree,
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
                Container(
                  padding: EdgeInsets.fromLTRB(getProportionateScreenWidth(30),
                      getProportionateScreenHeight(10), 0, 0),
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Bill Detail',
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(30),
                      color: Colors.blue,
                      fontFamily: 'PlayBall',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
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
                                    '\t' + '78 Ngô Đức Kế, Q.1, TP. HCM' + '\n',
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
                  height: getProportionateScreenHeight(520),
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
                        height: getProportionateScreenHeight(490),
                        width: getProportionateScreenWidth(400),
                        child: Column(
                          children: <Widget>[
                            Visibility(
                              visible: this.customer1,
                              child: Container(
                                width: getProportionateScreenWidth(400),
                                padding: EdgeInsets.symmetric(
                                    horizontal: getProportionateScreenWidth(5),
                                    vertical: getProportionateScreenHeight(5)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Nguyen Thanh Dat - 0909065656',
                                          // + this.serviceUserList[0].username,
                                          style: TextStyle(
                                            fontSize:
                                                getProportionateScreenWidth(15),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Container(
                                          width:
                                              getProportionateScreenWidth(100),
                                          height:
                                              getProportionateScreenHeight(30),
                                          margin: EdgeInsets.only(
                                              left: getProportionateScreenWidth(
                                                  10)),
                                          color: Colors.blue[200],
                                          child: FlatButton(
                                            onPressed: () {
                                              showDialog(
                                                  context: context,
                                                  builder: (_) => this
                                                          .dialogCancelEachService(
                                                              () {
                                                        setState(() {
                                                          this.customer1 =
                                                              false;
                                                          Navigator.pop(
                                                              context);
                                                        });
                                                      }),
                                                  barrierDismissible: false);
                                            },
                                            child: Text(
                                              'Cancel',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Visibility(
                                      visible: this.haircutCustomer1,
                                      child: Container(
                                        width: getProportionateScreenWidth(400),
                                        margin: EdgeInsets.only(
                                            left:
                                                getProportionateScreenWidth(20),
                                            top: getProportionateScreenHeight(
                                                5)),
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                              width:
                                                  getProportionateScreenWidth(
                                                      150),
                                              child: Text(
                                                'Haircut',
                                                style: TextStyle(
                                                  fontSize:
                                                      getProportionateScreenWidth(
                                                          14),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width:
                                                  getProportionateScreenWidth(
                                                      100),
                                              height:
                                                  getProportionateScreenHeight(
                                                      30),
                                              color: Colors.blue[200],
                                              child: FlatButton(
                                                onPressed: () {
                                                  showDialog(
                                                      context: context,
                                                      builder: (_) => this
                                                              .dialogCancelEachService(
                                                                  () {
                                                            setState(() {
                                                              this.haircutCustomer1 =
                                                                  false;
                                                              Navigator.pop(
                                                                  context);
                                                            });
                                                          }),
                                                      barrierDismissible:
                                                          false);
                                                },
                                                child: Text(
                                                  'Cancel',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left:
                                                      getProportionateScreenWidth(
                                                          20)),
                                              width:
                                                  getProportionateScreenWidth(
                                                      50),
                                              child: Text(
                                                '\$3.5',
                                                style: TextStyle(
                                                  fontSize:
                                                      getProportionateScreenWidth(
                                                          14),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Visibility(
                                      visible: this.haircutCustomer1,
                                      child: Container(
                                        width: getProportionateScreenWidth(400),
                                        margin: EdgeInsets.only(
                                            left: getProportionateScreenWidth(
                                                60)),
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                              width:
                                                  getProportionateScreenWidth(
                                                      280),
                                              child: Text(
                                                'Service staff: Alan Dark',
                                                style: TextStyle(
                                                  fontSize:
                                                      getProportionateScreenWidth(
                                                          12.5),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Visibility(
                                      visible: this.haircutCustomer1,
                                      child: Container(
                                        width: getProportionateScreenWidth(400),
                                        margin: EdgeInsets.only(
                                            left: getProportionateScreenWidth(
                                                60)),
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                              width:
                                                  getProportionateScreenWidth(
                                                      280),
                                              child: Text(
                                                'Time service: ' +
                                                    DateFormat(
                                                            'kk:mm EEE d MMM y')
                                                        .format(dateTime),
                                                style: TextStyle(
                                                  fontSize:
                                                      getProportionateScreenWidth(
                                                          12.5),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Visibility(
                                      visible: this.facialCustomer1,
                                      child: Container(
                                        width: getProportionateScreenWidth(400),
                                        margin: EdgeInsets.only(
                                            left: getProportionateScreenWidth(
                                                20)),
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                              width:
                                                  getProportionateScreenWidth(
                                                      150),
                                              child: Text(
                                                'Facial',
                                                style: TextStyle(
                                                  fontSize:
                                                      getProportionateScreenWidth(
                                                          14),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width:
                                                  getProportionateScreenWidth(
                                                      100),
                                              height:
                                                  getProportionateScreenHeight(
                                                      30),
                                              color: Colors.blue[200],
                                              child: FlatButton(
                                                onPressed: () {
                                                  showDialog(
                                                      context: context,
                                                      builder: (_) => this
                                                              .dialogCancelEachService(
                                                                  () {
                                                            setState(() {
                                                              this.facialCustomer1 =
                                                                  false;
                                                              Navigator.pop(
                                                                  context);
                                                            });
                                                          }),
                                                      barrierDismissible:
                                                          false);
                                                },
                                                child: Text(
                                                  'Cancel',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width:
                                                  getProportionateScreenWidth(
                                                      50),
                                              margin: EdgeInsets.only(
                                                  left:
                                                      getProportionateScreenWidth(
                                                          20)),
                                              child: Text(
                                                '\$2.7',
                                                style: TextStyle(
                                                  fontSize:
                                                      getProportionateScreenWidth(
                                                          14),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Visibility(
                                      visible: this.facialCustomer1,
                                      child: Container(
                                        width: getProportionateScreenWidth(400),
                                        margin: EdgeInsets.only(
                                            left: getProportionateScreenWidth(
                                                60)),
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                              width:
                                                  getProportionateScreenWidth(
                                                      280),
                                              child: Text(
                                                'Service staff: Las Luna',
                                                style: TextStyle(
                                                  fontSize:
                                                      getProportionateScreenWidth(
                                                          12.5),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Visibility(
                                      visible: this.facialCustomer1,
                                      child: Container(
                                        width: getProportionateScreenWidth(400),
                                        margin: EdgeInsets.only(
                                            left: getProportionateScreenWidth(
                                                60)),
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                              width:
                                                  getProportionateScreenWidth(
                                                      280),
                                              child: Text(
                                                'Time service: ' +
                                                    DateFormat(
                                                            'kk:mm EEE d MMM y')
                                                        .format(dateTime),
                                                style: TextStyle(
                                                  fontSize:
                                                      getProportionateScreenWidth(
                                                          12.5),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Visibility(
                                      visible: this.beardDesignCustomer1,
                                      child: Container(
                                        width: getProportionateScreenWidth(400),
                                        margin: EdgeInsets.only(
                                            left: getProportionateScreenWidth(
                                                20)),
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                              width:
                                                  getProportionateScreenWidth(
                                                      150),
                                              child: Text(
                                                'Beard Design',
                                                style: TextStyle(
                                                  fontSize:
                                                      getProportionateScreenWidth(
                                                          14),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width:
                                                  getProportionateScreenWidth(
                                                      100),
                                              height:
                                                  getProportionateScreenHeight(
                                                      30),
                                              color: Colors.blue[200],
                                              child: FlatButton(
                                                onPressed: () {
                                                  showDialog(
                                                      context: context,
                                                      builder: (_) => this
                                                              .dialogCancelEachService(
                                                                  () {
                                                            setState(() {
                                                              this.beardDesignCustomer1 =
                                                                  false;
                                                              Navigator.pop(
                                                                  context);
                                                            });
                                                          }),
                                                      barrierDismissible:
                                                          false);
                                                },
                                                child: Text(
                                                  'Cancel',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left:
                                                      getProportionateScreenWidth(
                                                          20)),
                                              width:
                                                  getProportionateScreenWidth(
                                                      50),
                                              child: Text(
                                                '\$5.2',
                                                style: TextStyle(
                                                  fontSize:
                                                      getProportionateScreenWidth(
                                                          14),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Visibility(
                                      visible: this.beardDesignCustomer1,
                                      child: Container(
                                        width: getProportionateScreenWidth(400),
                                        margin: EdgeInsets.only(
                                            left: getProportionateScreenWidth(
                                                60)),
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                              width:
                                                  getProportionateScreenWidth(
                                                      280),
                                              child: Text(
                                                'Service staff: Badin Alark',
                                                style: TextStyle(
                                                  fontSize:
                                                      getProportionateScreenWidth(
                                                          12.5),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Visibility(
                                      visible: this.beardDesignCustomer1,
                                      child: Container(
                                        width: getProportionateScreenWidth(400),
                                        margin: EdgeInsets.only(
                                            left: getProportionateScreenWidth(
                                                60)),
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                              width:
                                                  getProportionateScreenWidth(
                                                      280),
                                              child: Text(
                                                'Time service: ' +
                                                    DateFormat(
                                                            'kk:mm EEE d MMM y')
                                                        .format(dateTime),
                                                style: TextStyle(
                                                  fontSize:
                                                      getProportionateScreenWidth(
                                                          12.5),
                                                ),
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
                            Visibility(
                              visible: this.customer2,
                              child: Container(
                                width: getProportionateScreenWidth(400),
                                padding: EdgeInsets.symmetric(
                                    horizontal: getProportionateScreenWidth(5),
                                    vertical: getProportionateScreenHeight(5)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Dang Hoang Son - 0789008130',
                                          // + this.serviceUserList[1].username,
                                          style: TextStyle(
                                            fontSize:
                                                getProportionateScreenWidth(15),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Container(
                                          width:
                                              getProportionateScreenWidth(100),
                                          height:
                                              getProportionateScreenHeight(30),
                                          margin: EdgeInsets.only(
                                              left: getProportionateScreenWidth(
                                                  20)),
                                          color: Colors.blue[200],
                                          child: FlatButton(
                                            onPressed: () {
                                              showDialog(
                                                  context: context,
                                                  builder: (_) => this
                                                          .dialogCancelEachService(
                                                              () {
                                                        setState(() {
                                                          this.customer2 =
                                                              false;
                                                          Navigator.pop(
                                                              context);
                                                        });
                                                      }),
                                                  barrierDismissible: false);
                                            },
                                            child: Text(
                                              'Cancel',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      width: getProportionateScreenWidth(400),
                                      margin: EdgeInsets.only(
                                          left: getProportionateScreenWidth(20),
                                          top: getProportionateScreenHeight(5)),
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                            width: getProportionateScreenWidth(
                                                150),
                                            child: Text(
                                              'Haircut',
                                              style: TextStyle(
                                                fontSize:
                                                    getProportionateScreenWidth(
                                                        14),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: getProportionateScreenWidth(
                                                100),
                                            height:
                                                getProportionateScreenHeight(
                                                    30),
                                            color: Colors.blue[200],
                                            child: FlatButton(
                                              onPressed: () {
                                                showDialog(
                                                    context: context,
                                                    builder: (_) => this
                                                        .dialogCancelEachService(
                                                            () {}),
                                                    barrierDismissible: false);
                                              },
                                              child: Text(
                                                'Cancel',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                left:
                                                    getProportionateScreenWidth(
                                                        20)),
                                            width:
                                                getProportionateScreenWidth(50),
                                            child: Text(
                                              '\$3.5',
                                              style: TextStyle(
                                                fontSize:
                                                    getProportionateScreenWidth(
                                                        14),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: getProportionateScreenWidth(400),
                                      margin: EdgeInsets.only(
                                          left:
                                              getProportionateScreenWidth(60)),
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                            width: getProportionateScreenWidth(
                                                280),
                                            child: Text(
                                              'Service staff: Wage Scale',
                                              style: TextStyle(
                                                fontSize:
                                                    getProportionateScreenWidth(
                                                        12.5),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: getProportionateScreenWidth(400),
                                      margin: EdgeInsets.only(
                                          left:
                                              getProportionateScreenWidth(60)),
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                            width: getProportionateScreenWidth(
                                                280),
                                            child: Text(
                                              'Time service: ' +
                                                  DateFormat(
                                                          'kk:mm EEE d MMM y')
                                                      .format(dateTime),
                                              style: TextStyle(
                                                fontSize:
                                                    getProportionateScreenWidth(
                                                        12.5),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: getProportionateScreenWidth(400),
                                      margin: EdgeInsets.only(
                                          left:
                                              getProportionateScreenWidth(20)),
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                            width: getProportionateScreenWidth(
                                                150),
                                            child: Text(
                                              'Facial',
                                              style: TextStyle(
                                                fontSize:
                                                    getProportionateScreenWidth(
                                                        14),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: getProportionateScreenWidth(
                                                100),
                                            height:
                                                getProportionateScreenHeight(
                                                    30),
                                            color: Colors.blue[200],
                                            child: FlatButton(
                                              onPressed: () {
                                                showDialog(
                                                    context: context,
                                                    builder: (_) => this
                                                        .dialogCancelEachService(
                                                            () {}),
                                                    barrierDismissible: false);
                                              },
                                              child: Text(
                                                'Cancel',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width:
                                                getProportionateScreenWidth(50),
                                            margin: EdgeInsets.only(
                                                left:
                                                    getProportionateScreenWidth(
                                                        20)),
                                            child: Text(
                                              '\$2.7',
                                              style: TextStyle(
                                                fontSize:
                                                    getProportionateScreenWidth(
                                                        14),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: getProportionateScreenWidth(400),
                                      margin: EdgeInsets.only(
                                          left:
                                              getProportionateScreenWidth(60)),
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                            width: getProportionateScreenWidth(
                                                280),
                                            child: Text(
                                              'Service staff: Scapton',
                                              style: TextStyle(
                                                fontSize:
                                                    getProportionateScreenWidth(
                                                        12.5),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: getProportionateScreenWidth(400),
                                      margin: EdgeInsets.only(
                                          left:
                                              getProportionateScreenWidth(60)),
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                            width: getProportionateScreenWidth(
                                                280),
                                            child: Text(
                                              'Time service: ' +
                                                  DateFormat(
                                                          'kk:mm EEE d MMM y')
                                                      .format(dateTime),
                                              style: TextStyle(
                                                fontSize:
                                                    getProportionateScreenWidth(
                                                        12.5),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: getProportionateScreenWidth(400),
                                      margin: EdgeInsets.only(
                                          left:
                                              getProportionateScreenWidth(20)),
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                            width: getProportionateScreenWidth(
                                                150),
                                            child: Text(
                                              'Beard Design',
                                              style: TextStyle(
                                                fontSize:
                                                    getProportionateScreenWidth(
                                                        14),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: getProportionateScreenWidth(
                                                100),
                                            height:
                                                getProportionateScreenHeight(
                                                    30),
                                            color: Colors.blue[200],
                                            child: FlatButton(
                                              onPressed: () {
                                                showDialog(
                                                    context: context,
                                                    builder: (_) => this
                                                        .dialogCancelEachService(
                                                            () {}),
                                                    barrierDismissible: false);
                                              },
                                              child: Text(
                                                'Cancel',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width:
                                                getProportionateScreenWidth(50),
                                            margin: EdgeInsets.only(
                                                left:
                                                    getProportionateScreenWidth(
                                                        20)),
                                            child: Text(
                                              '\$5.2',
                                              style: TextStyle(
                                                fontSize:
                                                    getProportionateScreenWidth(
                                                        14),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: getProportionateScreenWidth(400),
                                      margin: EdgeInsets.only(
                                          left:
                                              getProportionateScreenWidth(60)),
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                            width: getProportionateScreenWidth(
                                                280),
                                            child: Text(
                                              'Service staff: Las Luna',
                                              style: TextStyle(
                                                fontSize:
                                                    getProportionateScreenWidth(
                                                        12.5),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: getProportionateScreenWidth(400),
                                      margin: EdgeInsets.only(
                                          left:
                                              getProportionateScreenWidth(60)),
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                            width: getProportionateScreenWidth(
                                                280),
                                            child: Text(
                                              'Time service: ' +
                                                  DateFormat(
                                                          'kk:mm EEE d MMM y')
                                                      .format(dateTime),
                                              style: TextStyle(
                                                fontSize:
                                                    getProportionateScreenWidth(
                                                        12.5),
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
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: getProportionateScreenHeight(130),
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
                                width: getProportionateScreenWidth(290),
                                child: Text('Subtotal'),
                              ),
                              Container(
                                width: getProportionateScreenWidth(50),
                                child: Text('\$22.8'),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            bottom: getProportionateScreenHeight(5),
                          ),
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: getProportionateScreenWidth(295),
                                child: Text('Promotion'),
                              ),
                              Container(
                                width: getProportionateScreenWidth(50),
                                child: Text('-30%'),
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
                                width: getProportionateScreenWidth(290),
                                child: Text(
                                  'Payment methods',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                width: getProportionateScreenWidth(50),
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
                                  ),
                                ),
                              ),
                              Container(
                                width: getProportionateScreenWidth(70),
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
                                        text: '\t15.96',
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
                Container(
                  width: getProportionateScreenWidth(400),
                  margin: EdgeInsets.fromLTRB(
                    getProportionateScreenWidth(20),
                    0,
                    // getProportionateScreenHeight(100),
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
                      'Cancel all services',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: getProportionateScreenWidth(18),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: getProportionateScreenWidth(400),
                  margin: EdgeInsets.fromLTRB(
                    getProportionateScreenWidth(20),
                    0,
                    // getProportionateScreenHeight(100),
                    getProportionateScreenWidth(20),
                    getProportionateScreenHeight(10),
                  ),
                  color: Colors.blue[200],
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BillDetailScreen()),
                      );
                    },
                    child: Text(
                      'Back',
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
