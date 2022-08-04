import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:project_hair_time_mobile/screens/store_detail/detail_screen.dart';
import 'package:project_hair_time_mobile/shared/general_helpers/general_helpers.dart';

import 'package:project_hair_time_mobile/shared/size/size_config.dart';
import 'package:project_hair_time_mobile/shared_data/top_favorite_stores_list.dart';

class TopFavoriteStoreContainer extends StatelessWidget {
  final String hotServiceStore;
  final String servicePrice;
  final String storeName;
  final String storeAddress;
  final String imageUrl;
  final String priceStart;
  final String priceEnd;
  final String likesNumber;
  final String reviewsStore;
  final String distanceFromLocation;
  final int index;

  TopFavoriteStoreContainer({
    Key key,
    @required this.imageUrl,
    @required this.storeName,
    @required this.storeAddress,
    @required this.priceStart,
    @required this.priceEnd,
    @required this.likesNumber,
    @required this.reviewsStore,
    @required this.distanceFromLocation,
    this.index,
    @required this.hotServiceStore,
    @required this.servicePrice,
  }) : super(key: key);

  void navigatorToDetailScreen(BuildContext context, int index) {
    GeneralHelper.navigateToScreen(
        context,
        DetailScreen(
          address: topFavoriteStoreList[index]['storeAddress'],
          description: topFavoriteStoreList[index]['description'],
          guestCheckout: '35',
          imageUrl: topFavoriteStoreList[index]['storeLogo'],
          isLike: false,
          phone: '0909556588',
          ratingNum: double.parse('4.5'),
          storeName: topFavoriteStoreList[index]['storeName'],
          servicePage: 0,
        ),
        false);
  }

  String threeDotText(String text, int size) {
    return text.length > size ? text.substring(0, size - 1) + "…" : text;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigatorToDetailScreen(context, this.index);
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
                    children: [
                      WidgetSpan(
                        child: Container(
                          padding: EdgeInsets.only(
                              left: getProportionateScreenWidth(2)),
                          child: Text(
                            threeDotText(this.hotServiceStore, 20) + "\t",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                              fontSize: getProportionateScreenWidth(11),
                            ),
                          ),
                        ),
                      ),
                      TextSpan(
                        text: '\$' + this.servicePrice + '\n',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: getProportionateScreenWidth(16),
                        ),
                      ),
                      WidgetSpan(
                        child: Container(
                          height: getProportionateScreenHeight(16),
                          width: getProportionateScreenWidth(150),
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
                          fontWeight: FontWeight.normal,
                          fontSize: getProportionateScreenWidth(12),
                        ),
                      ),
                      TextSpan(
                        text: '\$' + this.priceEnd + '\n',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: getProportionateScreenWidth(12),
                        ),
                      ),
                      WidgetSpan(
                        child: Icon(
                          MdiIcons.heart,
                          color: Colors.red,
                          size: getProportionateScreenWidth(18),
                        ),
                      ),
                      TextSpan(
                        text: '\t' + this.likesNumber + '\n',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
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
                          color: Colors.black,
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
                        child: Container(
                          padding: EdgeInsets.only(
                              left: getProportionateScreenWidth(2)),
                          child: Text(
                            threeDotText(this.storeAddress, 25) + '\n',
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.normal,
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
