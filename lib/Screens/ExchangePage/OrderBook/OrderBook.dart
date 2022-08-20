import 'package:cryptodesign/API/remote/response/Status.dart';
import 'package:cryptodesign/Common/DynamicSizes.dart';
import 'package:cryptodesign/Screens/ExchangePage/OrderBook/ViewModel/OrderBookVM.dart';
import 'package:cryptodesign/Widgets/CustomText.dart';
import 'package:cryptodesign/Widgets/LoadingWidget.dart';
import 'package:cryptodesign/Widgets/MyErrorWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderBook extends StatefulWidget {
  const OrderBook({Key? key}) : super(key: key);

  @override
  State<OrderBook> createState() => _OrderBookState();
}

class _OrderBookState extends State<OrderBook> {
  bool buy = true;
  bool sell = true;

  Widget sellList(List openOrders) {
    return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: openOrders.length,
        itemBuilder: (BuildContext context, int index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomText(
                openOrders[index][0],
                color: Colors.red,
              ),
              CustomText(
                openOrders[index][1],
                color: Colors.red,
              )
            ],
          );
        });
  }

  Widget buyList(List openOrders) {
    return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: openOrders.length,
        itemBuilder: (BuildContext context, int index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomText(
                openOrders[index][0],
                color: Colors.green,
              ),
              CustomText(
                openOrders[index][1],
                color: Colors.green,
              )
            ],
          );
        });
  }

  final OrderBookVM viewModel = OrderBookVM();

  @override
  void initState() {
    viewModel.fetchMarkets();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<OrderBookVM>(
      create: (BuildContext context) => viewModel,
      child: Row(
        children: [
          Container(
            width: DynamicSizes().dynamicWidth(context, 0.75),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomText(
                      'Price (BTC)',
                      fontWeight: FontWeight.bold,
                    ),
                    CustomText(
                      'Amount (ETH)',
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Visibility(
                  visible: sell,
                  child: SizedBox(
                    height: buy == true
                        ? DynamicSizes().dynamicHeight(context, 0.15)
                        : DynamicSizes().dynamicHeight(context, 0.3),
                    child:
                        Consumer<OrderBookVM>(builder: (context, viewModel, _) {
                      switch (viewModel.orderBook.status) {
                        case Status.LOADING:
                          print("Market :: LOADING");
                          return const LoadingWidget();
                        case Status.ERROR:
                          print("Market :: ERROR");
                          return MyErrorWidget(
                              viewModel.orderBook.message ?? "NA");
                        case Status.COMPLETED:
                          print("Market :: COMPLETED");
                          return sellList(
                              viewModel.orderBook.data!.asks!.toList());
                        default:
                      }
                      return Container();
                    }),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    CustomText(
                      '0.00123433 BTC',
                      color: Colors.red,
                    ),
                    CustomText(
                      '\$33.44',
                      color: Colors.grey,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Visibility(
                  visible: buy,
                  child: SizedBox(
                    height: sell == true
                        ? DynamicSizes().dynamicHeight(context, 0.15)
                        : DynamicSizes().dynamicHeight(context, 0.3),
                    child:
                        Consumer<OrderBookVM>(builder: (context, viewModel, _) {
                      switch (viewModel.orderBook.status) {
                        case Status.LOADING:
                          print("Market :: LOADING");
                          return const LoadingWidget();
                        case Status.ERROR:
                          print("Market :: ERROR");
                          return MyErrorWidget(
                              viewModel.orderBook.message ?? "NA");
                        case Status.COMPLETED:
                          print("Market :: COMPLETED");
                          return buyList(
                              viewModel.orderBook.data!.bids!.toList());
                        default:
                      }
                      return Container();
                    }),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: DynamicSizes().dynamicWidth(context, 0.1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      buy = true;
                      sell = true;
                    });
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(color: Colors.grey, blurRadius: 3),
                          ],
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white),
                      child: Image.asset(
                        'assets/images/icons/arrows.png',
                        height: 35,
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      buy = false;
                      sell = true;
                    });
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(color: Colors.grey, blurRadius: 3),
                          ],
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white),
                      child: Image.asset(
                        'assets/images/icons/arrows.png',
                        height: 35,
                        color: Colors.red,
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      buy = true;
                      sell = false;
                    });
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(color: Colors.grey, blurRadius: 3),
                          ],
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white),
                      child: Image.asset(
                        'assets/images/icons/arrows.png',
                        height: 35,
                        color: Colors.green,
                      )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
