import 'package:cryptodesign/API/remote/response/Status.dart';
import 'package:cryptodesign/Common/CommonColors.dart';
import 'package:cryptodesign/Common/DynamicSizes.dart';
import 'package:cryptodesign/Common/Navigators.dart';
import 'package:cryptodesign/Screens/ChartViewPage/ChartViewPage.dart';
import 'package:cryptodesign/Screens/Drawer/MenuDrawer.dart';
import 'package:cryptodesign/Screens/MarketPage/CarouselLayout.dart';
import 'package:cryptodesign/Screens/MarketPage/HeaderData.dart';
import 'package:cryptodesign/Screens/MarketPage/Model/Markets.dart';
import 'package:cryptodesign/Screens/MarketPage/ViewModel/MarketVM.dart';
import 'package:cryptodesign/Widgets/Backgrounds/BackgroundUI.dart';
import 'package:cryptodesign/Widgets/Chart.dart';
import 'package:cryptodesign/Widgets/CustomAppBar.dart';
import 'package:cryptodesign/Widgets/CustomText.dart';
import 'package:cryptodesign/Widgets/CustomTextField.dart';
import 'package:cryptodesign/Widgets/LoadingWidget.dart';
import 'package:cryptodesign/Widgets/MyErrorWidget.dart';
import 'package:cryptodesign/Widgets/Backgrounds/ExchangeBG.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scroll_loop_auto_scroll/scroll_loop_auto_scroll.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MarketPage extends StatefulWidget {
  const MarketPage({Key? key}) : super(key: key);

  @override
  State<MarketPage> createState() => _MarketPageState();
}

class _MarketPageState extends State<MarketPage> {
  List coinsList = [
    {
      "code": "BTC",
      "coinName": "Bitcoin",
      "total": "23345.44",
      "available": "12234.44",
      "image": "assets/images/coins/btc.png",
      "lastPrice": "12345.22",
      "percentage": 3.44
    },
    {
      "code": "ETH",
      "coinName": "Ethereum",
      "total": "31245.44",
      "available": "45334.44",
      "image": "assets/images/coins/eth.png",
      "lastPrice": "52321.22",
      "percentage": -3.44
    },
    {
      "code": "LTC",
      "coinName": "Litecoin",
      "total": "31245.44",
      "available": "12345.44",
      "image": "assets/images/coins/ltc.png",
      "lastPrice": "51234.22",
      "percentage": 53.44
    },
    {
      "code": "BNB",
      "coinName": "Binance",
      "total": "51245.44",
      "available": "43212.44",
      "image": "assets/images/coins/bnb.png",
      "lastPrice": "23421.22",
      "percentage": -33.44
    },
    {
      "code": "XRP",
      "coinName": "XRP",
      "total": "31245.44",
      "available": "42123.44",
      "image": "assets/images/coins/xrp.png",
      "lastPrice": "23421.22",
      "percentage": 33.44
    },
    {
      "code": "USD",
      "coinName": "US Dollar",
      "total": "31245.44",
      "available": "31111.44",
      "image": "assets/images/coins/usd.png",
      "lastPrice": "23421.22",
      "percentage": -33.44
    },
    {
      "code": "HUN",
      "coinName": "Hungery",
      "total": "31245.44",
      "available": "22111.44",
      "image": "assets/images/coins/eth.png",
      "lastPrice": "2343.22",
      "percentage": 13.44
    },
    {
      "code": "INR",
      "coinName": "Indian Rupees",
      "total": "31245.44",
      "available": "12312.44",
      "image": "assets/images/coins/usd.png",
      "lastPrice": "34321.22",
      "percentage": -5.44
    },
  ];

