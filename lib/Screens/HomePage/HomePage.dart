import 'package:cryptodesign/Common/CommonColors.dart';
import 'package:cryptodesign/Screens/ExchangePage/ExchangePage.dart';
import 'package:cryptodesign/Screens/MarketPage/MarketPage.dart';
import 'package:cryptodesign/Screens/OrderHistoryPage/OrderHistoryPage.dart';
import 'package:cryptodesign/Screens/WalletPage/WalletPage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  int? index;
  String? pair;
  HomePage({Key? key, this.index, this.pair = 'ETHBTC'}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;

  @override
  void initState() {
    _index = widget.index ?? 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget? child;
    switch (_index) {
      case 0:
        child = MarketPage();
        break;
      case 1:
        child = ExchangePage(
          pair: widget.pair,
        );
        break;
      case 2:
        child = OrderHistoryPage();
        break;
      case 3:
        child = WalletPage();
        break;
    }

    return Scaffold(
      body: SizedBox.expand(child: child),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (newIndex) => setState(() => _index = newIndex),
        type: BottomNavigationBarType.fixed,
        backgroundColor: CommonColors().white(context),
        selectedItemColor: CommonColors().appTheme,
        unselectedItemColor: CommonColors().grey,
        currentIndex: _index,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: "Market"),
          BottomNavigationBarItem(
              icon: Icon(Icons.currency_exchange), label: "Exchange"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "Orders"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet), label: "Wallet"),
        ],
      ),
    );
  }
}
