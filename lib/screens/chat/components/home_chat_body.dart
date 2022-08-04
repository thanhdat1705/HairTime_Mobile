import 'package:flutter/material.dart';
import 'package:project_hair_time_mobile/screens/chatting/chat_screen.dart';
import 'package:project_hair_time_mobile/screens/chatting/components/chat_body.dart';
import 'package:project_hair_time_mobile/screens/main/services/main_screen_service.dart';
import 'package:project_hair_time_mobile/screens/profile/profile_screen.dart';
import 'package:project_hair_time_mobile/screens/search_store/search_screen.dart';
import 'package:project_hair_time_mobile/shared/general_helpers/general_helpers.dart';
import 'package:project_hair_time_mobile/shared/size/size_config.dart';
import 'package:project_hair_time_mobile/widgets/bottom_bar/curved_navigation_bar.dart';

import '../home_chat_screen.dart';

class HomeChatBody extends StatefulWidget {
  final bool checkMain;

  const HomeChatBody({Key key, this.checkMain}) : super(key: key);

  @override
  _HomeChatBodyState createState() => _HomeChatBodyState();
}

class _HomeChatBodyState extends State<HomeChatBody> {
  chattingCard(String storeName) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ChatBody(
            chattingName: storeName,
          ),
        ),
      ),
      child: Container(
        color: Colors.white,
        height: getProportionateScreenHeight(120),
        width: SizeConfig.screenWidth,
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(40)),
                border: Border.all(
                  width: 2,
                  color: Colors.blue[300],
                ),
                // shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              //  BoxDecoration(
              //     shape: BoxShape.circle,
              //     boxShadow: [
              //       BoxShadow(
              //         color: Colors.grey.withOpacity(0.5),
              //         spreadRadius: 2,
              //         blurRadius: 5,
              //       ),
              //     ],
              //   ),
              child: CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(
                    "https://raw.githubusercontent.com/sonhoang1809/Assets/master/Images/Project_Hair_Time/nguoidungfb.jpeg"),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.65,
              padding: EdgeInsets.only(
                left: 20,
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            storeName,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 5),
                            width: 7,
                            height: 7,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue,
                            ),
                          )
                        ],
                      ),
                      Text(
                        "12:30 pm",
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w300,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "I Love You",
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black54,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Colors.blue,
        elevation: 8,
        automaticallyImplyLeading: false,
        title: Text(
          'Inbox',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            chattingCard("Barber Vu Tri"),
            chattingCard("4Rau Barber"),
            chattingCard("Liem Barber"),
            chattingCard("VietHan Barber shop"),
            chattingCard("Beauty Salon"),
            chattingCard("Barber Vu Tri"),
            chattingCard("Barber Vu Tri"),
            chattingCard("Barber Vu Tri"),
          ],
        ),
      ),
    );
  }
}
