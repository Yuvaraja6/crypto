import 'package:cryptodesign/Common/CommonColors.dart';
import 'package:cryptodesign/Common/DynamicSizes.dart';
import 'package:cryptodesign/Widgets/Backgrounds/BackgroundUI.dart';
import 'package:cryptodesign/Widgets/CustomAppBar.dart';
import 'package:cryptodesign/Widgets/CustomText.dart';
import 'package:cryptodesign/Widgets/CustomTextField.dart';
import 'package:cryptodesign/Widgets/RoundedBoxButton.dart';
import 'package:cryptodesign/Widgets/RoundedButton.dart';
import 'package:flutter/material.dart';

class CryptoWithdrawPage extends StatefulWidget {
  const CryptoWithdrawPage({Key? key}) : super(key: key);

  @override
  State<CryptoWithdrawPage> createState() => _CryptoWithdrawPageState();
}

class _CryptoWithdrawPageState extends State<CryptoWithdrawPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundUI(
        child: Stack(
          children: [
            CustomAppBar(title: 'Crypto Withdraw'),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        width: DynamicSizes().dynamicWidth(context, 0.9),
                        decoration: BoxDecoration(
                            color: CommonColors().white(context),
                            borderRadius: BorderRadius.circular(30.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5.0,
                              ),
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 30,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CustomText(
                                  'Crypto Address:',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              CustomTextFormField(
                                hintText: 'Enter BTC Address',
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CustomText(
                                  'Amount:',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              CustomTextFormField(
                                hintText: 'Enter Amount',
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Center(
                                  child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: RoundedBoxButton(
                                    text: 'Request Withdrawal'),
                              )),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                height: 120,
                                child: Center(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      CustomText(
                                        'Available Balance     : 12345.123 BTC',
                                        fontSize: 18,
                                      ),
                                      CustomText(
                                        'Withdraw fee             : 0.1%',
                                        fontSize: 18,
                                      ),
                                      CustomText(
                                        'Minimum Withdraw  : 0.5 BTC',
                                        fontSize: 18,
                                      ),
                                      CustomText(
                                        'Maximum Withdraw : 100 BTC',
                                        fontSize: 18,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              RoundedBoxButton(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                text: 'Go Back',
                                textColor: CommonColors().appTheme,
                                buttonColor: Colors.transparent,
                                shadow: false,
                                icon: Icon(
                                  Icons.arrow_back,
                                  color: CommonColors().appTheme,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
