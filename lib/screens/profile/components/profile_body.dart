import 'package:auto_size_text/auto_size_text.dart';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:project_hair_time_mobile/screens/chat/home_chat_screen.dart';
import 'package:project_hair_time_mobile/screens/feedback/feedback_screen.dart';
import 'package:project_hair_time_mobile/screens/following/following_screen.dart';
import 'package:project_hair_time_mobile/screens/history/history_screen.dart';
import 'package:project_hair_time_mobile/screens/info/info_screen.dart';
import 'package:project_hair_time_mobile/screens/main/services/main_screen_service.dart';
import 'package:project_hair_time_mobile/screens/notify/notify_screen.dart';
import 'package:project_hair_time_mobile/screens/profile/components/container_profile.dart';
import 'package:project_hair_time_mobile/screens/search_store/search_screen.dart';
import 'package:project_hair_time_mobile/screens/splash/splash_screen.dart';
import 'package:project_hair_time_mobile/screens/update_profile/update_profile_screen.dart';
import 'package:project_hair_time_mobile/shared/general_helpers/general_helpers.dart';
import 'package:project_hair_time_mobile/shared/shared_variables/shared_variables.dart';
import 'package:project_hair_time_mobile/shared/size/size_config.dart';
import 'package:project_hair_time_mobile/widgets/bottom_bar/curved_navigation_bar.dart';

class ProfileBody extends StatefulWidget {
  ProfileBody({Key key}) : super(key: key);

  @override
  _ProfileBodyState createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  String _avatarPic = '';
  String _userName = '';
  String _typeAccount = '';
  String _userEmail = '';
  bool _longLengthUsername = false;
  bool _loginUser = true;
  @override
  void initState() {
    super.initState();
    if (!this._loginUser) {
      WidgetsBinding.instance
          .addPostFrameCallback((_) => _checkedLogin(context));
    } else {
      this._avatarPic =
          'https://raw.githubusercontent.com/sonhoang1809/Assets/master/Images/Project_Hair_Time/wolf.jpg';
      this._userName = 'Nguyen Thanh Dat';
      this._typeAccount = 'Customer';
      this._userEmail = 'dat.ngthanh1705@gmail.com';
      if (this._userName.trim().length > 23) {
        this._longLengthUsername = true;
      }
    }
  }

