import 'package:flutter/cupertino.dart';
import 'package:project_hair_time_mobile/shared/shared_components/shared_background.dart';
import 'package:project_hair_time_mobile/shared/shared_variables/shared_variables.dart';
import 'package:project_hair_time_mobile/shared/size/size_config.dart';

class SignupBackground extends StatelessWidget {
  final List<Widget> childs;
  const SignupBackground({Key key, @required this.childs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SharedBackground(childs: <Widget>[
      // new Positioned(
      //   top: 0,
      //   left: 0,
      //   child: Image.network(
      //     TEMPLATETOPLEFT2,
      //     width: getProportionateScreenWidth(160),
      //   ),
      // ),
      // new Positioned(
      //   bottom: 0,
      //   left: 0,
      //   child: Image.network(
      //     TEMPLATEBOTTOMLEFT,
      //     width: getProportionateScreenWidth(130),
      //   ),
      // ),
      new SingleChildScrollView(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: this.childs,
        ),
      ),
    ]);
  }
}
