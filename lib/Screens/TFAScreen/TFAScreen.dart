import 'package:cryptodesign/Common/CommonColors.dart';
import 'package:cryptodesign/Common/DynamicSizes.dart';
import 'package:cryptodesign/Widgets/Backgrounds/BackgroundUI.dart';
import 'package:cryptodesign/Widgets/Backgrounds/EmailChangeBG.dart';
import 'package:cryptodesign/Widgets/CustomText.dart';
import 'package:cryptodesign/Widgets/CustomTextField.dart';
import 'package:cryptodesign/Widgets/RoundedBoxButton.dart';
import 'package:flutter/material.dart';

class TFAScreen extends StatefulWidget {
  const TFAScreen({Key? key}) : super(key: key);

  @override
  State<TFAScreen> createState() => _TFAScreenState();
}

class _TFAScreenState extends State<TFAScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          'TFA Screen',
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
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 50,
          ),
          Image.asset(
            'assets/images/qrdemo.png',
            height: 200,
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: CustomText(
              'Scan this QR from your authentication application to enable TFA',
              textAlign: TextAlign.justify,
            ),
          ),
          RoundedBoxButton(
            text: 'Disable TFA',
            buttonColor: Colors.red,
          ),
        ],
      )),
    );
  }
}
