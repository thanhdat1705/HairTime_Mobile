import 'package:flutter/material.dart';
import 'package:project_hair_time_mobile/screens/booking/booking_screen.dart';
import 'package:project_hair_time_mobile/screens/booking_bill/booking_bill_screen.dart';
import 'package:project_hair_time_mobile/screens/chatting/chat_screen.dart';
import 'package:project_hair_time_mobile/screens/chatting/components/chat_body.dart';
import 'package:project_hair_time_mobile/screens/methods_payment/data/methods_payment_data.dart';
import 'package:project_hair_time_mobile/screens/store_detail/components/popup/dropdown_service.dart';
import 'package:project_hair_time_mobile/screens/store_detail/components/tab/service_page.dart';
import 'package:project_hair_time_mobile/screens/store_detail/presenter/store_detail_screen_persenter.dart';
import 'package:project_hair_time_mobile/shared/general_helpers/general_helpers.dart';
import 'package:project_hair_time_mobile/shared/size/size_config.dart';
import 'package:project_hair_time_mobile/shared/tools/clip_path.dart';
import 'package:project_hair_time_mobile/screens/store_detail/components/popup/popup_phone.dart';
import 'package:project_hair_time_mobile/screens/store_detail/components/popup/popup_shopping.dart';
import 'package:project_hair_time_mobile/shared_data/service_list.dart';

class StoreDetailFooter extends StatefulWidget {
  final IStoreDetailScreenPresenter presenter;
  final TabController tabController;
  final String storeName;
  final String address;
  const StoreDetailFooter(
      {Key key,
      this.presenter,
      this.tabController,
      this.storeName,
      this.address})
      : super(key: key);

  @override
  _StoreDetailFooterState createState() => _StoreDetailFooterState();
}

class _StoreDetailFooterState extends State<StoreDetailFooter> {
  int _count = 0;
  double _total = 0.0;

  getItemsInCard() {
    String amount = this
        .widget
        .presenter
        .storeDetailScreenViewModel
        .listCheckedService
        .length
        .toString();
    if (amount != "0") {
      return Positioned(
        right: 0,
        child: Container(
          alignment: Alignment.center,
          height: 20,
          width: 20,
          decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Text(
            "3",
            style: TextStyle(fontSize: 13, color: Colors.white),
          ),
        ),
      );
    }
  }

  void checkServiceIsNotEmpty(BuildContext context) {
    if (this.widget.presenter.getListService().isEmpty) {
      Widget okButton = FlatButton(
        child: Text("OK"),
        onPressed: () {
          Navigator.pop(context);
          this.widget.tabController.animateTo(1);
        },
      );

      AlertDialog alert = AlertDialog(
        title: Text("Your card is empty!"),
        content: Text("Please select some services."),
        actions: [
          okButton,
        ],
      );

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    } else {
      this.widget.presenter.getTotalPriceService();
      // GeneralHelper.navigateToScreen(
      //     context,
      //     BookingScreen(
      //       totalPriceService: this
      //           .widget
      //           .presenter
      //           .storeDetailScreenViewModel
      //           .totalPriceService,
      //       storeName: this.widget.storeName,
      //       address: this.widget.address,
      //       isDiscount: false,
      //       storeDiscount: "",
      //     ),
      //     false);
      GeneralHelper.navigateToScreen(
          context,
          BookingBillScreen(
            address: this.widget.address,
            storeName: this.widget.storeName,
            methodPayment: methodPaymentList[0],
            isDiscount: false,
          ),
          false);
    }
  }

