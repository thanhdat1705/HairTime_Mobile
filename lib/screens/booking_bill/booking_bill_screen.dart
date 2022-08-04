import 'package:flutter/material.dart';
import 'package:project_hair_time_mobile/screens/booking_bill/components/booking_bill_body.dart';
import 'package:project_hair_time_mobile/shared/size/size_config.dart';

class BookingBillScreen extends StatelessWidget {
  final methodPayment;
  final discountData;
  final String total;
  final bool isDiscount;
  final String storeName;
  final String address;
  final int amountOfPerson;
  
  const BookingBillScreen(
      {Key key,
      this.methodPayment,
      this.discountData,
      this.total,
      this.isDiscount,
      this.storeName,
      this.address, this.amountOfPerson})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: new BookingBillBody(
        methodPayment: this.methodPayment,
        discountData: this.discountData,
        storeName: this.storeName,
        address: this.address,
        isDiscount: this.isDiscount,
      ),
    );
  }
}
