import 'package:cryptodesign/Common/CommonColors.dart';
import 'package:cryptodesign/Common/CommonData.dart';
import 'package:cryptodesign/Common/DynamicSizes.dart';
import 'package:cryptodesign/Screens/ChartViewPage/ChartViewPage.dart';
import 'package:cryptodesign/Screens/ExchangePage/CustomWidgets/RowText.dart';
import 'package:cryptodesign/Screens/ExchangePage/OrderBook/OrderBook.dart';
import 'package:cryptodesign/Screens/ExchangePage/TradePart.dart';
import 'package:cryptodesign/Widgets/Backgrounds/BackgroundUI.dart';
import 'package:cryptodesign/Widgets/BottomModelSheet.dart';
import 'package:cryptodesign/Widgets/CustomAppBar.dart';
import 'package:cryptodesign/Widgets/CustomText.dart';
import 'package:cryptodesign/Widgets/RoundedBoxButton.dart';
import 'package:cryptodesign/Widgets/Backgrounds/ExchangeBG.dart';
import 'package:flutter/material.dart';

class ExchangePage extends StatefulWidget {
  String? pair;
  ExchangePage({Key? key, this.pair}) : super(key: key);

  @override
  State<ExchangePage> createState() => _ExchangePageState();
}

class _ExchangePageState extends State<ExchangePage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  int? changeIndex;

  @override
  void initState() {
    _tabController = new TabController(length: 3, vsync: this);
    super.initState();
  }

  Widget priceTicker() {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.white, width: 5),
            boxShadow: [
              BoxShadow(color: CommonColors().grey, blurRadius: 5),
            ],
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(0, 188, 212, 1),
                  Color.fromRGBO(0, 161, 255, 1),
                  // Color.fromRGBO(0, 121, 255, 1),
                  Color.fromRGBO(0, 161, 255, 1),
                  Color.fromRGBO(0, 188, 212, 1),
                ])),
        width: DynamicSizes().dynamicWidth(context, 0.9),
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      widget.pair!,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                    CustomText(
                      '33,465.44',
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.red,
                    ),
                    Row(
                      children: [
                        CustomText(
                          '\$23.456.00 ',
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                        CustomText(
                          '6.54%',
                          color: Colors.red,
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              '24h High',
                              color: Colors.white,
                            ),
                            CustomText(
                              '23.4456',
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            CustomText(
                              '24h Volume',
                              color: Colors.white,
                            ),
                            CustomText(
                              '23.4456',
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            )
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              '24h Low',
                              color: Colors.white,
                            ),
                            CustomText(
                              '23.4456',
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            CustomText(
                              '24h Volume',
                              color: Colors.white,
                            ),
                            CustomText(
                              '23.4456',
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                )
              ],
            )),
      ),
    );
  }

  Widget chartView() {
    return Center(
        child: Container(
            width: DynamicSizes().dynamicWidth(context, 0.9),
            height: DynamicSizes().dynamicHeight(context, 0.45),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: CommonColors().white,
                boxShadow: [
                  BoxShadow(color: CommonColors().grey, blurRadius: 5),
                ]),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: ChartIndicator(
                  pair: widget.pair,
                ))));
  }

  Widget orderBook() {
    return Center(
        child: Container(
            width: DynamicSizes().dynamicWidth(context, 0.9),
            height: DynamicSizes().dynamicHeight(context, 0.45),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: CommonColors().white,
                boxShadow: [
                  BoxShadow(color: CommonColors().grey, blurRadius: 5),
                ]),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20), child: OrderBook())));
  }

  Widget trades() {
    return Center(
        child: Container(
            width: DynamicSizes().dynamicWidth(context, 0.9),
            height: DynamicSizes().dynamicHeight(context, 0.45),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: CommonColors().white,
                boxShadow: [
                  BoxShadow(color: CommonColors().grey, blurRadius: 5),
                ]),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Center(child: CustomText('No Trades')))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CommonColors().white,
      body: ExchangeBG(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomAppBar(title: 'Exchange'),
              priceTicker(),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: SizedBox(
                      height: 30,
                      width: DynamicSizes().dynamicWidth(context, 0.6),
                      child: TabBar(
                        physics: NeverScrollableScrollPhysics(),
                        isScrollable: true,
                        controller: _tabController,
                        labelPadding: EdgeInsets.only(right: 8.0, left: 8.0),
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorColor: Colors.white,
                        indicatorWeight: 3,
                        tabs: [
                          CustomText(
                            'Chart',
                            color: CommonColors().white,
                            fontWeight: FontWeight.bold,
                          ),
                          CustomText(
                            'Order book',
                            color: CommonColors().white,
                            fontWeight: FontWeight.bold,
                          ),
                          CustomText(
                            'Trades',
                            color: CommonColors().white,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      )),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: DynamicSizes().dynamicHeight(context, 0.46),
                child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: _tabController,
                  children: [chartView(), orderBook(), trades()],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                RoundedBoxButton(
                  text: 'Buy',
                  buttonColor: Colors.green,
                  width: DynamicSizes().dynamicWidth(context, 0.45),
                  onTap: () {
                    BottomModelSheet().modalBottomSheet(
                        context,
                        TradePart(
                          tabIndex: 0,
                        ));
                  },
                ),
                RoundedBoxButton(
                  text: 'Sell',
                  buttonColor: Colors.red,
                  width: DynamicSizes().dynamicWidth(context, 0.45),
                  onTap: () {
                    BottomModelSheet().modalBottomSheet(
                        context,
                        TradePart(
                          tabIndex: 1,
                        ));
                  },
                )
              ]),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
      // bottomSheet: BottomModelSheet(child: TradePart()),
    );
  }
}