  void _checkedLogin(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Icon(Icons.info),
            Text("Info"),
          ],
        ),
        content: Text("You do not login at now!"),
        actions: <Widget>[
          FlatButton(
            child: const Text('Login'),
            onPressed: () {
              // Navigator.of(context).pop();
            },
          ),
          FlatButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    new Container(
                      // color: Colors.red,
                      width: SizeConfig.screenWidth,
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(
                          bottom: getProportionateScreenHeight(10)),
                      child: Text(
                        'My Profile',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(30),
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                          fontFamily: 'PlayBall'
                        ),
                      ),
                    ),
                    // SizedBox(width: getProportionateScreenWidth(65)),
                    // GestureDetector(
                    //     onTap: () {
                    //       Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //           builder: (context) => SplashScreen(),
                    //         ),
                    //       );
                    //     },
                    //     child: new Container(
                    //       padding: EdgeInsets.only(
                    //           right: getProportionateScreenWidth(10)),
                    //       child: Text(
                    //         "Logout",
                    //         style: TextStyle(
                    //             fontSize: 14,
                    //             fontWeight: FontWeight.w500,
                    //             decoration: TextDecoration.underline,
                    //             color: Colors.blue),
                    //       ),
                    //     ))
                  ],
                ),
                Material(
                  child: InkWell(
                    onTap: () {
                      if (this._loginUser) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UpdateProfileScreen()),
                        );
                      } else {
                        WidgetsBinding.instance.addPostFrameCallback(
                            (_) => _checkedLogin(context));
                      }
                    },
                    child: Container(
                      height: getProportionateScreenHeight(120),
                      width: getProportionateScreenWidth(330),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 5,
                            blurRadius: 20,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: <Widget>[
                          Container(
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                topLeft: Radius.circular(10),
                              ),
                              child: Container(
                                width: MediaQuery.of(context).size.width / 4,
                                height: MediaQuery.of(context).size.width / 3,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(_avatarPic),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                                  child: Container(
                                    height: this._longLengthUsername
                                        ? getProportionateScreenHeight(50)
                                        : getProportionateScreenHeight(30),
                                    width: getProportionateScreenWidth(220),
                                    child: AutoSizeText(
                                      this._userName,
                                      minFontSize: 18,
                                      stepGranularity: 18,
                                      maxLines: 2,
                                      style: TextStyle(
                                        fontSize:
                                            getProportionateScreenWidth(15),
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text(
                                    this._typeAccount,
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: getProportionateScreenWidth(13),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Container(
                                    height: getProportionateScreenHeight(40),
                                    width: getProportionateScreenWidth(220),
                                    child: AutoSizeText(
                                      this._userEmail,
                                      minFontSize: 15.5,
                                      stepGranularity: 15.5,
                                      maxLines: 2,
                                      style: TextStyle(
                                        fontSize:
                                            getProportionateScreenWidth(220),
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(28),
                    vertical: getProportionateScreenHeight(10),
                  ),
                  child: Container(
                    height: getProportionateScreenHeight(50),
                    alignment: Alignment.topLeft,
                    child: AutoSizeText(
                      'Hi, I am Dat.',
                      minFontSize: getProportionateScreenWidth(15),
                      stepGranularity: getProportionateScreenWidth(15),
                      maxLines: 4,
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: getProportionateScreenHeight(5),
                    bottom: getProportionateScreenHeight(5),
                  ),
                  child: Container(
                    height: getProportionateScreenHeight(600),
                    width: getProportionateScreenWidth(330),
                    child: Column(
                      children: <Widget>[
                        ContainerProfile(
                          typeOfPic: true,
                          svgFirstPicture: HISTORYPIC,
                          imagePicture: null,
                          textName: 'History Booking',
                          onTap: () {
                            if (this._loginUser) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HistoryScreen()),
                              );
                            } else {
                              WidgetsBinding.instance.addPostFrameCallback(
                                  (_) => _checkedLogin(context));
                            }
                          },
                        ),
                        ContainerProfile(
                          typeOfPic: true,
                          svgFirstPicture: ACTIVITIESPIC,
                          imagePicture: null,
                          textName: 'Favorite Store',
                          onTap: () {
                            if (this._loginUser) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FollowingScreen()),
                              );
                            } else {
                              WidgetsBinding.instance.addPostFrameCallback(
                                  (_) => _checkedLogin(context));
                            }
                          },
                        ),
                        ContainerProfile(
                          typeOfPic: false,
                          svgFirstPicture: null,
                          imagePicture: FEEDBACKPIC,
                          textName: 'Feedback App',
                          onTap: () {
                            if (this._loginUser) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FeedbackScreen()),
                              );
                            } else {
                              WidgetsBinding.instance.addPostFrameCallback(
                                  (_) => _checkedLogin(context));
                            }
                          },
                        ),
                        ContainerProfile(
                          typeOfPic: true,
                          svgFirstPicture: INFOPIC,
                          imagePicture: null,
                          textName: 'About Us',
                          onTap: () {
                            if (this._loginUser) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => InfoScreen()),
                              );
                            } else {
                              WidgetsBinding.instance.addPostFrameCallback(
                                  (_) => _checkedLogin(context));
                            }
                          },
                        ),
                        ContainerProfile(
                          typeOfPic: true,
                          svgFirstPicture: DOORWAY,
                          imagePicture: null,
                          textName: 'Logout',
                          onTap: () {
                            if (this._loginUser) {
                               Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SplashScreen(),
                            ),
                          );
                            } else {
                              WidgetsBinding.instance.addPostFrameCallback(
                                  (_) => _checkedLogin(context));
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: CustomizedCurvedNavigationBar(
          index: 4,
          onTap: (index) {
            switch (index) {
              case 0:
                initMainScreen(context);
                break;
              case 1:
                GeneralHelper.navigateToScreen(
                    context, new SearchScreen(), true);
                break;
              case 2:
                GeneralHelper.navigateToScreen(
                    context, new NotifyScreen(), true);
                break;
              case 3:
                GeneralHelper.navigateToScreen(
                    context, new HomeChatScreen(), true);
                break;
              case 4:
                break;
            }
          },
        ),
      ),
    );
  }
}
