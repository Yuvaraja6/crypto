import 'package:cryptodesign/Common/CommonColors.dart';
import 'package:cryptodesign/Common/DynamicSizes.dart';
import 'package:cryptodesign/Common/Navigators.dart';
import 'package:cryptodesign/Screens/LoginPage/LoginPage.dart';
import 'package:cryptodesign/Widgets/Backgrounds/EmailChangeBG.dart';
import 'package:cryptodesign/Widgets/CustomText.dart';
import 'package:cryptodesign/Widgets/CustomTextField.dart';
import 'package:cryptodesign/Widgets/RoundedBoxButton.dart';
import 'package:flutter/material.dart';

class DeleteAccount extends StatefulWidget {
  const DeleteAccount({Key? key}) : super(key: key);

  @override
  State<DeleteAccount> createState() => _DeleteAccountState();
}

class _DeleteAccountState extends State<DeleteAccount> {
  deleteAlert() async {
    return await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            titlePadding: EdgeInsets.all(10.0),
            contentPadding: EdgeInsets.only(left: 20, right: 20),
            actionsPadding: EdgeInsets.all(10.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomText(
                'Delete Account',
                textAlign: TextAlign.center,
                fontWeight: FontWeight.bold,
                color: CommonColors().red,
                fontSize: 20,
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomText(
                  'Are you sure you want to delete your account?'
                  '\n\nPlease enter your password to confirm you would like to permanently delete your account.',
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 40,
                  child: CustomTextFormField(
                    contentPadding: EdgeInsets.fromLTRB(16, 4, 4, 4),
                    hintText: 'Enter Password',
                    obscureText: true,
                  ),
                )
              ],
            ),
            actions: <Widget>[
              RoundedBoxButton(
                height: 40,
                text: 'Never mind',
                width: 130,
                onTap: () {
                  NavigatorsCommon().backPage(context);
                },
              ),
              RoundedBoxButton(
                height: 40,
                text: 'Delete Account',
                buttonColor: CommonColors().red,
                width: 130,
                onTap: () {
                  NavigatorsCommon().newPageReplaceRoute(context, LoginPage());
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          'Delete Account',
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
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                  child: CustomText(
                'Permanently delete your account!!!',
                fontWeight: FontWeight.bold,
                color: CommonColors().red,
              )),
              const SizedBox(
                height: 30,
              ),
              CustomText(
                'Once your account is deleted, all of its resources and data will be permanently deleted. '
                'Before deleting your account, please download any data or information that you wish to retain.',
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 30,
              ),
              RoundedBoxButton(
                onTap: () {
                  deleteAlert();
                },
                text: 'Delete Account',
                width: DynamicSizes().dynamicWidth(context, 1),
                buttonColor: CommonColors().red,
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
