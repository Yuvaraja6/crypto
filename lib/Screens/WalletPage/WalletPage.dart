import 'package:cryptodesign/Common/CommonColors.dart';
import 'package:cryptodesign/Common/DynamicSizes.dart';
import 'package:cryptodesign/Common/Navigators.dart';
import 'package:cryptodesign/Screens/Crypto/CryptoDepositPage/CryptoDepositPage.dart';
import 'package:cryptodesign/Screens/Crypto/CryptoWithdrawPage/CryptoWithdrawPage.dart';
import 'package:cryptodesign/Screens/WalletPage/WalletDetailsPage.dart';
import 'package:cryptodesign/Widgets/Backgrounds/WalletsBG.dart';
import 'package:cryptodesign/Widgets/CustomAppBar.dart';
import 'package:cryptodesign/Widgets/RowDoubleText.dart';
import 'package:cryptodesign/Widgets/CustomText.dart';
import 'package:cryptodesign/Widgets/RoundedBoxButton.dart';
import 'package:flutter/material.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  @override
  void initState() {
    super.initState();
  }

  List coinsList = [
    {
      "coinName": "BTC",
      "type": "crypto",
      "total": "23345.44",
      "available": "12234.44",
      "image": "assets/images/coins/btc.png",
      "lastPrice": "12345.22",
      "percentage": 3.44
    },
    {
      "coinName": "ETH",
      "type": "crypto",
      "total": "31245.44",
      "available": "45334.44",
      "image": "assets/images/coins/eth.png",
      "lastPrice": "52321.22",
      "percentage": -3.44
    },
    {
      "coinName": "LTC",
      "type": "crypto",
      "total": "31245.44",
      "available": "12345.44",
      "image": "assets/images/coins/ltc.png",
      "lastPrice": "51234.22",
      "percentage": 53.44
    },
    {
      "coinName": "USD",
      "type": "fiat",
      "total": "31245.44",
      "available": "31111.44",
      "image": "assets/images/coins/usd.png",
      "lastPrice": "23421.22",
      "percentage": -33.44
    },
    {
      "coinName": "HUN",
      "type": "fiat",
      "total": "31245.44",
      "available": "22111.44",
      "image": "assets/images/coins/eth.png",
      "lastPrice": "2343.22",
      "percentage": 13.44
    },
    {
      "coinName": "INR",
      "type": "fiat",
      "total": "31245.44",
      "available": "12312.44",
      "image": "assets/images/coins/usd.png",
      "lastPrice": "34321.22",
      "percentage": -5.44
    },
  ];

  CommonColors commonColors = CommonColors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CommonColors().white(context),
      body: WalletsBG(
        child: Column(
          children: [
            CustomAppBar(title: 'Wallet'),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CustomText(
                          'Total Approx.',
                          color: CommonColors().white(context),
                        ),
                        CustomText(
                          '\$632,32,234.56',
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: CommonColors().white(context),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      RoundedBoxButton(
                        onTap: () {
                          NavigatorsCommon().newPageRoute(
                              context, CryptoDepositPage(),
                              startFractionalOffset: FractionalOffset.topRight);
                        },
                        icon: Icon(
                          Icons.arrow_upward,
                          color: CommonColors().appTheme,
                        ),
                        text: 'Deposit',
                        buttonColor: CommonColors().white(context),
                        textColor: CommonColors().appTheme,
                        height: 40,
                        width: DynamicSizes().dynamicWidth(context, 0.3),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      RoundedBoxButton(
                        onTap: () {
                          NavigatorsCommon().newPageRoute(
                              context, CryptoWithdrawPage(),
                              startFractionalOffset: FractionalOffset.topRight);
                        },
                        icon: Icon(
                          Icons.arrow_downward,
                          color: CommonColors().appTheme,
                        ),
                        text: 'Withdraw',
                        buttonColor: CommonColors().white(context),
                        textColor: CommonColors().appTheme,
                        height: 40,
                        width: DynamicSizes().dynamicWidth(context, 0.3),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: CommonColors().white(context),
                      boxShadow: [
                        BoxShadow(color: CommonColors().grey, blurRadius: 5),
                      ]),
                  child: ListView.separated(
                    padding: EdgeInsets.zero,
                    itemCount: coinsList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (builder) => WalletDetailsPage(
                                          type: coinsList[index]['type'],
                                        )));
                          },
                          child: Container(
                            color: Colors.transparent,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(
                                            coinsList[index]['image'],
                                            width: 30,
                                            height: 30,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          CustomText(
                                            coinsList[index]['coinName'],
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          CustomText(
                                            coinsList[index]['lastPrice'],
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                          SizedBox(width: 5),
                                          CustomText(
                                            coinsList[index]['percentage']
                                                    .toString() +
                                                ' %',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: coinsList[index]
                                                        ['percentage'] <
                                                    0
                                                ? CommonColors().red
                                                : Colors.green,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                RowDoubleText(
                                  firstText: 'Total Balance',
                                  firstTextColor: CommonColors().black(context),
                                  lastText: coinsList[index]['total'],
                                  lastTextColor: CommonColors().black(context),
                                ),
                                RowDoubleText(
                                  firstText: 'Available Balance',
                                  firstTextColor: CommonColors().black(context),
                                  lastText: coinsList[index]['available'],
                                  lastTextColor: CommonColors().black(context),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider();
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
