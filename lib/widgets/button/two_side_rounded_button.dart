import 'package:flutter/material.dart';

class TwoSideRoundedButton extends StatelessWidget {
  final String text;
  final double radious;
  final Function onTap;
  final Color colorButton;
  const TwoSideRoundedButton(
      {Key key,
      @required this.text,
      this.radious = 30,
      @required this.onTap,
      @required this.colorButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: this.colorButton,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(radious),
            bottomRight: Radius.circular(radious),
          ),
        ),
        child: Text(
          this.text,
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
