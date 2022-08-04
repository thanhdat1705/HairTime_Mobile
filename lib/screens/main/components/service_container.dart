import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_hair_time_mobile/shared/size/size_config.dart';

class ServiceContainer extends StatelessWidget {
  final Function onTap;
  final double heightContainer;
  final double widthContainer;
  final double heightSvgContainer;
  final double widthSvgContainer;
  final String svgPicture;
  final Color svgPictureColor;
  final String serviceName;
  final double fontSize;
  final Color fontColor;
  final FontWeight fontWeight;
  const ServiceContainer({
    Key key,
    @required this.onTap,
    @required this.heightContainer,
    @required this.widthContainer,
    @required this.heightSvgContainer,
    @required this.widthSvgContainer,
    @required this.svgPicture,
    @required this.svgPictureColor,
    @required this.serviceName,
    this.fontSize,
    this.fontColor,
    this.fontWeight,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new InkWell(
      onTap: this.onTap,
      splashColor: Colors.grey,
      child: Container(
        margin: EdgeInsets.fromLTRB(
            getProportionateScreenWidth(5),
            getProportionateScreenHeight(8),
            getProportionateScreenWidth(5),
            getProportionateScreenHeight(8)),
        height: this.heightContainer,
        width: this.widthContainer,
        child: Column(
          children: <Widget>[
            Container(
              height: this.heightSvgContainer,
              width: this.widthSvgContainer,
              child: SvgPicture.network(
                this.svgPicture,
                color: this.svgPictureColor,
              ),
            ),
            Text(
              this.serviceName,
              style: TextStyle(
                color: this.fontColor,
                fontSize: this.fontSize,
                fontWeight: this.fontWeight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
