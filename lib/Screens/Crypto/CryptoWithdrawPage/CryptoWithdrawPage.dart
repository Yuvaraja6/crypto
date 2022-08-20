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
        child: Column(
          children: [
            CustomAppBar(title: 'Crypto Withdraw'),
            Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    height: DynamicSizes().dynamicHeight(context, 0.8),
                    width: DynamicSizes().dynamicWidth(context, 0.9),
                    decoration: BoxDecoration(
                        color: Colors.white,
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
                            child: RoundedBoxButton(text: 'Request Withdrawal'),
                          )),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 120,
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                          Center(
                            child: RoundedButton(
                              onTap: () {},
                              text: 'Withdraw History',
                              textColor: CommonColors().appTheme,
                              buttonColor: Colors.transparent,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
