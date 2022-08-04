import 'package:flutter/material.dart';
import 'package:project_hair_time_mobile/shared/size/size_config.dart';

class InstanceDatePicker extends StatefulWidget {
  InstanceDatePicker({
    Key key,
    @required this.isChoosen,
  }) : super(key: key);

  bool isChoosen;

  @override
  _InstanceDatePickerState createState() => _InstanceDatePickerState();
}

class _InstanceDatePickerState extends State<InstanceDatePicker> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('mamam');
        setState(() {
          this.widget.isChoosen = !this.widget.isChoosen;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(10),
          vertical: getProportionateScreenHeight(10),
        ),
        width: SizeConfig.screenWidth * 0.3,
        height: getProportionateScreenHeight(70),
        color: widget.isChoosen ? Colors.amberAccent : Colors.grey,
        child: Column(
          children: <Widget>[
            Text(
              'Today',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: getProportionateScreenWidth(12),
              ),
            ),
            Spacer(),
            Text(
              '26/10',
              style: TextStyle(
                fontSize: getProportionateScreenWidth(15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
