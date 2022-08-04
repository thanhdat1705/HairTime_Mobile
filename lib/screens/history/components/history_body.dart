import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:project_hair_time_mobile/screens/store_detail/detail_screen.dart';
import 'package:project_hair_time_mobile/shared/size/size_config.dart';
import 'package:project_hair_time_mobile/shared_data/reviews_list.dart';
import 'package:project_hair_time_mobile/widgets/header_profile/header_profile.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
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
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              HeaderProfile(
                headerName: 'History Booking',
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
                height: getProportionateScreenHeight(720),
                width: getProportionateScreenWidth(350),
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: reviewsList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.fromLTRB(
                          getProportionateScreenWidth(20),
                          0,
                          getProportionateScreenWidth(20),
                          0),
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom: getProportionateScreenHeight(35)),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailScreen(
                                          address: reviewsList[index]['storeAddress'],
                                          description: reviewsList[index]['description'],
                                          guestCheckout: '35',
                                          imageUrl: reviewsList[index]['storeLogo'],
                                          isLike: reviewsList[index]['isLike'],
                                          phone: reviewsList[index]['phone'],
                                          ratingNum: double.parse(reviewsList[index]['evaluativeUser']),
                                          storeName: reviewsList[index]['storeName'],
                                        )),
                                  );
                                },
                                child: Container(
                                  height: getProportionateScreenHeight(205),
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
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        height:
                                            getProportionateScreenHeight(115),
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: NetworkImage(
                                                  reviewsList[index]
                                                      ["storeLogo"]),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(
                                          getProportionateScreenWidth(10),
                                          0,
                                          getProportionateScreenWidth(10),
                                          getProportionateScreenHeight(5),
                                        ),
                                        child: Container(
                                          height:
                                              getProportionateScreenHeight(25),
                                          width: size.width,
                                          child: Text(
                                            reviewsList[index]["storeName"],
                                            style: TextStyle(
                                              fontSize:
                                                  getProportionateScreenWidth(
                                                      16),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(
                                          getProportionateScreenWidth(10),
                                          0,
                                          getProportionateScreenWidth(10),
                                          getProportionateScreenHeight(5),
                                        ),
                                        child: Container(
                                          height:
                                              getProportionateScreenHeight(20),
                                          width: size.width,
                                          child: Text(
                                            reviewsList[index]["storeAddress"],
                                            style: TextStyle(
                                              fontSize:
                                                  getProportionateScreenWidth(
                                                      13),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(
                                          getProportionateScreenWidth(10),
                                          0,
                                          getProportionateScreenWidth(10),
                                          getProportionateScreenHeight(5),
                                        ),
                                        child: Container(
                                          height:
                                              getProportionateScreenHeight(20),
                                          width: size.width,
                                          child: Row(
                                            children: <Widget>[
                                              Text(
                                                'Your point: ',
                                                style: TextStyle(
                                                  fontSize:
                                                      getProportionateScreenWidth(
                                                          13),
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              RatingBar(
                                                initialRating: double.parse(
                                                    reviewsList[index]
                                                        ["evaluativeUser"]),
                                                minRating: 1,
                                                direction: Axis.horizontal,
                                                allowHalfRating: true,
                                                itemCount: 5,
                                                itemSize:
                                                    getProportionateScreenWidth(
                                                        20),
                                                ignoreGestures: true,
                                                itemPadding: EdgeInsets.symmetric(
                                                    horizontal:
                                                        getProportionateScreenWidth(
                                                            3.0)),
                                                itemBuilder: (context, _) =>
                                                    Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                ),
                                                onRatingUpdate: (rating) {},
                                              ),
                                            ],
                                          ),
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
