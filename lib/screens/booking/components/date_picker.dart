import 'package:flutter/material.dart';
import 'package:project_hair_time_mobile/screens/booking/components/instance_date_picker.dart';
import 'package:project_hair_time_mobile/shared/size/size_config.dart';

class DatePicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth,
      height: getProportionateScreenHeight(80),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(10),
          vertical: getProportionateScreenHeight(10),
        ),
        child: Row(
          children: <Widget>[
            InstanceDatePicker(isChoosen: true),
            Spacer(),
            InstanceDatePicker(isChoosen: false),
            Spacer(),
            InstanceDatePicker(isChoosen: false),
          ],
        ),
      ),
    );
  }
}
