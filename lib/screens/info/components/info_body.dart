import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:project_hair_time_mobile/shared/size/size_config.dart';

class InfoPage extends StatefulWidget {
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  final String _logoApp =
      'https://raw.githubusercontent.com/sonhoang1809/Assets/master/Images/Project_Hair_Time/logo.PNG';
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 20),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Container(
                    height: getProportionateScreenHeight(30),
                    width: getProportionateScreenWidth(30),
                    child: InkWell(
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: getProportionateScreenWidth(30),
                        color: Colors.black,
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  color: Colors.blue[50],
                  height: getProportionateScreenHeight(380),
                  width: getProportionateScreenWidth(350),
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: <Widget>[
                      Container(
                        width: size.width,
                        height: size.height * 0.5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, bottom: 5),
                              child: Container(
                                height: getProportionateScreenHeight(42),
                                width: getProportionateScreenWidth(120),
                                child: Text(
                                  'About',
                                  style: TextStyle(
                                    color: Colors.orange,
                                    fontSize: getProportionateScreenWidth(36),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 85, bottom: 5),
                              height: getProportionateScreenHeight(42),
                              width: getProportionateScreenWidth(120),
                              child: Text(
                                'Us',
                                style: TextStyle(
                                  color: Colors.orange,
                                  fontSize: getProportionateScreenWidth(36),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 20),
                              height: getProportionateScreenHeight(140),
                              width: getProportionateScreenWidth(130),
                              child: AutoSizeText(
                                'We are from FPT University. Our mission is the convenience by using the technology',
                                minFontSize: 17,
                                stepGranularity: 17,
                                maxLines: 6,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              height: getProportionateScreenHeight(130),
                              width: getProportionateScreenWidth(350),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                      height: getProportionateScreenHeight(125),
                                      width: getProportionateScreenWidth(300),
                                      child: AutoSizeText(
                                        'Therefore, we wanna create an app that can help the haircut & salon stores connect to the customer easier and opposite.',
                                        minFontSize: 21,
                                        stepGranularity: 21,
                                        maxLines: 6,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: getProportionateScreenWidth(195),
                        height: getProportionateScreenHeight(210),
                        child: ClipRRect(
                          child: Container(
                            width: size.width,
                            height: size.height,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(_logoApp),
                                colorFilter: ColorFilter.mode(
                                    Colors.grey[50], BlendMode.modulate),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
