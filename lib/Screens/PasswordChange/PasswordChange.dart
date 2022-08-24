import 'package:cryptodesign/Common/CommonColors.dart';
import 'package:cryptodesign/Common/DynamicSizes.dart';
import 'package:cryptodesign/Widgets/Backgrounds/BackgroundUI.dart';
import 'package:cryptodesign/Widgets/Backgrounds/EmailChangeBG.dart';
import 'package:cryptodesign/Widgets/CustomText.dart';
import 'package:cryptodesign/Widgets/CustomTextField.dart';
import 'package:cryptodesign/Widgets/RoundedBoxButton.dart';
import 'package:flutter/material.dart';

class EmailChange extends StatefulWidget {
  const EmailChange({Key? key}) : super(key: key);

  @override
  State<EmailChange> createState() => _EmailChangeState();
}

class _EmailChangeState extends State<EmailChange> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          'Change Email',
          color: Colors.white,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Center(
                child: CustomText(
                  'Fill the form to change email address',
                  color: CommonColors().appTheme,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: CustomTextFormField(
                  prefixIcon: Icon(
                    Icons.email,
                    color: CommonColors().appTheme,
                  ),
                  controller: TextEditingController(
                      text: 'yuvaraja.clarisco@gmail.com'),
                  hintText: 'Enter Email',
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
