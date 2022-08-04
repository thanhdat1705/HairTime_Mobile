import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:project_hair_time_mobile/screens/forgot_password/input_phone_number/input_phone_number.dart';
import 'package:project_hair_time_mobile/screens/forgot_password/reset_new_password/reset_new_password.dart';
import 'package:project_hair_time_mobile/screens/login/components/login_background.dart';
import 'package:project_hair_time_mobile/screens/signup/components/or_divider.dart';
import 'package:project_hair_time_mobile/shared/general_helpers/general_helpers.dart';
import 'package:project_hair_time_mobile/shared/shared_components/rounded_button.dart';
import 'package:project_hair_time_mobile/shared/shared_components/rounded_input_field.dart';
import 'package:project_hair_time_mobile/shared/shared_variables/contants.dart';
import 'package:project_hair_time_mobile/shared/size/size_config.dart';

class InputOtpCodeScreen extends StatelessWidget {
  const InputOtpCodeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return new Scaffold(
      body: new SingleChildScrollView(
        child: new LoginBackground(childs: <Widget>[
          Text(
            "Verify OTP Code",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: getProportionateScreenWidth(20),
                color: nearlyBlack),
          ),
          Text(
            "Please type the OTP Code was sent to",
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: getProportionateScreenWidth(17),
              color: nearlyBlack,
            ),
          ),
          Text(
            "+84 789 008 130",
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: getProportionateScreenWidth(18),
              color: nearlyBlack,
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(50)),
          OTPTextField(
            width: getProportionateScreenWidth(240),
            textFieldAlignment: MainAxisAlignment.spaceAround,
            fieldWidth: 35,
            fieldStyle: FieldStyle.box,
            style: TextStyle(fontSize: getProportionateScreenWidth(20)),
            onCompleted: (pin) {
              GeneralHelper.navigateToScreen(
                  context, new ResetNewPasswordScreen(), false);
            },
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          RoundedButton(
            text: "Verify OTP",
            press: () {
              GeneralHelper.navigateToScreen(
                  context, new ResetNewPasswordScreen(), false);
            },
          ),
          SizedBox(height: getProportionateScreenHeight(17)),
          new Text(
            'Not get OTP yet?',
            //style: new TextStyle(color: Colors.blue),
          ),
          new GestureDetector(
            child: new Text(
              'Send again',
              style: new TextStyle(color: Colors.blue),
            ),
            onTap: () {
              GeneralHelper.navigateToScreen(
                  context, new InputPhoneToGetOTPScreen(), false);
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
