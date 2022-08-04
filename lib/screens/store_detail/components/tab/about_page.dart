import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:project_hair_time_mobile/screens/main/components/booking_recently_container.dart';
import 'package:project_hair_time_mobile/shared/shared_variables/contants.dart';
import 'package:project_hair_time_mobile/shared/size/size_config.dart';
import 'package:project_hair_time_mobile/screens/store_detail/components/card/about_card.dart';
import 'package:project_hair_time_mobile/shared_data/booking_store_recently_list.dart';
import 'package:project_hair_time_mobile/widgets/card/card_store.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:project_hair_time_mobile/screens/store_detail/components/detail_body.dart';

class AboutPage extends StatefulWidget {
  final String title;
  final String storeName;
  final String address;
  final String phone;
  final String description;
  final double ratingNum;
  final int guestCheckout;

  const AboutPage(
      {Key key,
      this.title,
      this.storeName,
      this.address,
      this.phone,
      this.description,
      this.ratingNum,
      this.guestCheckout})
      : super(key: key);
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  // List<dynamic> _myActivities = globalListService;

  List<String> images = [
    "https://raw.githubusercontent.com/sonhoang1809/Assets/master/Images/Project_Hair_Time/coupon_1.jpg",
    "https://raw.githubusercontent.com/sonhoang1809/Assets/master/Images/Project_Hair_Time/coupon_2.jpg",
    "https://raw.githubusercontent.com/sonhoang1809/Assets/master/Images/Project_Hair_Time/coupon_3.png",
    "https://raw.githubusercontent.com/sonhoang1809/Assets/master/Images/Project_Hair_Time/coupon_4.jpg",
  ];

  @override
  void initState() {
    // if (_myActivities == null) {
    //   return;
    // }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        _buildSliverContent(),
      ],
    );
  }

  SliverFillRemaining _buildSliverContent() {
    return SliverFillRemaining(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          color: Colors.white,
          margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15), vertical: getProportionateScreenHeight(15)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  this.widget.storeName,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Image.network(
                      "https://raw.githubusercontent.com/sonhoang1809/Assets/master/Images/Project_Hair_Time/beauty-salon.png",
                      width: 30,
                    ),
                    Expanded(
                      child: AutoSizeText(
                        this.widget.address,
                        style: TextStyle(fontSize: 13),
                        maxLines: 2,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Image.network(
                      "https://raw.githubusercontent.com/sonhoang1809/Assets/master/Images/Project_Hair_Time/vietnam.png",
                      width: 27,
                    ),
                    Text("\tVietnam\t|\t", style: TextStyle(fontSize: 13)),
                    Image.network(
                      "https://raw.githubusercontent.com/sonhoang1809/Assets/master/Images/Project_Hair_Time/customer-feedback.png",
                      width: 25,
                    ),
                    Text(
                        "\tGuest checout:\t" +
                            this.widget.guestCheckout.toString() +
                            "|\t",
                        style: TextStyle(fontSize: 13)),
                    SmoothStarRating(
                        allowHalfRating: false,
                        onRated: (v) {},
                        starCount: 5,
                        rating: this.widget.ratingNum,
                        size: 17.0,
                        isReadOnly: true,
                        filledIconData: Icons.star_rate_rounded,
                        halfFilledIconData: Icons.star_half_rounded,
                        color: Colors.amber,
                        borderColor: Colors.amber,
                        spacing: 0.0),
                    Text(" " + this.widget.ratingNum.toString()),
                  ],
                ),
              ),
              new AboutCard(description: this.widget.description, phone: this.widget.phone),
              SizedBox(height: getProportionateScreenHeight(10)),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Container(
                        height: getProportionateScreenHeight(35),
                        width: getProportionateScreenWidth(7),
                        color: Colors.blue),
                    SizedBox(width: getProportionateScreenWidth(10)),
                    Text(
                      "Recently store",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(10)),
              Container(
                      color: Colors.white,
                      width: SizeConfig.screenWidth,
                      height: getProportionateScreenHeight(250),
                      margin: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(18),
                      ),
                      child: ListView.builder(
                        itemCount: bookingStoreRecentlyList.length,
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return new BookingStoreRecentlyContainer(
                            imageUrl: bookingStoreRecentlyList[index]
                                ["storeLogo"],
                            storeName: bookingStoreRecentlyList[index]
                                ["storeName"],
                            storeAddress: bookingStoreRecentlyList[index]
                                ["storeAddress"],
                            priceStart: bookingStoreRecentlyList[index]
                                ["priceStart"],
                            priceEnd: bookingStoreRecentlyList[index]
                                ["priceEnd"],
                            bookingTime: bookingStoreRecentlyList[index]
                                ["bookingTime"],
                            distanceFromLocation:
                                bookingStoreRecentlyList[index]
                                    ["distanceFromLocation"],
                            index: index, reviewsStore: '4.5',
                          );
                        },
                      ),
                    ),
                    
              // Container(
              //   margin: EdgeInsets.only(
              //       top: getProportionateScreenHeight(5),
              //       bottom: getProportionateScreenHeight(10)),
              //   height: SizeConfig.screenHeight * 0.2,
              //   width: SizeConfig.screenWidth,
              //   color: Colors.white,
              //   child: Stack(
              //     children: <Widget>[
              //       ConstrainedBox(
              //         constraints: new BoxConstraints.expand(),
              //         // child: new Image.network(
              //         //   "https://raw.githubusercontent.com/sonhoang1809/Assets/master/Images/Project_Hair_Time/promotion-background.jpg",
              //         //   fit: BoxFit.fill,
              //         // ),
              //       ),
              //       new Swiper(
              //         itemBuilder: (BuildContext context, int index) {
              //           return new Image.network(
              //             images[index],
              //             fit: BoxFit.fill,
              //           );
              //         },
              //         itemCount: images.length,
              //         viewportFraction: 0.7,
              //         scale: 0.8,
              //       )
              //     ],
              //   ),
              // ),
            
            ],
          ),
        ),
      ),
    );
  }
}
