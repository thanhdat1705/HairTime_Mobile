import 'package:flutter/material.dart';
import 'package:project_hair_time_mobile/screens/bill_details/bill_detail_screen.dart';
import 'package:project_hair_time_mobile/screens/booking/booking_screen.dart';
import 'package:project_hair_time_mobile/screens/calendar_page/calendar_page.dart';
import 'package:project_hair_time_mobile/screens/discounts_store/discounts_store_screen.dart';
import 'package:project_hair_time_mobile/screens/main/main_screen.dart';
import 'package:project_hair_time_mobile/screens/booking_bill/booking_bill_screen.dart';
import 'package:project_hair_time_mobile/screens/search_store/search_screen.dart';
import 'package:project_hair_time_mobile/screens/service_detail/service_detail_screen.dart';
import 'package:project_hair_time_mobile/screens/splash/splash_screen.dart';
import 'package:project_hair_time_mobile/screens/thanks_you/thanks_you_screen.dart';
import 'package:project_hair_time_mobile/shared/shared_variables/contants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hair Time',
      theme: ThemeData(
          primaryColor: kPrimaryColor, scaffoldBackgroundColor: Colors.white),
      // home: CalendarPage(),
      // home: new SplashScreen(),
      // home: SearchScreen(),
      home: new SplashScreen(),
      // home: BillDetailScreen(),
      // home: BillDetailScreen(),
      // home: CalendarPage(servicesId: '5', amount: '4'),

      // home: ServiceDetailScreen(),
    );
  }
}
