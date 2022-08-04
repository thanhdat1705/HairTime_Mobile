import 'package:flutter/material.dart';
import 'package:project_hair_time_mobile/screens/chat/home_chat_screen.dart';
import 'package:project_hair_time_mobile/screens/main/services/main_screen_service.dart';
import 'package:project_hair_time_mobile/screens/notify/notify_screen.dart';
import 'package:project_hair_time_mobile/screens/profile/profile_screen.dart';
import 'package:project_hair_time_mobile/screens/search_store/components/search_body.dart';
import 'package:project_hair_time_mobile/shared/general_helpers/general_helpers.dart';
import 'package:project_hair_time_mobile/shared/size/size_config.dart';
import 'package:project_hair_time_mobile/shared_data/service_list.dart';
import 'package:project_hair_time_mobile/widgets/bottom_bar/curved_navigation_bar.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SearchBody(),
      bottomNavigationBar: CustomizedCurvedNavigationBar(
        index: 1,
        onTap: (index) {
          switch (index) {
            case 0:
              initMainScreen(context);
              break;
            case 1:
              {
                print('Search');
              }
              break;
            case 2:
              GeneralHelper.navigateToScreen(context, new NotifyScreen(), true);
              break;
            case 3:
              GeneralHelper.navigateToScreen(
                  context, new HomeChatScreen(), true);
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
