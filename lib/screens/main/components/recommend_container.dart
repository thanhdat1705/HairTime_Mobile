import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:project_hair_time_mobile/screens/booking/booking_screen.dart';
import 'package:project_hair_time_mobile/screens/store_detail/detail_screen.dart';
import 'package:project_hair_time_mobile/shared/general_helpers/general_helpers.dart';
import 'package:project_hair_time_mobile/shared/size/size_config.dart';
import 'package:project_hair_time_mobile/shared_data/recommend_stores_list.dart';

class RecommendContainer extends StatelessWidget {
  final String hotServiceStore;
  final String servicePrice;
  final String storeName;
  final String storeAddress;
  final String imageUrl;
  final String distanceFromLocation;
  final String reviewsStore;
  final String bookingRecently;
  final int index;

  RecommendContainer({
    Key key,
    @required this.hotServiceStore,
    @required this.servicePrice,
    @required this.imageUrl,
    @required this.storeName,
    @required this.storeAddress,
    @required this.distanceFromLocation,
    @required this.reviewsStore,
    @required this.bookingRecently,
    this.index,
  }) : super(key: key);

  String threeDotText(String text, int size) {
    return text.length > size ? text.substring(0, size - 1) + "…" : text;
  }

  void navigatorToDetailScreen(BuildContext context, int index) {
    GeneralHelper.navigateToScreen(
        context,
        DetailScreen(
          address: recommendStoresList[index]['storeAddress'],
          description: recommendStoresList[index]['description'],
          guestCheckout: '35',
          imageUrl: recommendStoresList[index]['storeLogo'],
          isLike: true,
          phone: '0938778888',
          ratingNum: double.parse('4.0'),
          storeName: recommendStoresList[index]['storeName'],
          servicePage: 0,
        ),
        false);
  }

  void navigatorToBookingScreen(BuildContext context) {
    GeneralHelper.navigateToScreen(
        context,
        BookingScreen(
          storeName: recommendStoresList[index]['storeName'],
          address: recommendStoresList[index]['storeAddress'],
          totalPriceService:
              double.parse(recommendStoresList[index]['servicePrice']),
          isDiscount: true,
          storeDiscount: '40%',
        ),
        false);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigatorToDetailScreen(context, this.index);
        // navigatorToBookingScreen(context);
      },
      child: new Container(
        width: getProportionateScreenWidth(165),
        height: getProportionateScreenHeight(240),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(35),
            topRight: Radius.circular(15),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              color: Colors.white,
              width: getProportionateScreenWidth(165),
              height: getProportionateScreenHeight(100),
              child: Stack(
                alignment: Alignment.topRight,
                children: <Widget>[
                  Container(
                    width: getProportionateScreenWidth(165),
                    height: getProportionateScreenHeight(100),
                    child: Image.network(
                      this.imageUrl,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: getProportionateScreenWidth(165),
              height: getProportionateScreenHeight(140),
              // color: Colors.red,
              child: Padding(
                padding: EdgeInsets.only(left: getProportionateScreenWidth(2)),
                child: RichText(
                  maxLines: 7,
                  text: TextSpan(
                    text: threeDotText(this.hotServiceStore, 20) + "\t",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: getProportionateScreenWidth(15),
                    ),
                    children: [
                      TextSpan(
                        text: '\n\$' + this.servicePrice + '\n',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: getProportionateScreenWidth(16),
                        ),
                      ),
                      TextSpan(
                        text: this.storeName + '\n',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: getProportionateScreenWidth(14),
                        ),
                      ),
                      WidgetSpan(
                        child: Icon(
                          MdiIcons.mapMarkerCircle,
                          color: Colors.teal,
                          size: getProportionateScreenWidth(18),
                        ),
                      ),
                      TextSpan(
                        text: '\t' + this.distanceFromLocation + '\n',
                        style: TextStyle(
                          color: Colors.teal,
                          fontWeight: FontWeight.normal,
                          fontSize: getProportionateScreenWidth(12),
                        ),
                      ),
                      WidgetSpan(
                        child: Icon(
                          MdiIcons.star,
                          color: Colors.yellow,
                          size: getProportionateScreenWidth(18),
                        ),
                      ),
                      TextSpan(
                        text: '\t' + this.reviewsStore + '\n',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: getProportionateScreenWidth(12),
                        ),
                      ),
                      WidgetSpan(
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: getProportionateScreenWidth(2)),
                          child: Icon(
                            MdiIcons.accountClock,
                            size: getProportionateScreenWidth(18),
                          ),
                        ),
                      ),
                      TextSpan(
                        text: '\t' + this.bookingRecently + '\n',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: getProportionateScreenWidth(12),
                        ),
                      ),
                      TextSpan(
                        text: threeDotText(this.storeAddress, 25) + '\n',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.normal,
                          fontSize: getProportionateScreenWidth(12),
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
  }
}
