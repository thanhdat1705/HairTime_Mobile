import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:project_hair_time_mobile/screens/store_detail/detail_screen.dart';
import 'package:project_hair_time_mobile/shared/size/size_config.dart';
import 'package:project_hair_time_mobile/shared_data/stores_list.dart';
import 'package:project_hair_time_mobile/widgets/header_profile/header_profile.dart';

class FollowingPage extends StatefulWidget {
  @override
  _FollowingPageState createState() => _FollowingPageState();
}

class _FollowingPageState extends State<FollowingPage> {
  String _statusShop = 'Open';
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        resizeToAvoidBottomPadding: false,
        body: Container(
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              HeaderProfile(
                headerName: 'Favorite Store',
                paddingIcon: EdgeInsets.fromLTRB(
                    getProportionateScreenWidth(15),
                    0,
                    getProportionateScreenWidth(90),
                    0),
                heightContainer: getProportionateScreenHeight(30),
                widthContainer: getProportionateScreenWidth(30),
                widthIcon: getProportionateScreenWidth(30),
                widthText: getProportionateScreenWidth(30),
                textColor: Colors.black,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Container(
                height: getProportionateScreenHeight(630),
                width: getProportionateScreenWidth(400),
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: haircutStoresList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(15)),
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom: getProportionateScreenHeight(20)),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailScreen(
                                              address: haircutStoresList[index]
                                                  ['storeAddress'],
                                              description:
                                                  haircutStoresList[index]
                                                      ['description'],
                                              guestCheckout: '35',
                                              imageUrl: haircutStoresList[index]
                                                  ['storeLogo'],
                                              isLike: true,
                                              phone: haircutStoresList[index]
                                                  ['phone'],
                                              ratingNum: double.parse(
                                                  haircutStoresList[index]
                                                      ['ratingStar']),
                                              storeName:
                                                  haircutStoresList[index]
                                                      ['storeName'],
                                            )),
                                  );
                                },
                                child: Container(
                                  height: getProportionateScreenHeight(130),
                                  width: size.width,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 2,
                                        offset: Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        child: ClipRRect(
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                3.5,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                3,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                fit: BoxFit.fill,
                                                image: NetworkImage(
                                                  haircutStoresList[index]
                                                      ["storeLogo"],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: getProportionateScreenWidth(230),
                                        padding: EdgeInsets.fromLTRB(
                                            getProportionateScreenWidth(20),
                                            getProportionateScreenHeight(5),
                                            0,
                                            0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              width:
                                                  getProportionateScreenWidth(
                                                      210),
                                              height:
                                                  getProportionateScreenHeight(
                                                      30),
                                              child: Row(
                                                children: <Widget>[
                                                  Container(
                                                    width:
                                                        getProportionateScreenWidth(
                                                            175),
                                                    child: Text(
                                                      haircutStoresList[index]
                                                          ["storeName"],
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      softWrap: false,
                                                      style: TextStyle(
                                                        fontSize:
                                                            getProportionateScreenWidth(
                                                                16),
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width:
                                                        getProportionateScreenWidth(
                                                            30),
                                                    child: IconButton(
                                                      icon:
                                                          Icon(Icons.favorite),
                                                      color: Colors.red,
                                                      alignment:
                                                          Alignment.center,
                                                      padding:
                                                          new EdgeInsets.all(
                                                              2.0),
                                                      onPressed: () {
                                                        setState(() {
                                                          haircutStoresList
                                                              .removeAt(index);
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                                height:
                                                    getProportionateScreenHeight(
                                                        10)),
                                            Container(
                                              height:
                                                  getProportionateScreenHeight(
                                                      40),
                                              child: AutoSizeText(
                                                haircutStoresList[index]
                                                    ["storeAddress"],
                                                minFontSize:
                                                    getProportionateScreenWidth(
                                                        15),
                                                stepGranularity:
                                                    getProportionateScreenWidth(
                                                        15),
                                                maxLines: 3,
                                              ),
                                            ),
                                            SizedBox(
                                                height:
                                                    getProportionateScreenHeight(
                                                        10)),
                                            Text(
                                              this._statusShop,
                                              style: TextStyle(
                                                fontSize:
                                                    getProportionateScreenWidth(
                                                        15),
                                                color: Colors.greenAccent,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
