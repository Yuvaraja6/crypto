import 'dart:convert';

import 'package:candlesticks/candlesticks.dart';
import 'package:cryptodesign/Common/CommonColors.dart';
import 'package:cryptodesign/Common/DynamicSizes.dart';
import 'package:cryptodesign/Screens/Crypto/CryptoBuyPage/CryptoBuyPage.dart';
import 'package:cryptodesign/Screens/HomePage/HomePage.dart';
import 'package:cryptodesign/Widgets/Backgrounds/BackgroundUI.dart';
import 'package:cryptodesign/Widgets/CustomAppBar.dart';
import 'package:cryptodesign/Widgets/CustomText.dart';
import 'package:cryptodesign/Widgets/RoundedBoxButton.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:http/http.dart' as http;

class ChartViewPage extends StatefulWidget {
  String? pair;
  ChartViewPage({Key? key, this.pair = 'ETHBTC'}) : super(key: key);

  @override
  State<ChartViewPage> createState() => _ChartViewPageState();
}

class _ChartViewPageState extends State<ChartViewPage> {
  TooltipBehavior? _tooltipBehavior;

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundUI(
          child: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(title: widget.pair ?? 'Ethereum'),
            CustomText(
              '12345.23 ETH',
              color: CommonColors().white(context),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: CommonColors().white(context),
                  boxShadow: [
                    BoxShadow(color: CommonColors().grey, blurRadius: 5),
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: CustomText(
                  '0.23%',
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Center(
                child: Container(
                    width: DynamicSizes().dynamicWidth(context, 0.9),
                    height: DynamicSizes().dynamicHeight(context, 0.5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: CommonColors().white(context),
                        boxShadow: [
                          BoxShadow(color: CommonColors().grey, blurRadius: 5),
                        ]),
                    child: ChartIndicator(
                      pair: widget.pair,
                    ))),
            SizedBox(
              height: 40,
            ),
            RoundedBoxButton(
                onTap: () {
                  Navigator.pushAndRemoveUntil<dynamic>(
                    context,
                    MaterialPageRoute<dynamic>(
                      builder: (BuildContext context) => HomePage(
                        index: 1,
                        pair: widget.pair,
                      ),
                    ),
                    (route) =>
                        false, //if you want to disable back feature set to false
                  );
                },
                text: 'Buy Now'),
            SizedBox(
              height: 20,
            ),
            RoundedBoxButton(
              onTap: () {
                Navigator.pop(context);
              },
              text: 'Go Back',
              shadow: false,
              textColor: CommonColors().appTheme,
              buttonColor: Colors.transparent,
              icon: Icon(
                Icons.arrow_back,
                color: CommonColors().appTheme,
              ),
            )
          ],
        ),
      )),
    );
  }
}

class ChartIndicator extends StatefulWidget {
  String? pair;
  ChartIndicator({Key? key, this.pair = 'ETHBTC'}) : super(key: key);
  @override
  _ChartIndicatorState createState() => _ChartIndicatorState();
}

class _ChartIndicatorState extends State<ChartIndicator> {
  List<Candle> candles = [];
  bool themeIsDark = false;

  @override
  void initState() {
    fetchCandles().then((value) {
      setState(() {
        candles = value;
      });
    });
    super.initState();
  }

  Future<List<Candle>> fetchCandles() async {
    String pair = widget.pair!;
    final uri = Uri.parse(
        "https://api.binance.com/api/v3/klines?symbol=$pair&interval=1h");
    final res = await http.get(uri);
    return (jsonDecode(res.body) as List<dynamic>)
        .map((e) => Candle.fromJson(e))
        .toList()
        .reversed
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Candlesticks(
        candles: candles,
      ),
    );
  }
}
