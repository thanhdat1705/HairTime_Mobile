import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_hair_time_mobile/screens/forgot_password/input_otp_code/input_otp_code.dart';
import 'package:project_hair_time_mobile/screens/login/components/login_background.dart';
import 'package:project_hair_time_mobile/screens/login/login_screen.dart';
import 'package:project_hair_time_mobile/screens/signup/components/or_divider.dart';
import 'package:project_hair_time_mobile/shared/general_helpers/general_helpers.dart';
import 'package:project_hair_time_mobile/shared/shared_components/rounded_button.dart';
import 'package:project_hair_time_mobile/shared/shared_components/rounded_input_field.dart';
import 'package:project_hair_time_mobile/shared/shared_components/rounded_password_field.dart';
import 'package:project_hair_time_mobile/shared/shared_variables/contants.dart';
import 'package:project_hair_time_mobile/shared/size/size_config.dart';

class ResetNewPasswordScreen extends StatelessWidget {
  const ResetNewPasswordScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return new Scaffold(
      body: new SingleChildScrollView(
        child: new LoginBackground(childs: <Widget>[
          Text(
            "RESET NEW PASSWORD",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: getProportionateScreenWidth(20),
                color: nearlyBlack),
          ),
          SizedBox(height: getProportionateScreenHeight(50)),

          SizedBox(height: getProportionateScreenHeight(15)),
          RoundedPasswordField(
            hintText: 'New Password',
            onChanged: (value) {},
          ),
          RoundedPasswordField(
            hintText: 'Confirm Password',
            onChanged: (value) {},
          ),
          RoundedButton(
            text: "Verify New Password",
            press: () {
              GeneralHelper.navigateToScreen(
                  context, new LoginScreen(), true);
            },
          ),
          OrDivider(),
          RoundedButton(
            text: "Back to Login",
            press: () {},
          ),
        ]),
      ),
    );
  }
}
