import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ticket_widget/flutter_ticket_widget.dart';
import 'package:project_hair_time_mobile/screens/bill_details/bill_detail_screen.dart';
import 'package:project_hair_time_mobile/screens/main/services/main_screen_service.dart';
import 'package:project_hair_time_mobile/screens/ticket_user_service/components/ticket_user_service_widget.dart';
import 'package:project_hair_time_mobile/shared/general_helpers/general_helpers.dart';
import 'package:project_hair_time_mobile/shared/shared_components/rounded_button.dart';
import 'package:project_hair_time_mobile/shared/size/size_config.dart';
import 'package:qr_flutter/qr_flutter.dart';

class TicketUserServiceScreen extends StatefulWidget {
  TicketUserServiceScreen({Key key}) : super(key: key);

  @override
  _TicketUserServiceScreenState createState() =>
      _TicketUserServiceScreenState();
}

class _TicketUserServiceScreenState extends State<TicketUserServiceScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black.withOpacity(0.2),
      body: Center(
        child: FlutterTicketWidget(
          width: 340.0,
          height: 430.0,
          isCornerRounded: true,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Container(
                        width: 120.0,
                        height: 25.0,
                        decoration: new BoxDecoration(
                          borderRadius: new BorderRadius.circular(30.0),
                          border: Border.all(width: 1.0, color: Colors.green),
                        ),
                        child: new Center(
                          child: new Text(
                            'Orders Booking',
                            style: new TextStyle(color: Colors.green),
                          ),
                        )),
                    new Row(
                      children: <Widget>[
                        new Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: new Icon(
                            Icons.book_online,
                            color: Colors.pink,
                          ),
                        ),
                        Text(
                          'ID: ',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            '#1809',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(
                    'Booking QR Code',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 25.0),
                //   child: new Container(
                //     height: 170,
                //     child: new SingleChildScrollView(
                //       scrollDirection: Axis.vertical,
                //       child: Column(
                //         children: <Widget>[
                //           Padding(
                //               padding:
                //                   const EdgeInsets.only(top: 0.0, right: 50.0),
                //               child: tickerUserServiceWidget('Customers',
                //                   'Son Hoang', 'Date Booking', '24-12-2020')),
                //           Padding(
                //             padding:
                //                 const EdgeInsets.only(top: 12.0, right: 0.0),
                //             child: tickerUserServiceWidget(
                //                 'Store',
                //                 'Barber Vu Tri',
                //                 'Booking Time',
                //                 '25-12-2020 14:00:00'),
                //           ),
                //           Padding(
                //             padding:
                //                 const EdgeInsets.only(top: 12.0, right: 90.0),
                //             child: tickerUserServiceWidget('Services',
                //                 'Hair Cut \nHair Curling', 'Status', 'Booked'),
                //           ),
                //           Padding(
                //             padding:
                //                 const EdgeInsets.only(top: 10.0, right: 90.0),
                //             child: tickerUserServiceWidget(
                //                 '', 'Total', '', '\$120'),
                //           ),
                //           Padding(
                //             padding:
                //                 const EdgeInsets.only(top: 0.0, right: 90.0),
                //             child: tickerUserServiceWidget('Discount',
                //                 'Total after Discount', '\$20', '\$100'),
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                
                Padding(
                  padding:
                      const EdgeInsets.only(top: 5.0, left: 0.0, right: 0.0),
                  child: Container(
                    alignment: Alignment.center,
                    width: SizeConfig.screenWidth,
                    height: 200.0,
                    child: QrImage(
                      data: "1234567890",
                      version: QrVersions.auto,
                      size: 200.0,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 7.0, left: 0.0, right: 0.0),
                  child: Text(
                    'Give this QR Code to Staff to use service',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                RoundedButton(
                  text: "View Details",
                  press: () {
                    GeneralHelper.navigateToScreen(context,
                                    new BillDetailScreen(), true);
                    // GeneralHelper.showDialogLoading(context).show();
                    // initMainScreen(context);
                  },
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 12.0, left: 0.0, right: 0.0),
                  child: new GestureDetector(
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.normal,
                          fontSize: 15),
                    ),
                    onTap: () {
                      if (Navigator.canPop(context)) {
                        Navigator.pop(context);
                      } else {
                        initMainScreen(context);
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
