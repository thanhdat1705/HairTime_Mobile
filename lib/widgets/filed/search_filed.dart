import 'package:flutter/material.dart';

class SearchFiled extends StatelessWidget {
  final double widthContainer;
  final double heightContainer;
  final Color boxDecorationColor;
  final double opacityBoxDecorationColor;
  final double borderRadiusBoxDecoration;
  final String hintText;
  final double widthHorizontalContentPadding;
  final double widthVerticalContentPadding;
  final bool readOnlyTextField;
  final Function onChanged;
  final Function onTap;
  final Color searchIconColor;
  const SearchFiled({
    @required this.widthContainer,
    @required this.heightContainer,
    @required this.boxDecorationColor,
    @required this.opacityBoxDecorationColor,
    @required this.borderRadiusBoxDecoration,
    @required this.hintText,
    @required this.widthHorizontalContentPadding,
    @required this.widthVerticalContentPadding,
    @required this.readOnlyTextField,
    @required this.onChanged,
    @required this.onTap,
    this.searchIconColor,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: this.widthContainer,
      height: this.heightContainer,
      decoration: BoxDecoration(
        color:
            this.boxDecorationColor.withOpacity(this.opacityBoxDecorationColor),
        borderRadius: BorderRadius.circular(this.borderRadiusBoxDecoration),
      ),
      child: TextField(
        readOnly: this.readOnlyTextField,
        onChanged: this.onChanged,
        onTap: this.onTap,
        autofocus: false,
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: this.hintText,
          prefixIcon: Icon(
            Icons.search,
            color: this.searchIconColor,
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: this.widthHorizontalContentPadding,
            vertical: this.widthVerticalContentPadding,
          ),
        ),
      ),
    );
  }
}
