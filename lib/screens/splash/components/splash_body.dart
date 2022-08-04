import 'package:flutter/material.dart';
import 'package:project_hair_time_mobile/shared/shared_variables/shared_variables.dart';
import 'package:project_hair_time_mobile/shared/size/size_config.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue[100],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: ColorFiltered(
                  child: Image.network(
                    APPLOGO,
                    fit: BoxFit.fill,
                    //height: getProportionateScreenHeight(90),
                  ),
                  colorFilter: ColorFilter.mode(Colors.blue, BlendMode.color),
                ),
              ),
              width: getProportionateScreenWidth(275),
              height: getProportionateScreenHeight(285),
            ),
            Container(
              height: getProportionateScreenHeight(50),
              margin: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(50),
              ),
              child: Row(
                children: <Widget>[
                  Text(
                    'Fast',
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(22),
                      color: Colors.blueGrey,
                    ),
                  ),
                  Spacer(),
                  Text(
                    'Convenient',
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(22),
                      color: Colors.blueGrey,
                    ),
                  ),
                  Spacer(),
                  Text(
                    'Fair',
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(22),
                      color: Colors.blueGrey,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(105)),
            Container(
              child: Text(
                'Version 3.0.0',
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(18),
                  color: Colors.blueGrey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
