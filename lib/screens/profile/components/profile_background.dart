import 'package:flutter/material.dart';
import 'package:project_hair_time_mobile/shared/shared_components/shared_background.dart';

class ProfileBackground extends StatelessWidget {
  final List<Widget> childs;
  const ProfileBackground({Key key, @required this.childs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SharedBackground(
      childs: <Widget>[
        new SingleChildScrollView(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: this.childs,
          ),
        ),
      ],
    );
  }
}
