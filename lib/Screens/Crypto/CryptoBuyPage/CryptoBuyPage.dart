import 'package:cryptodesign/Widgets/Backgrounds/BackgroundUI.dart';
import 'package:cryptodesign/Widgets/CustomAppBar.dart';
import 'package:cryptodesign/Widgets/CustomTextField.dart';
import 'package:flutter/material.dart';

class CryptoBuyPage extends StatefulWidget {
  const CryptoBuyPage({Key? key}) : super(key: key);

  @override
  State<CryptoBuyPage> createState() => _CryptoBuyPageState();
}

class _CryptoBuyPageState extends State<CryptoBuyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundUI(
          child: Column(
        children: [
          CustomAppBar(title: 'Buy'),
          SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.transparent,
                boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 3)]),
            child: CustomTextFormField(
              hintText: 'I want to buy',
            ),
          ),
        ],
      )),
    );
  }
}
