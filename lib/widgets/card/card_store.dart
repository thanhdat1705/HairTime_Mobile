import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:project_hair_time_mobile/screens/store_detail/detail_screen.dart';
import 'package:project_hair_time_mobile/shared/general_helpers/general_helpers.dart';
import 'package:project_hair_time_mobile/shared/models/stores/stores.dart';
import 'package:project_hair_time_mobile/shared/shared_variables/contants.dart';
import 'package:project_hair_time_mobile/shared/size/size_config.dart';
import 'package:project_hair_time_mobile/widgets/button/two_side_rounded_button.dart';
import 'package:project_hair_time_mobile/widgets/card/store_rating.dart';

class CardStore extends StatefulWidget {
  final bool isLike;
  final String storeName;
  final String address;
  final String phone;
  final String description;
  final double ratingNum;
  final String guestCheckout;
  final String imageUrl;
  final String priceStart;
  final String priceEnd;
  final String distanceFromLocation;
  // Store store;
  // Function pressDetails;
  // Function pressBook;

  CardStore({
    Key key,
    this.isLike = true,
    this.storeName,
    this.address,
    this.phone,
    this.description,
    this.ratingNum,
    this.guestCheckout,
    this.imageUrl, this.priceStart, this.priceEnd, this.distanceFromLocation,
  }) : super(key: key);
  @override
  _CardStoreState createState() => _CardStoreState();
}

class _CardStoreState extends State<CardStore> {
  void _clickToDetail(
    bool isLike,
    String storeName,
    String address,
    String phone,
    String description,
    double ratingNum,
    String guestCheckout,
    String imageUrl,
  ) {
    GeneralHelper.navigateToScreen(
        context,
        DetailScreen(
          address: address,
          description: description,
          guestCheckout: guestCheckout,
          isLike: isLike,
          phone: phone,
          ratingNum: ratingNum,
          storeName: storeName,
          imageUrl: imageUrl,
          servicePage: 0,
        ),
        false);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        this._clickToDetail(
          this.widget.isLike,
          this.widget.storeName,
          this.widget.address,
          this.widget.phone,
          this.widget.description,
          this.widget.ratingNum,
          this.widget.guestCheckout,
          this.widget.imageUrl,
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: getProportionateScreenHeight(25)),
        width: getProportionateScreenWidth(170),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(29),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 10),
              blurRadius: 33,
              color: kShadowColor,
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(29),
                  topRight: Radius.circular(29),
                ),
                image: DecorationImage(
                  image: NetworkImage(this.widget.imageUrl),
                  fit: BoxFit.fill,
                ),
              ),
              height: getProportionateScreenHeight(120),
              child: Stack(
                children: [
                  Positioned(
                    top: getProportionateScreenHeight(10),
                    right: getProportionateScreenWidth(0),
                    child: Column(
                      children: <Widget>[
                        IconButton(
                          icon: this.widget.isLike
                              ? Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                )
                              : Icon(
                                  Icons.favorite_border,
                                  color: Colors.white,
                                ),
                          onPressed: () {},
                        ),
                        StoreRating(score: this.widget.ratingNum),
                      ],
                    ),
                  ),
                  // Positioned(
                  //   left: getProportionateScreenWidth(0),
                  //   bottom: getProportionateScreenHeight(0),
                  //   child: Container(
                  //     alignment: Alignment.center,
                  //     color: Colors.blue[500],
                  //     height: getProportionateScreenHeight(30),
                  //     width: getProportionateScreenWidth(70),
                  //     child: Text(
                  //       "Book now",
                  //       style: TextStyle(
                  //           fontSize: getProportionateScreenHeight(13),
                  //           fontWeight: FontWeight.bold,
                  //           color: Colors.white),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(15)),
            Container(
              child: Padding(
                padding: EdgeInsets.only(left: 24),
                child: RichText(
                  maxLines: 10,
                  text: TextSpan(
                    style: TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: this.widget.storeName + "\n",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      WidgetSpan(
                        child: Icon(
                          MdiIcons.cashUsdOutline,
                          color: Colors.green,
                          size: getProportionateScreenWidth(18),
                        ),
                      ),
                      TextSpan(
                        text: '\t' + this.widget.priceStart + ' - ' + '\t',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: getProportionateScreenWidth(12),
                        ),
                      ),
                      TextSpan(
                        text: this.widget.priceEnd + '\n',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: getProportionateScreenWidth(12),
                        ),
                      ),
                      WidgetSpan(
                        child: Icon(
                          MdiIcons.mapMarkerCircle,
                          color: Colors.green[300],
                          size: getProportionateScreenWidth(18),
                        ),
                      ),
                      TextSpan(
                        text: '\t' + this.widget.distanceFromLocation + '\n',
                        style: TextStyle(
                          color: Colors.green[300],
                          fontSize: getProportionateScreenWidth(12),
                        ),
                      ),
                      TextSpan(
                        text: this.widget.address.substring(0, 20) + "...",
                        style: TextStyle(color: kLightBlackColor),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(10)),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     GestureDetector(
            //       onTap: () {
            //         this._clickToDetail(
            //           this.widget.isLike,
            //           this.widget.storeName,
            //           this.widget.address,
            //           this.widget.phone,
            //           this.widget.description,
            //           this.widget.ratingNum,
            //           this.widget.guestCheckout,
            //           this.widget.imageUrl,
            //         );
            //       },
            //       child: Container(
            //         width: 101,
            //         padding: EdgeInsets.symmetric(vertical: 10),
            //         alignment: Alignment.center,
            //         decoration: BoxDecoration(
            //           color: Colors.blue[200],
            //           borderRadius: BorderRadius.only(
            //               topLeft: Radius.circular(20),
            //               topRight: Radius.circular(20)),
            //         ),
            //         child: Text(
            //           "Details",
            //           style: TextStyle(fontWeight: FontWeight.w400),
            //         ),
            //       ),
            //     ),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
