import 'package:flutter/material.dart';
import 'package:project_hair_time_mobile/screens/login/login_screen.dart';
import 'package:project_hair_time_mobile/screens/main/services/main_screen_service.dart';
import 'package:project_hair_time_mobile/screens/splash/components/splash_body.dart';
import 'package:project_hair_time_mobile/shared/general_helpers/general_helpers.dart';
import 'package:project_hair_time_mobile/shared/services/push_notification_manager.dart';
import 'package:project_hair_time_mobile/shared/size/size_config.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new SplashState();
  }
}

class SplashState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: new SplashBody(),
    );
  }

  @override
  void initState() {
    super.initState();
    GeneralHelper.delayTimeAndCallback(2, () {
      GeneralHelper.navigateToScreen(context, LoginScreen(), true);
      // PushNotificationsManager.initFirebaseMessaging().then((value) {
        
      // });
    });

    // GeneralHelper.delayTimeAndCallback(2, () {
    //   initMainScreen(context);
    // });
  }
}
