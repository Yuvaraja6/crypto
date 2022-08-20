import 'package:cryptodesign/Common/CommonColors.dart';
import 'package:cryptodesign/Common/DynamicSizes.dart';
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
                              validator: (val) {
                                if (val!.isEmpty || val == null) {
                                  return 'Enter e-mail';
                                } else {
                                  return null;
                                }
                              },
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
                          TextButton(
                            onPressed: () {},
                            child: CustomText(
                              'Forgot Password',
                              color: CommonColors().appTheme,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RoundedButton(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (builder) => HomePage()));
                                },
                                text: 'Login'),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText('New User? '),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (builder) =>
                                                RegisterPage()));
                                  },
                                  child: CustomText(
                                    'Create Account',
                                    color: CommonColors().appTheme,
                                  )),
                            ],
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
