import 'package:flutter/material.dart';
import 'package:project_hair_time_mobile/screens/notify/notify_screen.dart';
import 'package:project_hair_time_mobile/shared/size/size_config.dart';
import 'package:project_hair_time_mobile/widgets/button/icon_btn_with_counter.dart';
import 'package:project_hair_time_mobile/widgets/filed/search_filed.dart';

class SearchHeader extends StatefulWidget {
  const SearchHeader({
    Key key,
  }) : super(key: key);

  @override
  _SearchHeaderState createState() => _SearchHeaderState();
}

class _SearchHeaderState extends State<SearchHeader> {
  Color _originalColorTextField;
  Color _unFocusedColorTextField = Colors.grey;
  Color _onFocusedColorTextField = Colors.blue;

  void _onTapTextField() {
    setState(() {
      this._originalColorTextField = this._onFocusedColorTextField;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            // margin: const EdgeInsets.fromLTRB(20, 130, 20, 0),
            height: getProportionateScreenHeight(40),
            width: getProportionateScreenWidth(220),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.red,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: SearchFiled(
              widthContainer: getProportionateScreenWidth(150),
              heightContainer: getProportionateScreenHeight(40),
              boxDecorationColor: Colors.white,
              opacityBoxDecorationColor: 1,
              borderRadiusBoxDecoration: 5,
              hintText: 'Search ...',
              searchIconColor: this._originalColorTextField,
              widthHorizontalContentPadding: getProportionateScreenWidth(30),
              widthVerticalContentPadding: getProportionateScreenWidth(10),
              readOnlyTextField: false,
              onChanged: null,
              onTap: this._onTapTextField,
            ),
          ),
          Spacer(),
          IConBtnWithCounter(
            svgSrc:
                "https://raw.githubusercontent.com/sonhoang1809/Assets/master/Images/Project_Hair_Time/filter.svg",
            press: () {},
          ),
          SizedBox(
            width: getProportionateScreenWidth(10),
          ),
          IConBtnWithCounter(
            svgSrc:
                "https://raw.githubusercontent.com/abuanwar072/E-commerce-Complete-Flutter-UI/48a19c61b9689cded0b92876ff0fa0dc5af8c332/assets/icons/Bell.svg",
            numOfItems: 3,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotifyScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