  void getService() {
    double tmpTotal = 0.0;
    int tmpCount = 0;
    myService.forEach((service) {
      if (service['value']['isActive'] == true) {
        tmpCount += int.parse(service['amount']);
        tmpTotal += double.parse(service['value']['price']) *
            double.parse(service['amount']);
      }
    });
    _count = tmpCount;
    _total = tmpTotal;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getService();
    return GestureDetector(
      onTap: () {
        GeneralHelper.navigateToScreen(
            context,
            BookingBillScreen(
              address: this.widget.address,
              storeName: this.widget.storeName,
              methodPayment: methodPaymentList[0],
            ),
            false);
      },
      child: Container(
        height: SizeConfig.screenHeight * 0.1,
        width: SizeConfig.screenWidth,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25)),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3))
          ],
        ),
        child: Center(
          child: Container(
            height: 40,
            width: SizeConfig.screenWidth * 0.9,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(Radius.circular(7)),
            ),
            child: Row(
              children: [
                SizedBox(width: getProportionateScreenWidth(20)),
                Text(
                  "View your services",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(width: getProportionateScreenWidth(10)),
                Text(
                  _count.toString() + " Items",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                Spacer(),
                Text(
                  "\$" + _total.toStringAsFixed(2),
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: getProportionateScreenWidth(20)),
              ],
            ),
          ),
        ),

        // Row(
        //   children: <Widget>[
        //     Expanded(
        //       flex: 2,
        //       child: FlatButton(
        //         onPressed: () => {
        //           showGeneralDialog(
        //               barrierColor: Colors.black.withOpacity(0.5),
        //               transitionBuilder: (context, a1, a2, widget) {
        //                 return Transform.scale(
        //                   scale: a1.value,
        //                   child: Opacity(
        //                     opacity: a1.value,
        //                     child: PopupPhone(phoneNumber: '+08938778284'),
        //                   ),
        //                 );
        //               },
        //               transitionDuration: Duration(milliseconds: 200),
        //               barrierDismissible: false,
        //               barrierLabel: '',
        //               context: context,
        //               pageBuilder: (context, animation1, animation2) {})
        //         },
        //         shape: RoundedRectangleBorder(
        //           borderRadius: BorderRadius.only(topLeft: Radius.circular(25)),
        //         ),
        //         color: Colors.white,
        //         padding: EdgeInsets.symmetric(
        //             vertical: getProportionateScreenHeight(28)),
        //         child: Icon(Icons.phone,
        //             color: Colors.grey, size: getProportionateScreenHeight(27)),
        //       ),
        //     ),
        //     Expanded(
        //       flex: 2,
        //       child: FlatButton(
        //         onPressed: () => Navigator.push(
        //           context,
        //           MaterialPageRoute(
        //             builder: (_) => ChatScreen(
        //               chattingName: widget.storeName,
        //             ),
        //           ),
        //         ),
        //         color: Colors.white,
        //         padding: EdgeInsets.symmetric(
        //             vertical: getProportionateScreenHeight(28)),
        //         child: Icon(
        //           Icons.chat,
        //           color: Colors.grey,
        //           size: getProportionateScreenHeight(27),
        //         ),
        //       ),
        //     ),
        //     Expanded(
        //       flex: 2,
        //       child: Stack(
        //         children: [
        //           FlatButton(
        //             onPressed: () => {
        //               showGeneralDialog(
        //                 barrierLabel: "",
        //                 barrierDismissible: false,
        //                 barrierColor: Colors.black.withOpacity(0.5),
        //                 transitionDuration: Duration(milliseconds: 500),
        //                 context: context,
        //                 pageBuilder: (context, anim1, anim2) {
        //                   return Align(
        //                     alignment: Alignment.bottomCenter,
        //                     heightFactor: 20,
        //                     child: PopupShopping(
        //                       presenter: this.widget.presenter,
        //                       tabController: widget.tabController,
        //                     ),
        //                   );
        //                 },
        //                 transitionBuilder: (context, anim1, anim2, child) {
        //                   return SlideTransition(
        //                     position:
        //                         Tween(begin: Offset(0, 1), end: Offset(0, 0))
        //                             .animate(anim1),
        //                     child: child,
        //                   );
        //                 },
        //               ),
        //             },
        //             color: Colors.white,
        //             padding: EdgeInsets.symmetric(
        //                 vertical: getProportionateScreenHeight(15)),
        //             child: Icon(Icons.shopping_bag,
        //                 color: Colors.grey,
        //                 size: getProportionateScreenHeight(27)),
        //           ),
        //           Positioned(
        //             right: 0,
        //             child: Container(
        //               alignment: Alignment.center,
        //               height: 20,
        //               width: 20,
        //               decoration: BoxDecoration(
        //                   color: Colors.red,
        //                   borderRadius: BorderRadius.all(Radius.circular(10))),
        //               child: Text(
        //                 customerServiceList.length.toString(),
        //                 style: TextStyle(fontSize: 13, color: Colors.white),
        //               ),
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //     Expanded(
        //       flex: 10,
        //       child: ClipPath(
        //         clipper: LinePathClass(),
        //         child: Container(
        //           child: FlatButton(
        //               onPressed: () => {
        //                     checkServiceIsNotEmpty(context),
        //                   },
        //               shape: RoundedRectangleBorder(
        //                 borderRadius:
        //                     BorderRadius.only(topRight: Radius.circular(25)),
        //               ),
        //               color: Colors.blue[300],
        //               padding: EdgeInsets.only(
        //                   top: getProportionateScreenHeight(30),
        //                   bottom: getProportionateScreenHeight(25),
        //                   left: getProportionateScreenWidth(40)),
        //               child: Text(
        //                 "Booking",
        //                 style: TextStyle(
        //                   fontSize: getProportionateScreenHeight(23),
        //                   fontWeight: FontWeight.bold,
        //                   color: Colors.white,
        //                 ),
        //                 textAlign: TextAlign.center,
        //               )),
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
