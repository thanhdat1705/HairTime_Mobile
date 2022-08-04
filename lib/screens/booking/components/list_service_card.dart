import 'package:flutter/material.dart';
import 'package:project_hair_time_mobile/shared/shared_variables/contants.dart';
import 'package:project_hair_time_mobile/shared/size/size_config.dart';

class ListServiceCard extends StatefulWidget {
  final String serviceName;
  final String servicePrice;

  const ListServiceCard({Key key, this.serviceName, this.servicePrice})
      : super(key: key);
  @override
  _ListServiceCardState createState() => _ListServiceCardState();
}

class _ListServiceCardState extends State<ListServiceCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: SizeConfig.screenHeight * 0.1 - 20,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 5),
            blurRadius: 8,
            color: kShadowColor,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 8,
            child: RichText(
              maxLines: 2,
              text: TextSpan(
                style: TextStyle(color: Colors.black),
                children: [
                  TextSpan(
                    text: this.widget.serviceName + "\n",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                  ),
                  TextSpan(
                    text: "\$" + this.widget.servicePrice,
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
