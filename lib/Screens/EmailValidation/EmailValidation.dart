import 'package:cryptodesign/Common/CommonColors.dart';
import 'package:cryptodesign/Common/DynamicSizes.dart';
import 'package:cryptodesign/Common/Navigators.dart';
import 'package:cryptodesign/Screens/ForgotPassword/ForgotPassword.dart';
import 'package:cryptodesign/Widgets/Backgrounds/EmailChangeBG.dart';
import 'package:cryptodesign/Widgets/CustomText.dart';
import 'package:cryptodesign/Widgets/OTPInput.dart';
import 'package:cryptodesign/Widgets/RoundedBoxButton.dart';
import 'package:flutter/material.dart';

class OTPVerification extends StatefulWidget {
  Widget routePage;
  OTPVerification({Key? key, required this.routePage}) : super(key: key);

  @override
  _OTPVerificationState createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {
  final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final TextEditingController _fieldThree = TextEditingController();
  final TextEditingController _fieldFour = TextEditingController();
  final TextEditingController _fieldFive = TextEditingController();
  final TextEditingController _fieldSix = TextEditingController();

  String? _otp;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          'OTP Verification',
          color: CommonColors().white(context),
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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                  'Enter the code we just sent you on your email address.'),
              const SizedBox(
                height: 30,
              ),
              // Implement 4 input fields
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OtpInput(_fieldOne, true),
                  OtpInput(_fieldTwo, false),
                  OtpInput(_fieldThree, false),
                  OtpInput(_fieldFour, false),
                  OtpInput(_fieldFive, false),
                  OtpInput(_fieldSix, false)
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              CustomText('If you didn\'t receive a code?'),
              GestureDetector(
                  onTap: () {},
                  child: CustomText(
                    'Resend',
                    color: CommonColors().appTheme,
                    fontWeight: FontWeight.bold,
                  )),
              const SizedBox(
                height: 30,
              ),
              RoundedBoxButton(
                onTap: () {
                  setState(() {
                    _otp = _fieldOne.text +
                        _fieldTwo.text +
                        _fieldThree.text +
                        _fieldFour.text +
                        _fieldFive.text +
                        _fieldSix.text;
                  });
                  NavigatorsCommon().newPageRoute(context, widget.routePage);
                },
                text: 'Verify',
                width: DynamicSizes().dynamicWidth(context, 1),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
