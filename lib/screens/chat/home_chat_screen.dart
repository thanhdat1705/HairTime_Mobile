import 'package:flutter/material.dart';
import 'package:project_hair_time_mobile/screens/main/services/main_screen_service.dart';
import 'package:project_hair_time_mobile/screens/notify/notify_screen.dart';
import 'package:project_hair_time_mobile/screens/profile/profile_screen.dart';
import 'package:project_hair_time_mobile/screens/search_store/search_screen.dart';
import 'package:project_hair_time_mobile/shared/general_helpers/general_helpers.dart';
import 'package:project_hair_time_mobile/shared/size/size_config.dart';
import 'package:project_hair_time_mobile/widgets/bottom_bar/curved_navigation_bar.dart';

import 'components/home_chat_body.dart';

class HomeChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: new HomeChatBody(),
      bottomNavigationBar: CustomizedCurvedNavigationBar(
        index: 3,
        onTap: (index) {
          switch (index) {
            case 0:
              initMainScreen(context);
              break;
            case 1:
              GeneralHelper.navigateToScreen(context, new SearchScreen(), true);
              break;
            case 2:
              GeneralHelper.navigateToScreen(context, new NotifyScreen(), true);
              break;
            case 3:
              {}
              break;
            case 4:
              GeneralHelper.navigateToScreen(
                  context, new ProfileScreen(), true);
              break;
          }
        },
      ),
    );
  }
}
