import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:project_hair_time_mobile/screens/booking/booking_screen.dart';
import 'package:project_hair_time_mobile/screens/calendar_page/calendar_page.dart';
import 'package:project_hair_time_mobile/screens/methods_payment/data/methods_payment_data.dart';
import 'package:project_hair_time_mobile/screens/service_detail/service_detail_screen.dart';
import 'package:project_hair_time_mobile/screens/store_detail/detail_screen.dart';
import 'package:project_hair_time_mobile/shared/general_helpers/general_helpers.dart';
import 'package:project_hair_time_mobile/shared/size/size_config.dart';
import 'package:project_hair_time_mobile/shared_data/hot_combo_service_list.dart';

class HotComboContainer extends StatelessWidget {
  final String imageUrl;
  final String storeName;
  final String storeAddress;
  final String hotComboService;
  final String comboPrice;
  final String distanceFromLocation;
  final String reviewsStore;
  final int index;

  const HotComboContainer({
    Key key,
    @required this.imageUrl,
    @required this.storeName,
    @required this.storeAddress,
    @required this.hotComboService,
    @required this.comboPrice,
    @required this.distanceFromLocation,
    @required this.reviewsStore,
    this.index,
  }) : super(key: key);

  void navigatorToBookingScreen(BuildContext context) {
    GeneralHelper.navigateToScreen(
        context,
        BookingScreen(
          storeName: hotComboList[index]['storeName'],
          address: hotComboList[index]['storeAddress'],
          totalPriceService: double.parse(hotComboList[index]['comboPrice']),
          isDiscount: true,
          storeDiscount: '40%',
        ),
        false);
  }

  void navigatorToDetailScreen(BuildContext context) {
    // GeneralHelper.navigateToScreen(
    //               context,
    //               ServiceDetailScreen(
    //                 // tabController: this.widget.tabController,
    //                 serviceId: '13',
    //                 // fromBill: false,
    //                 isComboFromMain: true,
    //               ),
    //               false);
    GeneralHelper.navigateToScreen(
        context,
        CalendarPage(
          servicesId: '5',
          amount: '3',
          serviceId: '13',
          storeName: "Liem Barber Shop",
          address: '49 Hoa Su, Q.Phu Nhuan, TP. HCM',
          isDiscount: false,
          methodPayment: methodPaymentList[0],
          fromBill: false,
          isComboFromMain: true,
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
            bottom: getProportionateScreenHeight(10)),
        child: Column(
          children: <Widget>[
            Stack(
              children: [
                Container(
                  height: getProportionateScreenHeight(110),
                  width: getProportionateScreenWidth(180),
                  child: Image.network(
                    this.imageUrl,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
            Container(
              height: getProportionateScreenHeight(100),
              width: getProportionateScreenWidth(160),
              child: Padding(
                padding: EdgeInsets.only(left: getProportionateScreenWidth(2)),
                child: RichText(
                  maxLines: 5,
                  text: TextSpan(
                    text: this.hotComboService,
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: getProportionateScreenWidth(15),
                    ),
                    children: [
                      TextSpan(
                        text: '\t\$' + this.comboPrice + '\n',
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
