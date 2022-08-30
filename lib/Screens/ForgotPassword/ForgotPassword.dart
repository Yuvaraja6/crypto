import 'package:cryptodesign/Common/CommonColors.dart';
import 'package:cryptodesign/Common/DynamicSizes.dart';
import 'package:cryptodesign/Widgets/Backgrounds/EmailChangeBG.dart';
import 'package:cryptodesign/Widgets/CustomText.dart';
import 'package:cryptodesign/Widgets/CustomTextField.dart';
import 'package:cryptodesign/Widgets/RoundedBoxButton.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  bool oldPassword = true;
  bool newPassword = true;
  bool confirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          'Reset Password',
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
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: CustomTextFormField(
                  prefixIcon: Icon(
                    Icons.key,
                    color: CommonColors().appTheme,
                  ),
                  obscureText: oldPassword,
                  hintText: 'Password',
                  labelText: 'Password',
                  suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          oldPassword = !oldPassword;
                        });
                      },
                      child: Icon(oldPassword
                          ? Icons.visibility
                          : Icons.visibility_off)),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: CustomTextFormField(
                  prefixIcon: Icon(
                    Icons.key,
                    color: CommonColors().appTheme,
                  ),
                  obscureText: confirmPassword,
                  hintText: 'Confirm Password',
                  labelText: 'Confirm Password',
                  suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          confirmPassword = !confirmPassword;
                        });
                      },
                      child: Icon(confirmPassword
                          ? Icons.visibility
                          : Icons.visibility_off)),
                ),
              ),
              SizedBox(
                height: 45,
              ),
              Center(
                  child: RoundedBoxButton(
                text: 'Reset Password',
                width: DynamicSizes().dynamicWidth(context, 0.85),
              )),
            ],
          ),
        ),
      )),
    );
  }
}
