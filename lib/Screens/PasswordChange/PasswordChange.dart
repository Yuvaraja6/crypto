import 'package:cryptodesign/Common/CommonColors.dart';
import 'package:cryptodesign/Common/DynamicSizes.dart';
import 'package:cryptodesign/Widgets/Backgrounds/EmailChangeBG.dart';
import 'package:cryptodesign/Widgets/CustomText.dart';
import 'package:cryptodesign/Widgets/CustomTextField.dart';
import 'package:cryptodesign/Widgets/RoundedBoxButton.dart';
import 'package:flutter/material.dart';

class PasswordChange extends StatefulWidget {
  const PasswordChange({Key? key}) : super(key: key);

  @override
  State<PasswordChange> createState() => _PasswordChangeState();
}

class _PasswordChangeState extends State<PasswordChange> {
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
          'Update Password',
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
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, right: 30),
                  child: CustomText(
                    'Ensure your account is using a long, random password to stay secure.',
                    color: CommonColors().appTheme,
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: CustomTextFormField(
                  prefixIcon: Icon(
                    Icons.key,
                    color: CommonColors().appTheme,
                  ),
                  obscureText: oldPassword,
                  hintText: 'Current Password',
                  labelText: 'Current Password',
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
                  obscureText: newPassword,
                  hintText: 'New Password',
                  labelText: 'New Password',
                  suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          newPassword = !newPassword;
                        });
                      },
                      child: Icon(newPassword
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
                height: 25,
              ),
              Center(
                  child: RoundedBoxButton(
                text: 'Save',
                width: DynamicSizes().dynamicWidth(context, 0.85),
              )),
            ],
          ),
        ),
      )),
    );
  }
}
