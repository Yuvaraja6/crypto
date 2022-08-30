import 'package:cryptodesign/Common/CommonColors.dart';
import 'package:cryptodesign/Common/DynamicSizes.dart';
import 'package:cryptodesign/Common/Navigators.dart';
import 'package:cryptodesign/Screens/EmailValidation/EmailValidation.dart';
import 'package:cryptodesign/Screens/HomePage/HomePage.dart';
import 'package:cryptodesign/Screens/LoginPage/LoginPage.dart';
import 'package:cryptodesign/Widgets/CustomText.dart';
import 'package:cryptodesign/Widgets/CustomTextField.dart';
import 'package:cryptodesign/Widgets/RoundedButton.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: SizedBox(
          height: DynamicSizes().dynamicHeight(context, 1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Container(
                    height: 100,
                    child: Image.asset(
                      'assets/images/logo/logo.png',
                      fit: BoxFit.fitWidth,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: CustomTextFormField(
                            prefixIcon: Icon(Icons.mail),
                            hintText: 'Enter E-mail',
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: CustomTextFormField(
                            prefixIcon: Icon(Icons.vpn_key),
                            obscureText: true,
                            hintText: 'Enter Password',
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: CustomTextFormField(
                            prefixIcon: Icon(Icons.vpn_key),
                            obscureText: true,
                            hintText: 'Enter Confirm Password',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: RoundedButton(
                            text: 'Register',
                            onTap: () {
                              NavigatorsCommon().newPageRoute(context,
                                  OTPVerification(routePage: HomePage()));
                            },
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText('Already have an account? '),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (builder) => LoginPage()));
                                },
                                child: CustomText(
                                  'Sign in',
                                  color: CommonColors().appTheme,
                                )),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
