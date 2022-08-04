import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:project_hair_time_mobile/shared/size/size_config.dart';

class CustomizedCurvedNavigationBar extends StatelessWidget {
  final int index;
  final Function onTap;
  const CustomizedCurvedNavigationBar(
      {@required this.index, @required this.onTap, Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new CurvedNavigationBar(
      backgroundColor: Colors.white,
      color: Colors.blue[200],
      buttonBackgroundColor: Colors.blue,
      height: getProportionateScreenHeight(50),
      animationDuration: Duration(
        milliseconds: 300,
      ),
      index: this.index,
      animationCurve: Curves.bounceInOut,
      items: <Widget>[
        Icon(MdiIcons.home, size: 30, color: Colors.white),
        Icon(MdiIcons.magnify, size: 30, color: Colors.white),
        Icon(MdiIcons.calendarCheck, size: 30, color: Colors.white),
        Icon(MdiIcons.messageText, size: 30, color: Colors.white),
        Icon(MdiIcons.accountEdit, size: 30, color: Colors.white),
      ],
      onTap: this.onTap,
    );
  }
}
