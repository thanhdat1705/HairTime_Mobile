import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:project_hair_time_mobile/screens/store_detail/detail_screen.dart';
import 'package:project_hair_time_mobile/shared/general_helpers/general_helpers.dart';
import 'package:project_hair_time_mobile/shared/size/size_config.dart';
import 'package:project_hair_time_mobile/shared_data/booking_store_recently_list.dart';

class BookingStoreRecentlyContainer extends StatelessWidget {
  final String imageUrl;
  final String storeName;
  final String storeAddress;
  final String priceStart;
  final String priceEnd;
  final String bookingTime;
  final String distanceFromLocation;
  final String reviewsStore;
  final int index;

  const BookingStoreRecentlyContainer({
    Key key,
    @required this.imageUrl,
    @required this.storeName,
    @required this.storeAddress,
    @required this.priceStart,
    @required this.priceEnd,
    @required this.bookingTime,
    @required this.distanceFromLocation,
    @required this.reviewsStore,
    this.index,
  }) : super(key: key);

  void navigatorToDetailScreen(BuildContext context, int index) {
    GeneralHelper.navigateToScreen(
        context,
        DetailScreen(
          address: bookingStoreRecentlyList[index]['storeAddress'],
          description: bookingStoreRecentlyList[index]['description'],
          guestCheckout: '35',
          imageUrl: bookingStoreRecentlyList[index]['storeLogo'],
          isLike: false,
          phone: '0909556588',
          ratingNum:
              double.parse(bookingStoreRecentlyList[index]['reviewsStore']),
          storeName: bookingStoreRecentlyList[index]['storeName'],
          servicePage: 0,
        ),
        false);
  }

  String threeDotText(String text, int size) {
    return text.length > size ? text.substring(0, size - 1) + "…" : text;
  }

  @override
  Widget build(BuildContext context) {
    return new InkWell(
      onTap: () {
        navigatorToDetailScreen(context, this.index);
      },
      child: new Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 5,
            ),
          ],
        ),
        margin: EdgeInsets.only(
            right: getProportionateScreenWidth(20),
            bottom: getProportionateScreenHeight(20)),
        child: Column(
          children: <Widget>[
            Container(
              height: getProportionateScreenHeight(110),
              width: getProportionateScreenWidth(180),
              child: Image.network(
                this.imageUrl,
                fit: BoxFit.fill,
              ),
            ),
            Container(
              height: getProportionateScreenHeight(120),
              width: getProportionateScreenWidth(180),
              child: Padding(
                padding: EdgeInsets.only(left: getProportionateScreenWidth(2)),
                child: RichText(
                  maxLines: 6,
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: Container(
                          height: getProportionateScreenHeight(16),
                          width: getProportionateScreenWidth(180),
                          padding: EdgeInsets.only(
                              left: getProportionateScreenWidth(2)),
                          child: Text(
                            threeDotText(this.storeName, 25) + '\n',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: getProportionateScreenWidth(12),
                            ),
                          ),
                        ),
                      ),
                      WidgetSpan(
                        child: Icon(
                          MdiIcons.cashUsdOutline,
                          color: Colors.green,
                          size: getProportionateScreenWidth(18),
                        ),
                      ),
                      TextSpan(
                        text: '\t\$' + this.priceStart + ' - ' + '\t',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: getProportionateScreenWidth(12),
                        ),
                      ),
                      TextSpan(
                        text: '\$' + this.priceEnd + '\n',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: getProportionateScreenWidth(12),
                        ),
                      ),
                      WidgetSpan(
                        child: Icon(
                          MdiIcons.history,
                          color: Colors.red,
                          size: getProportionateScreenWidth(18),
                        ),
                      ),
                      TextSpan(
                        text: '\t' + this.bookingTime + '\n',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: getProportionateScreenWidth(12),
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
                        child: Container(
                          padding: EdgeInsets.only(
                              left: getProportionateScreenWidth(2)),
                          child: Text(
                            threeDotText(this.storeAddress, 25) + '\n',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: getProportionateScreenWidth(11),
                            ),
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
  }
}
