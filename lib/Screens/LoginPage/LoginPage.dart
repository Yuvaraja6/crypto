import 'package:cryptodesign/Common/CommonColors.dart';
import 'package:cryptodesign/Common/DynamicSizes.dart';
import 'package:cryptodesign/Common/EmailValidator.dart';
import 'package:cryptodesign/Common/Navigators.dart';
import 'package:cryptodesign/Screens/ForgotPassword/ForgotPassword.dart';
import 'package:cryptodesign/Screens/ForgotPassword/VerifyEmail.dart';
import 'package:cryptodesign/Screens/HomePage/HomePage.dart';
import 'package:cryptodesign/Screens/RegisterPage/RegisterPage.dart';
import 'package:cryptodesign/Widgets/CustomText.dart';
import 'package:cryptodesign/Widgets/CustomTextField.dart';
import 'package:cryptodesign/Widgets/RoundedButton.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

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
                        color: CommonColors().white,
                        borderRadius: BorderRadius.circular(30)),
                    child: Form(
                      key: _formKey,
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
                              validator: (input) => input!.isValidEmail()
                                  ? null
                                  : "Check your email",
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
                            padding: const EdgeInsets.all(16.0),
                            child: RoundedButton(
                                onTap: () {
                                  // if (_formKey.currentState!.validate()) {
                                  NavigatorsCommon().newPageRoute(
                                      context, HomePage(),
                                      startFractionalOffset:
                                          FractionalOffset.center);
                                  // }
                                },
                                text: 'Login'),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 25.0, right: 25.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CustomText('New User? '),
                                    TextButton(
                                        onPressed: () {
                                          NavigatorsCommon().newPageRoute(
                                              context, RegisterPage(),
                                              startFractionalOffset:
                                                  FractionalOffset.bottomLeft);
                                        },
                                        child: CustomText(
                                          'Create Account',
                                          color: CommonColors().appTheme,
                                        )),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    NavigatorsCommon().newPageRoute(
                                        context, VerifyEmail(),
                                        startFractionalOffset:
                                            FractionalOffset.bottomRight);
                                  },
                                  child: CustomText(
                                    'Forgot Password',
                                    color: CommonColors().appTheme,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
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
