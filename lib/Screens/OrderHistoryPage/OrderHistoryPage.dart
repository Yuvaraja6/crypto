import 'package:cryptodesign/Common/CommonColors.dart';
import 'package:cryptodesign/Common/DynamicSizes.dart';
import 'package:cryptodesign/Screens/ExchangePage/CustomWidgets/RowText.dart';
import 'package:cryptodesign/Screens/ExchangePage/TradePart.dart';
import 'package:cryptodesign/Screens/OrderHistoryPage/OpenOrdersList.dart';
import 'package:cryptodesign/Screens/OrderHistoryPage/OrdersHistoryList.dart';
import 'package:cryptodesign/Widgets/Backgrounds/BackgroundUI.dart';
import 'package:cryptodesign/Widgets/Backgrounds/OrdersBG.dart';
import 'package:cryptodesign/Widgets/CustomAppBar.dart';
import 'package:cryptodesign/Widgets/CustomText.dart';
import 'package:flutter/material.dart';

class OrderHistoryPage extends StatefulWidget {
  const OrderHistoryPage({Key? key}) : super(key: key);

  @override
  State<OrderHistoryPage> createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  int? changeIndex;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrdersBG(
        child: Column(
          children: [
            CustomAppBar(title: 'Orders'),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: CommonColors().white,
                  borderRadius: BorderRadius.circular(10),
                  // boxShadow: [
                  //   BoxShadow(color: CommonColors().grey, blurRadius: 5),
                  // ]
                ),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: TabBar(
                    isScrollable: false,
                    physics: const NeverScrollableScrollPhysics(),
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: CommonColors().appTheme),
                    tabs: [
                      CustomText(
                        'Open Orders',
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: _tabController!.index == 0
                            ? CommonColors().white
                            : CommonColors().black,
                      ),
                      CustomText(
                        "Order History",
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: _tabController!.index == 1
                            ? CommonColors().white
                            : CommonColors().black,
                      )
                    ],
                    controller: _tabController,
                    onTap: (v) {
                      setState(() {
                        changeIndex = _tabController!.index;
                      });
                    },
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: DynamicSizes().dynamicWidth(context, 0.95),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TabBarView(
                        physics: NeverScrollableScrollPhysics(),
                        controller: _tabController,
                        children: [OpenOrdersList(), OrdersHistoryList()]),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
