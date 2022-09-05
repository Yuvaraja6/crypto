import 'package:cryptodesign/Common/CommonColors.dart';
import 'package:cryptodesign/Common/DynamicSizes.dart';
import 'package:cryptodesign/Common/Navigators.dart';
import 'package:cryptodesign/Screens/Crypto/CryptoDepositPage/CryptoDepositPage.dart';
import 'package:cryptodesign/Screens/Crypto/CryptoWithdrawPage/CryptoWithdrawPage.dart';
import 'package:cryptodesign/Screens/Fiat/FiatDepositPage/FiatDepositPage.dart';
import 'package:cryptodesign/Screens/Fiat/FiatWithdrawPage/FiatWithdrawPage.dart';
import 'package:cryptodesign/Widgets/Backgrounds/BackgroundUI.dart';
import 'package:cryptodesign/Widgets/CustomAppBar.dart';
import 'package:cryptodesign/Widgets/CustomText.dart';
import 'package:cryptodesign/Widgets/RoundedBoxButton.dart';
import 'package:flutter/material.dart';

class WalletDetailsPage extends StatefulWidget {
  final String type;
  const WalletDetailsPage({Key? key, required this.type}) : super(key: key);

  @override
  State<WalletDetailsPage> createState() => _WalletDetailsPageState();
}

class _WalletDetailsPageState extends State<WalletDetailsPage> {
  List transactions = [
    {
      "transactionType": "Sent",
      "date": "08/06/2021",
      "cryptoAmount": 0.0002131,
      "usdValue": 0.123312
    },
    {
      "transactionType": "Received",
      "date": "09/06/2021",
      "cryptoAmount": 0.0002131,
      "usdValue": 0.123312
    },
    {
      "transactionType": "Received",
      "date": "09/06/2021",
      "cryptoAmount": 0.0002131,
      "usdValue": 0.123312
    },
    {
      "transactionType": "Sent",
      "date": "11/06/2021",
      "cryptoAmount": 0.0002131,
      "usdValue": 0.123312
    },
    {
      "transactionType": "Sent",
      "date": "11/06/2021",
      "cryptoAmount": 0.0002131,
      "usdValue": 0.123312
    },
    {
      "transactionType": "Received",
      "date": "12/06/2021",
      "cryptoAmount": 0.0002131,
      "usdValue": 0.123312
    },
    {
      "transactionType": "Sent",
      "date": "12/06/2021",
      "cryptoAmount": 0.0002131,
      "usdValue": 0.123312
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundUI(
          child: Column(
        children: [
          CustomAppBar(title: 'Bitcoin Wallet'),
          SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
                color: CommonColors().white(context),
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(color: CommonColors().grey, blurRadius: 5)
                ]),
            width: DynamicSizes().dynamicWidth(context, 0.9),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  CustomText(
                    'Balance',
                    color: CommonColors().black(context),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/images/coins/btc.png',
                          height: DynamicSizes().dynamicHeight(context, 0.1),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            CustomText(
                              '952.65 BTC',
                              color: CommonColors().black(context),
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                            CustomText(
                              '~ 32450.32 USD',
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RoundedBoxButton(
                        onTap: () {
                          if (widget.type == 'crypto') {
                            NavigatorsCommon().newPageRoute(
                                context, CryptoDepositPage(),
                                startFractionalOffset:
                                    FractionalOffset.topRight);
                          } else {
                            NavigatorsCommon().newPageRoute(
                                context, FiatDepositPage(),
                                startFractionalOffset:
                                    FractionalOffset.topRight);
                          }
                        },
                        icon: Icon(
                          Icons.arrow_upward,
                          color: CommonColors().white(context),
                        ),
                        text: 'Deposit',
                        buttonColor: CommonColors().appTheme,
                        textColor: CommonColors().white(context),
                        height: DynamicSizes().dynamicHeight(context, 0.06),
                        width: DynamicSizes().dynamicWidth(context, 0.3),
                      ),
                      RoundedBoxButton(
                        onTap: () {
                          if (widget.type == 'crypto') {
                            NavigatorsCommon().newPageRoute(
                                context, CryptoWithdrawPage(),
                                startFractionalOffset:
                                    FractionalOffset.topRight);
                          } else {
                            NavigatorsCommon().newPageRoute(
                                context, FiatWithdrawPage(),
                                startFractionalOffset:
                                    FractionalOffset.topRight);
                          }
                        },
                        icon: Icon(
                          Icons.arrow_downward,
                          color: CommonColors().white(context),
                        ),
                        text: 'Withdraw',
                        buttonColor: CommonColors().appTheme,
                        textColor: CommonColors().white(context),
                        height: DynamicSizes().dynamicHeight(context, 0.06),
                        width: DynamicSizes().dynamicWidth(context, 0.3),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomText(
                'History:',
                color: CommonColors().black(context),
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: transactions.length,
                itemBuilder: (context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: CommonColors().white(context),
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(color: CommonColors().grey, blurRadius: 3)
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: CommonColors().white(context),
                                      boxShadow: [
                                        BoxShadow(
                                            color: CommonColors().grey,
                                            blurRadius: 3)
                                      ]),
                                  child: transactions[index]
                                              ['transactionType'] ==
                                          "Sent"
                                      ? Icon(
                                          Icons.arrow_upward,
                                          size: 40,
                                          color: CommonColors().red,
                                        )
                                      : Icon(
                                          Icons.arrow_downward,
                                          size: 40,
                                          color: Colors.green,
                                        ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(transactions[index]
                                          ['transactionType']),
                                      CustomText(transactions[index]['date']),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                CustomText(transactions[index]['cryptoAmount']
                                    .toString()),
                                CustomText(
                                    transactions[index]["usdValue"].toString()),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          )
        ],
      )),
    );
  }
}
