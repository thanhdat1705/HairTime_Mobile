import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:project_hair_time_mobile/screens/forgot_password/input_phone_number/input_phone_number.dart';
import 'package:project_hair_time_mobile/screens/login/services/login_service.dart';
import 'package:project_hair_time_mobile/screens/main/services/main_screen_service.dart';
import 'package:project_hair_time_mobile/screens/signup/components/or_divider.dart';
import 'package:project_hair_time_mobile/screens/signup/components/social_icon.dart';
import 'package:project_hair_time_mobile/shared/general_helpers/general_helpers.dart';
import 'package:project_hair_time_mobile/shared/shared_components/rounded_button.dart';
import 'package:project_hair_time_mobile/shared/shared_components/rounded_input_field.dart';
import 'package:project_hair_time_mobile/shared/shared_components/rounded_password_field.dart';
import 'package:project_hair_time_mobile/shared/shared_variables/contants.dart';
import 'package:project_hair_time_mobile/screens/login/components/login_background.dart';
import 'package:project_hair_time_mobile/shared/shared_components/already_have_an_account_check.dart';
import 'package:project_hair_time_mobile/shared/shared_variables/shared_variables.dart';
import 'package:project_hair_time_mobile/shared/size/size_config.dart';

class LoginBody extends StatefulWidget {
  LoginBody({Key key}) : super(key: key);

  @override
  _LoginBodyState createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void onLogin(int provider, BuildContext context) {
    //this._loginViewModel.isLogin = true;
    //this._loginView.refreshLoginViewModel(this._loginViewModel);

    GeneralHelper.showDialogLoading(context).show();
    onLoginToServer(provider, context).then((value) {
      if (value == true) {
        initMainScreen(context);
      } else {
        //show error login
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new SingleChildScrollView(
      child: new LoginBackground(childs: <Widget>[
        Text(
          "LOGIN",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: getProportionateScreenWidth(25),
              color: nearlyBlack),
        ),
        SizedBox(height: getProportionateScreenHeight(50)),
        RoundedInputField(
          hintText: "Phone Number",
          isNumber: true,
          icon: Icons.phone_android,
          onChanged: (value) {},
        ),
        RoundedPasswordField(
          onChanged: (value) {},
        ),
        SizedBox(height: getProportionateScreenHeight(15)),
        new Row(
          children: [
            SizedBox(width: getProportionateScreenWidth(200)),
            new GestureDetector(
              child: new Text(
                'Forgot Password ?',
                style: new TextStyle(color: Colors.blue),
              ),
              onTap: () {
                GeneralHelper.navigateToScreen(context, 
                new InputPhoneToGetOTPScreen(), false);
              },
            )
          ],
        ),
        SizedBox(height: getProportionateScreenHeight(10)),
        RoundedButton(
          text: "LOGIN",
          press: () {
            GeneralHelper.showDialogLoading(context).show();
            initMainScreen(context);
          },
        ),
        OrDivider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SocalIcon(
              padding: 3,
              height: 53,
              width: 53,
              iconSrc: FacebookLogo,
              press: () {
                this.onLogin(0, context);
              },
            ),
            SocalIcon(
              padding: 10,
              height: 30,
              width: 30,
              iconSrc: GoogleLogo,
              press: () {
                this.onLogin(1, context);
              },
            ),
          ],
        ),
        SizedBox(height: getProportionateScreenHeight(20)),
        AlreadyHaveAnAccountCheck(),
      ]),
    );
  }
}
