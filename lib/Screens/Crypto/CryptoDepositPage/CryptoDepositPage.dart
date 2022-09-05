import 'package:cryptodesign/Common/CommonColors.dart';
import 'package:cryptodesign/Common/DynamicSizes.dart';
import 'package:cryptodesign/Widgets/Backgrounds/BackgroundUI.dart';
import 'package:cryptodesign/Widgets/CustomAppBar.dart';
import 'package:cryptodesign/Widgets/CustomText.dart';
import 'package:cryptodesign/Widgets/RoundedBoxButton.dart';
import 'package:cryptodesign/Widgets/RoundedButton.dart';
import 'package:flutter/material.dart';

class CryptoDepositPage extends StatefulWidget {
  const CryptoDepositPage({Key? key}) : super(key: key);

  @override
  State<CryptoDepositPage> createState() => _CryptoDepositPageState();
}

class _CryptoDepositPageState extends State<CryptoDepositPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundUI(
        child: Stack(
          children: [
            CustomAppBar(title: 'Crypto Deposit'),
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
                        child: Column(
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            CustomText(
                              'BTC Address',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: CommonColors().appTheme,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Image.asset(
                              'assets/images/qrdemo.png',
                              height: 200,
                              width: 200,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Divider(
                              color: Colors.grey,
                              thickness: 1,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 70,
                                decoration: BoxDecoration(
                                    color: CommonColors().grey.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Center(
                                        child: CustomText(
                                          '1AH34432B354B21UB32134BB1123B41948JH3FD3F34RF332S1',
                                          textAlign: TextAlign.center,
                                          color: CommonColors().grey,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Icon(
                                              Icons.copy,
                                              color: CommonColors().grey,
                                              size: 20,
                                            ),
                                            CustomText(
                                              'Copy',
                                              color: CommonColors().grey,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.warning,
                                  color: CommonColors().red,
                                  size: 30,
                                ),
                                SizedBox(
                                  width:
                                      DynamicSizes().dynamicWidth(context, 0.8),
                                  child: CustomText(
                                    'Warning: Please don\'t deposit any digital assets other than BTC to the above address',
                                    color: CommonColors().red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    textAlign: TextAlign.justify,
                                  ),
                                )
                              ],
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
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
