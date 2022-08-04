import 'package:flutter/material.dart';
import 'package:project_hair_time_mobile/shared/shared_components/text_field_container.dart';
import 'package:project_hair_time_mobile/shared/shared_variables/contants.dart';


class RoundedPasswordField extends StatelessWidget {
  final String hintText;
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key key,
    this.hintText = 'Password',
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        cursorColor: notWhite,
        decoration: InputDecoration(
          hintText: this.hintText,
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: kPrimaryColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