  final MarketVM viewModel = MarketVM();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    viewModel.fetchMarkets();
    _markets = viewModel.markets.data?.marketData!;
    super.initState();
  }

  symbols() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('symbol', 'ETHBTC');
  }

  List<MarketData> _searchResult = [];
  List<MarketData>? _markets = [];

  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    for (var userDetail in _markets!) {
      if (userDetail.symbol!.contains(text.toUpperCase())) {
        _searchResult.add(userDetail);
      }
    }
    setState(() {});
  }

  Widget marketListDemo() {
    return Column(
      children: [
        CustomAppBar(
          title: 'Market',
          titleColor: CommonColors().white,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomTextFormField(
            prefixIcon: Icon(Icons.search),
            hintText: 'Search',
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: CommonColors().white,
                  boxShadow: [
                    BoxShadow(color: CommonColors().grey, blurRadius: 5),
                  ]),
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: coinsList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            NavigatorsCommon().newPageRoute(
                                context, ChartViewPage(),
                                startFractionalOffset: FractionalOffset.center);
                          },
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                            child: Image.asset(
                                              coinsList[index]['image'],
                                              width: 30,
                                              height: 30,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CustomText(
                                                coinsList[index]['coinName'],
                                                color: CommonColors().black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              CustomText(
                                                coinsList[index]['code'],
                                                color: CommonColors().grey,
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          CustomText(
                                            coinsList[index]['available'],
                                            color: CommonColors().black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          CustomText(
                                            coinsList[index]['percentage']
                                                    .toString() +
                                                ' %',
                                            color: coinsList[index]
                                                        ['percentage'] <
                                                    0
                                                ? Colors.red
                                                : Colors.green,
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Chart(
                                        color:
                                            coinsList[index]['percentage'] < 0
                                                ? Colors.red
                                                : Colors.green),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ));
                  }),
            ),
          ),
        ),
      ],
    );
  }

  Widget marketAPIList(List<MarketData>? marketList) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 500,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: CommonColors().white,
            boxShadow: [
              BoxShadow(color: CommonColors().grey, blurRadius: 5),
            ]),
        child: marketList!.isEmpty
            ? CustomText('No data found')
            : ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: marketList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        NavigatorsCommon().newPageRoute(
                            context,
                            ChartViewPage(
                              pair: marketList[index].symbol,
                            ),
                            startFractionalOffset: FractionalOffset.center);
                      },
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomText(
                                            marketList[index].symbol!,
                                            color: CommonColors().black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          CustomText(
                                            marketList[index].volume!,
                                            color: CommonColors().grey,
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      CustomText(
                                        marketList[index].lastPrice!,
                                        color: CommonColors().black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      CustomText(
                                        '${marketList[index].priceChangePercent!}%',
                                        color: double.parse(marketList[index]
                                                    .priceChangePercent!) <
                                                0
                                            ? Colors.red
                                            : Colors.green,
                                      )
                                    ],
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Chart(
                                    color: double.parse(marketList[index]
                                                .priceChangePercent!) <
                                            0
                                        ? Colors.red
                                        : Colors.green),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CommonColors().white,
      key: _scaffoldKey,
      drawerEnableOpenDragGesture: false,
      drawer: MenuDrawer(),
      body: BackgroundUI(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.centerLeft,
                children: [
                  SafeArea(
                    child: GestureDetector(
                        onTap: () {
                          _scaffoldKey.currentState!.openDrawer();
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.person,
                              color: CommonColors().appTheme,
                            ),
                          ),
                        )),
                  ),
                  CustomAppBar(
                    title: 'Market',
                    titleColor: CommonColors().white,
                  ),
                ],
              ),
              SizedBox(
                width: DynamicSizes().dynamicWidth(context, 1),
                child: const ScrollLoopAutoScroll(
                    child: HeaderData(), //required
                    scrollDirection: Axis.horizontal, //required
                    delay: Duration(seconds: 1),
                    duration: Duration(seconds: 1000),
                    gap: 0,
                    reverseScroll: false,
                    duplicateChild: 50,
                    enableScrollInput: true,
                    delayAfterScrollInput: Duration(seconds: 1)),
              ),
              CarouselLayout(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextFormField(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search',
                  onChanged: onSearchTextChanged,
                ),
              ),
              ChangeNotifierProvider<MarketVM>(
                create: (BuildContext context) => viewModel,
                child: Consumer<MarketVM>(builder: (context, viewModel, _) {
                  switch (viewModel.markets.status) {
                    case Status.LOADING:
                      print("Market :: LOADING");
                      return const LoadingWidget();
                    case Status.ERROR:
                      print("Market :: ERROR");
                      return MyErrorWidget(viewModel.markets.message ?? "NA");
                    case Status.COMPLETED:
                      print("Market :: COMPLETED");
                      return marketAPIList(_searchResult.isNotEmpty
                          ? _searchResult
                          : _searchResult.isEmpty &&
                                  searchController.text.isNotEmpty
                              ? []
                              : viewModel.markets.data?.marketData);
                    default:
                  }
                  return Container();
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
