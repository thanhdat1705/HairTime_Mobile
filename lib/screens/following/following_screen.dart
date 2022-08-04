import 'package:flutter/material.dart';
import 'package:project_hair_time_mobile/screens/following/components/following_body.dart';
import 'package:project_hair_time_mobile/shared/size/size_config.dart';

class FollowingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: FollowingPage(),
    );
  }
}
