import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_hair_time_mobile/screens/calendar/components/calendar_noteable.dart';
import 'package:project_hair_time_mobile/screens/calendar/components/calendar_table.dart';
import 'package:project_hair_time_mobile/shared/size/size_config.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: getProportionateScreenWidth(30)),
              CalendarTable(),
              SizedBox(height: getProportionateScreenWidth(5)),
              Noteable(),
            ],
          ),
        ),
      ),
    );
  }
}
