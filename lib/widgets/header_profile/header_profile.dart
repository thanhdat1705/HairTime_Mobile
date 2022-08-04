import 'package:flutter/material.dart';
import 'package:project_hair_time_mobile/shared/size/size_config.dart';

class HeaderProfile extends StatelessWidget {
  final EdgeInsetsGeometry paddingIcon;
  final String headerName;
  final double heightContainer;
  final double widthContainer;
  final double widthIcon;
  final double widthText;
  final Color textColor;
  final Function onTap;
  const HeaderProfile({
    Key key,
    @required this.paddingIcon,
    @required this.headerName,
    @required this.heightContainer,
    @required this.widthContainer,
    @required this.widthIcon,
    @required this.widthText,
    @required this.textColor,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: EdgeInsets.only(
        top: getProportionateScreenHeight(10),
        bottom: getProportionateScreenHeight(10),
      ),
      child: new Row(
        children: <Widget>[
          new Padding(
            padding: this.paddingIcon,
            child: new Container(
              height: heightContainer,
              width: widthContainer,
              child: new InkWell(
                child: new Icon(
                  Icons.arrow_back_ios,
                  size: widthIcon,
                  color: Colors.black,
                ),
                onTap: this.onTap,
              ),
            ),
          ),
          new Container(
            child: Text(
              headerName,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: widthText,
                fontWeight: FontWeight.w900,
                color: this.textColor,
                fontFamily: 'PlayBall'
              ),
            ),
          ),
        ],
      ),
    );
  }
}
