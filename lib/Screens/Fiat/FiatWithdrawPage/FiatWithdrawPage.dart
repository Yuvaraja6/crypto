import 'package:cryptodesign/Common/CommonColors.dart';
import 'package:cryptodesign/Common/DynamicSizes.dart';
import 'package:cryptodesign/Widgets/Backgrounds/BackgroundUI.dart';
import 'package:cryptodesign/Widgets/CustomAppBar.dart';
import 'package:cryptodesign/Widgets/CustomText.dart';
import 'package:cryptodesign/Widgets/CustomTextField.dart';
import 'package:cryptodesign/Widgets/RoundedBoxButton.dart';
import 'package:cryptodesign/Widgets/RoundedButton.dart';
import 'package:flutter/material.dart';

class FiatWithdrawPage extends StatefulWidget {
  const FiatWithdrawPage({Key? key}) : super(key: key);

  @override
  State<FiatWithdrawPage> createState() => _FiatWithdrawPageState();
}

class _FiatWithdrawPageState extends State<FiatWithdrawPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundUI(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(title: 'Fiat Withdraw'),
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
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 15,
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
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CustomText(
                                  'Account Holder Name:',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              CustomTextFormField(
                                hintText: 'Enter Name',
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CustomText(
                                  'Account Holder Address:',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              CustomTextFormField(
                                hintText: 'Enter Address',
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CustomText(
                                  'Bank Name:',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              CustomTextFormField(
                                hintText: 'Enter Bank Name',
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CustomText(
                                  'Bank Address:',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              CustomTextFormField(
                                hintText: 'Enter Bank Address',
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CustomText(
                                  'IBAN:',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              CustomTextFormField(
                                hintText: 'Enter IBAN',
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CustomText(
                                  'Swift:',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              CustomTextFormField(
                                hintText: 'Enter swift',
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CustomText(
                                  'IFSC:',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              CustomTextFormField(
                                hintText: 'Enter IFSC',
                              ),
                              SizedBox(
                                height: 10,
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
                                        'Available Balance     : 12345.123 USD',
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
                            ],
                          ),
                        ),
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
