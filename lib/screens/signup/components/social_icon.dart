import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_hair_time_mobile/shared/shared_variables/contants.dart';

class SocalIcon extends StatelessWidget {
  final String iconSrc;
  final Function press;
  final double height;
  final double width;
  final double padding;

  const SocalIcon(
      {Key key,
      this.iconSrc,
      this.press,
      this.height,
      this.width,
      this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.all(this.padding),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: kPrimaryLightColor,
          ),
          shape: BoxShape.circle,
        ),
        child: SvgPicture.network(
          this.iconSrc,
          height: this.height,
          width: this.width,
        ),
      ),
    );
  }
}
