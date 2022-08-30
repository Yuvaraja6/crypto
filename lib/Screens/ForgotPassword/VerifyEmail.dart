import 'package:cryptodesign/Common/CommonColors.dart';
import 'package:cryptodesign/Common/DynamicSizes.dart';
import 'package:cryptodesign/Common/Navigators.dart';
import 'package:cryptodesign/Screens/EmailValidation/EmailValidation.dart';
import 'package:cryptodesign/Screens/ForgotPassword/ForgotPassword.dart';
import 'package:cryptodesign/Widgets/Backgrounds/EmailChangeBG.dart';
import 'package:cryptodesign/Widgets/CustomText.dart';
import 'package:cryptodesign/Widgets/CustomTextField.dart';
import 'package:cryptodesign/Widgets/RoundedBoxButton.dart';
import 'package:flutter/material.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({Key? key}) : super(key: key);

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          'Verify Email',
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        toolbarHeight: 70,
        elevation: 14,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(60),
          bottomLeft: Radius.circular(60),
        )),
      ),
      body: EmailChangeBG(
          child: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              CustomText(
                'Forgot your password?',
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                height: 5,
              ),
              CustomText(
                '      No problem. Just let us know your email address and we will email you a password reset OTP that will verify you to choose a new one.',
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 15,
              ),
              CustomTextFormField(
                prefixIcon: Icon(
                  Icons.mail,
                  color: CommonColors().appTheme,
                ),
                hintText: 'Enter Email',
                contentPadding: EdgeInsets.only(top: 15),
                enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: CommonColors().appTheme, width: 3),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: CommonColors().appTheme, width: 3),
                ),
              ),
              SizedBox(
                height: 45,
              ),
              Center(
                  child: RoundedBoxButton(
                text: 'Send Verification Code',
                width: DynamicSizes().dynamicWidth(context, 1),
                onTap: () {
                  NavigatorsCommon().newPageRoute(
                      context, OTPVerification(routePage: ForgotPassword()));
                },
              )),
            ],
          ),
        ),
      )),
    );
  }
}
