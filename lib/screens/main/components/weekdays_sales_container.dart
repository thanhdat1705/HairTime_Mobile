import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:project_hair_time_mobile/screens/booking/booking_screen.dart';
import 'package:project_hair_time_mobile/screens/store_detail/detail_screen.dart';
import 'package:project_hair_time_mobile/shared/general_helpers/general_helpers.dart';
import 'package:project_hair_time_mobile/shared/size/size_config.dart';
import 'package:project_hair_time_mobile/shared_data/stores_list.dart';

class WeekdaysSaleContainer extends StatelessWidget {
  final String storeImage;
  final String storeService;
  final String servicePrice;
  final String promotionPrice;
  final String storeName;
  final String storeDiscount;
  final String distanceFromLocation;
  final String storeAddress;
  final String ratingStar;
  final int index;
  WeekdaysSaleContainer({
    Key key,
    @required this.storeImage,
    @required this.storeService,
    @required this.servicePrice,
    @required this.promotionPrice,
    @required this.storeName,
    @required this.storeDiscount,
    @required this.distanceFromLocation,
    @required this.storeAddress,
    @required this.ratingStar,
    @required this.index,
  }) : super(key: key);

  void navigatorToDetailScreen(BuildContext context) {
    GeneralHelper.navigateToScreen(context, DetailScreen(
          address: haircutStoresList[index]['storeAddress'],
          description: haircutStoresList[index]['description'],
          guestCheckout: '35',
          imageUrl: haircutStoresList[index]['storeLogo'],
          isLike: true,
          phone: haircutStoresList[index]['phone'],
          ratingNum: double.parse(haircutStoresList[index]['ratingStar']),
          storeName: haircutStoresList[index]['storeName'],
          servicePage: 1,
        ), false);
  }

  void navigatorToBookingScreen(BuildContext context) {
    GeneralHelper.navigateToScreen(
        context,
        BookingScreen(
          storeName: haircutStoresList[index]['storeName'],
          address: haircutStoresList[index]['storeAddress'],
          totalPriceService:
              double.parse(haircutStoresList[index]['promotionPrice']),
          isDiscount: true,
          storeDiscount: haircutStoresList[index]['storeDiscount'],
        ),
        false);
  }

  String threeDotText(String text, int size) {
    return text.length > size ? text.substring(0, size - 1) + "…" : text;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // navigatorToBookingScreen(context);
        navigatorToDetailScreen(context);
      },
      child: new Container(
        width: getProportionateScreenWidth(165),
        height: getProportionateScreenHeight(220),
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
                      this.storeImage,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    width: getProportionateScreenWidth(30),
                    margin: EdgeInsets.only(
                        bottom: getProportionateScreenHeight(5)),
                    child: Image.network(
                      this.storeDiscount,
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: getProportionateScreenWidth(165),
              height: getProportionateScreenHeight(120),
              child: Padding(
                padding: const EdgeInsets.only(left: 2),
                child: RichText(
                  maxLines: 6,
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: Container(
                          padding: EdgeInsets.only(
                              left: getProportionateScreenWidth(1)),
                          child: Text(
                            this.storeService + '\t',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                              fontSize: getProportionateScreenWidth(14),
                            ),
                          ),
                        ),
                      ),
                      TextSpan(
                        text: '\n\$' + this.servicePrice,
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: getProportionateScreenWidth(16),
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      TextSpan(
                        text: '\t\t\$' + this.promotionPrice + '\n',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: getProportionateScreenWidth(16),
                        ),
                      ),
                      TextSpan(
                        text: this.storeName + '\n',
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(14),
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
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
                        text: '\t' + this.ratingStar + '\n',
                        style: TextStyle(
                          color: Colors.black,
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
            // Container(
            //   height: getProportionateScreenHeight(40),
            //   width: getProportionateScreenWidth(150),
            //   child:
            // Row(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: <Widget>[
            // InkWell(
            //   onTap: () {
            //     navigatoToDetailScreen(context, this.index, false);
            //   },
            //   child: Container(
            //     width: getProportionateScreenWidth(50),
            //     padding: EdgeInsets.symmetric(vertical: 10),
            //     alignment: Alignment.center,
            //     child: Text("Details"),
            //   ),
            // ),
            //     Expanded(
            //   child: TwoSideRoundedButton(
            //     onTap: () {
            //       navigatoToDetailScreen(context, this.index, true);
            //     },
            //     text: "Booking",
            //     colorButton: Colors.blue[200],
            //     radious: 30,
            //   ),
            // ),
            // ],
            // ),
            // ),
          ],
        ),
      ),
    );
  }
}
