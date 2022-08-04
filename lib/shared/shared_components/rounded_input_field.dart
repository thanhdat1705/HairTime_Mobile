import 'package:flutter/material.dart';
import 'package:project_hair_time_mobile/shared/shared_components/text_field_container.dart';
import 'package:project_hair_time_mobile/shared/shared_variables/contants.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final bool isNumber;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key key,
    this.hintText,
    this.isNumber = false,
    this.icon = Icons.person,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        cursorColor: Colors.white,
        keyboardType: isNumber? TextInputType.number : TextInputType.text,
        decoration: InputDecoration(
          icon: Icon(
            this.icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
