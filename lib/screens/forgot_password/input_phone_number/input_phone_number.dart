import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_hair_time_mobile/screens/forgot_password/input_otp_code/input_otp_code.dart';
import 'package:project_hair_time_mobile/screens/login/components/login_background.dart';
import 'package:project_hair_time_mobile/screens/login/login_screen.dart';
import 'package:project_hair_time_mobile/screens/signup/components/or_divider.dart';
import 'package:project_hair_time_mobile/screens/signup/components/social_icon.dart';
import 'package:project_hair_time_mobile/shared/general_helpers/general_helpers.dart';
import 'package:project_hair_time_mobile/shared/shared_components/rounded_button.dart';
import 'package:project_hair_time_mobile/shared/shared_components/rounded_input_field.dart';
import 'package:project_hair_time_mobile/shared/shared_components/rounded_password_field.dart';
import 'package:project_hair_time_mobile/shared/shared_variables/contants.dart';
import 'package:project_hair_time_mobile/shared/size/size_config.dart';

class InputPhoneToGetOTPScreen extends StatelessWidget {
  const InputPhoneToGetOTPScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new SingleChildScrollView(
        child: new LoginBackground(childs: <Widget>[
          Text(
            "Input Phone Number to get OTP Code",
            style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: getProportionateScreenWidth(18),
                color: nearlyBlack),
          ),
          SizedBox(height: getProportionateScreenHeight(50)),
          RoundedInputField(
            isNumber: true,
            hintText: "Phone Number",
            icon: Icons.phone_android,
            onChanged: (value) {},
          ),
          SizedBox(height: getProportionateScreenHeight(15)),

          RoundedButton(
            text: "Get OTP",
            press: () {
              GeneralHelper.navigateToScreen(context, 
                new InputOtpCodeScreen(), true);
            },
          ),
          OrDivider(),
          RoundedButton(
            text: "Back to Login",
            press: () {
              GeneralHelper.navigateToScreen(context, 
                new LoginScreen(), true);
            },
          ),
          
        ]),
      ),
    );
  
  }
}
