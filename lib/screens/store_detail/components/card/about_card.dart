import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:project_hair_time_mobile/shared/shared_variables/contants.dart';
import 'package:project_hair_time_mobile/shared/size/size_config.dart';

class AboutCard extends StatefulWidget {
  final String phone;
  final String description;

  const AboutCard({
    Key key,
    this.phone,
    this.description,
  }) : super(key: key);
  @override
  _AboutCardState createState() => _AboutCardState();
}

class _AboutCardState extends State<AboutCard> {
  bool _isVisible = false;
  String tap = "See more";

  void showToast() {
    if (tap == "See less") {
      tap = "See more";
    } else {
      tap = "See less";
    }
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Information",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
          ),
          SizedBox(height: getProportionateScreenHeight(10)),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.description_outlined),
                SizedBox(width: getProportionateScreenWidth(15)),
                Expanded(
                  child: AutoSizeText(
                    this.widget.description,
                    style: TextStyle(fontSize: 14),
                    maxLines: 10,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(10)),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.av_timer_outlined,
                  size: 26,
                ),
                SizedBox(width: getProportionateScreenWidth(12)),
                RichText(
                  textAlign: TextAlign.end,
                  maxLines: 10,
                  text: TextSpan(
                    style: TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: "Open:\t",
                        style: TextStyle(fontSize: 13, color: Colors.green),
                      ),
                      TextSpan(
                        text: "09:00 AM - 10:00 PM",
                        style: TextStyle(fontSize: 13, color: blackText),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(10)),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.phone),
                SizedBox(width: getProportionateScreenWidth(15)),
                Text(
                  this.widget.phone,
                  style: TextStyle(fontSize: 13),
                ),
              ],
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(10)),
          Container(
            child: Row(
              children: [
                Text(
                  "Utilities:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
                SizedBox(width: getProportionateScreenWidth(24)),
                Image.network(
                  "https://raw.githubusercontent.com/sonhoang1809/Assets/master/Images/Project_Hair_Time/credit-card.png",
                  width: 40,
                ),
                SizedBox(width: getProportionateScreenWidth(40)),
                Image.network(
                  "https://raw.githubusercontent.com/sonhoang1809/Assets/master/Images/Project_Hair_Time/air-conditioner.png",
                  width: 40,
                ),
                SizedBox(width: getProportionateScreenWidth(40)),
                Image.network(
                  "https://raw.githubusercontent.com/sonhoang1809/Assets/master/Images/Project_Hair_Time/cashier.png",
                  width: 40,
                ),
              ],
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(10)),
          Visibility(
            visible: _isVisible,
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  margin:
                      EdgeInsets.only(left: getProportionateScreenWidth(85)),
                  child: Row(
                    children: [
                      // SizedBox(
                      //     width: getProportionateScreenHeight(1)),
                      Image.network(
                        "https://raw.githubusercontent.com/sonhoang1809/Assets/master/Images/Project_Hair_Time/free-parking.png",
                        width: 40,
                      ),
                      SizedBox(width: getProportionateScreenWidth(40)),
                      Image.network(
                        "https://raw.githubusercontent.com/sonhoang1809/Assets/master/Images/Project_Hair_Time/invoice.png",
                        width: 40,
                      ),
                      SizedBox(width: getProportionateScreenWidth(40)),
                      Image.network(
                        "https://raw.githubusercontent.com/sonhoang1809/Assets/master/Images/Project_Hair_Time/male-and-female.png",
                        width: 40,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                Container(
                  color: Colors.white,
                  margin:
                      EdgeInsets.only(left: getProportionateScreenWidth(85)),
                  child: Row(
                    children: [
                      Image.network(
                        "https://raw.githubusercontent.com/sonhoang1809/Assets/master/Images/Project_Hair_Time/water-bottle.png",
                        width: 40,
                      ),
                      SizedBox(width: getProportionateScreenWidth(40)),
                      Image.network(
                        "https://raw.githubusercontent.com/sonhoang1809/Assets/master/Images/Project_Hair_Time/wifi.png",
                        width: 40,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(10)),
          GestureDetector(
            onTap: () {
              showToast();
            },
            child: Container(
                color: Colors.white,
                margin: EdgeInsets.fromLTRB(88, 0.0, 0.0, 0),
                child: Text(
                  tap,
                  style: TextStyle(
                      fontSize: 13,
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.w500),
                )),
          ),
        ],
      ),
    );
  }
}
