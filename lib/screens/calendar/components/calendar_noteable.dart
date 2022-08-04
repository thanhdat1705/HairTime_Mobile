import 'package:flutter/material.dart';
import 'package:project_hair_time_mobile/shared/shared_variables/contants.dart';
import 'package:project_hair_time_mobile/shared/size/size_config.dart';

class Noteable extends StatelessWidget {
  const Noteable({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(30)),
      // width: MediaQuery.of(context).size.width,
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenHeight * 0.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(getProportionateScreenWidth(50)),
          topRight: Radius.circular(getProportionateScreenWidth(50)),
        ),
        color: kSecondaryColor,
      ),
      child: Container(
        height: 200,
        width: 200,
        color: Colors.white,
        child: TextField(
          onChanged: (value) {},
          decoration: InputDecoration(
            fillColor: Colors.white,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintText: "Your notice",
            contentPadding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20),
              vertical: getProportionateScreenWidth(15),
            ),
          ),
        ),
      ),
    );
  }
}
