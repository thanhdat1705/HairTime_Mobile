import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:project_hair_time_mobile/screens/main/services/main_screen_service.dart';
import 'package:project_hair_time_mobile/screens/signup/components/or_divider.dart';
import 'package:project_hair_time_mobile/screens/signup/components/social_icon.dart';
import 'package:project_hair_time_mobile/shared/general_helpers/general_helpers.dart';
import 'package:project_hair_time_mobile/shared/shared_components/rounded_button.dart';
import 'package:project_hair_time_mobile/shared/shared_components/rounded_input_field.dart';
import 'package:project_hair_time_mobile/shared/shared_components/rounded_password_field.dart';
import 'package:project_hair_time_mobile/shared/shared_variables/contants.dart';
import 'package:project_hair_time_mobile/screens/signup/components/signup_backgrounds.dart';
import 'package:project_hair_time_mobile/shared/shared_components/already_have_an_account_check.dart';
import 'package:project_hair_time_mobile/shared/shared_variables/shared_variables.dart';
import 'package:project_hair_time_mobile/shared/size/size_config.dart';

class SignupBody extends StatefulWidget {
  SignupBody({Key key}) : super(key: key);

  @override
  _SignupBodyState createState() => _SignupBodyState();
}

class _SignupBodyState extends State<SignupBody> {
  @override
  Widget build(BuildContext context) {
    return new SingleChildScrollView(
      child: SignupBackground(childs: <Widget>[
        Text(
          "SIGNUP",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: getProportionateScreenWidth(25),
              color: kPrimaryColor),
        ),
        SizedBox(height: getProportionateScreenHeight(15)),
        RoundedInputField(
          isNumber: true,
          icon: Icons.phone_android,
          hintText: "Phone",
          onChanged: (value) {},
        ),
        RoundedInputField(
          hintText: "Full name",
          onChanged: (value) {},
        ),
        RoundedPasswordField(
          hintText: 'Password',
          onChanged: (value) {},
        ),
        RoundedPasswordField(
          hintText: 'Confirm password',
          onChanged: (value) {},
        ),
        RoundedButton(
          text: "SIGNUP",
          press: () {
            GeneralHelper.showDialogLoading(context).show();
            initMainScreen(context);
          },
        ),
        SizedBox(height: getProportionateScreenHeight(15)),
        AlreadyHaveAnAccountCheck(
          atLogin: false,
        ),
      ]),
    );
  }
}
