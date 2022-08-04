import 'package:flutter/material.dart';
import 'package:project_hair_time_mobile/shared/size/size_config.dart';

class Steper extends StatelessWidget {
  final String steper1;
  final Color colorSteper1;
  final String contentSteper1;
  final Color colorBorderSteper1;
  final Color colorFillSteper1;
  final String steper2;
  final Color colorSteper2;
  final String contentSteper2;
  final Color colorBorderSteper2;
  final Color colorFillSteper2;
  final String steper3;
  final Color colorSteper3;
  final String contentSteper3;
  final Color colorBorderSteper3;
  final Color colorFillSteper3;
  final String steper4;
  final Color colorSteper4;
  final String contentSteper4;
  final Color colorBorderSteper4;
  final Color colorFillSteper4;

  const Steper(
      {Key key,
      this.steper1,
      this.colorSteper1,
      this.contentSteper1,
      this.colorBorderSteper1,
      this.colorFillSteper1,
      this.steper2,
      this.colorSteper2,
      this.contentSteper2,
      this.colorBorderSteper2,
      this.colorFillSteper2,
      this.steper3,
      this.colorSteper3,
      this.contentSteper3,
      this.colorBorderSteper3,
      this.colorFillSteper3,
      this.steper4,
      this.colorSteper4,
      this.contentSteper4,
      this.colorBorderSteper4,
      this.colorFillSteper4})
      : super(key: key);

  // const Steper(
  //     {Key key,
  //     @required this.steper1,
  //     @required this.contentSteper1,
  //     @required this.colorBorderSteper1,
  //     @required this.colorFillSteper1,
  //     @required this.steper2,
  //     @required this.contentSteper2,
  //     @required this.colorBorderSteper2,
  //     @required this.colorFillSteper2,
  //     @required this.steper3,
  //     @required this.contentSteper3,
  //     @required this.colorBorderSteper3,
  //     @required this.colorFillSteper3,
  //     @required this.colorSteper1,
  //     @required this.colorSteper2,
  //     @required this.colorSteper3})
  //     : super(key: key);

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
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      height: 40,
      width: SizeConfig.screenWidth,
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            stepper(this.contentSteper1, this.steper1, this.colorSteper1,
                this.colorFillSteper1, this.colorBorderSteper1),
            Container(
              width: getProportionateScreenWidth(35),
              height: 0,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1)),
            ),
            stepper(this.contentSteper2, this.steper2, this.colorSteper2,
                this.colorFillSteper2, this.colorBorderSteper2),
            Container(
              width: getProportionateScreenWidth(35),
              height: 0,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1)),
            ),
            stepper(this.contentSteper3, this.steper3, this.colorSteper3,
                this.colorFillSteper3, this.colorBorderSteper3),
            Container(
              width: getProportionateScreenWidth(35),
              height: 0,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1)),
            ),
            stepper(this.contentSteper4, this.steper4, this.colorSteper4,
                this.colorFillSteper4, this.colorBorderSteper4),
          ],
        ),
      ),
    );
  }
}
