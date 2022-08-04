import 'package:flutter/material.dart';
import 'package:project_hair_time_mobile/screens/update_profile/components/update_profile_body.dart';
import 'package:project_hair_time_mobile/shared/size/size_config.dart';

class UpdateProfileScreen extends StatefulWidget {
  UpdateProfileScreen({Key key}) : super(key: key);

  @override
  UpdateProfileScreenState createState() => new UpdateProfileScreenState();
}

class UpdateProfileScreenState extends State<UpdateProfileScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: UpdateProfilePage(),
    );
  }
}
