import 'package:cryptodesign/Common/DynamicSizes.dart';
import 'package:cryptodesign/Widgets/CustomText.dart';
import 'package:flutter/material.dart';

class HeaderData extends StatefulWidget {
  const HeaderData({Key? key}) : super(key: key);

  @override
  State<HeaderData> createState() => _HeaderDataState();
}

class _HeaderDataState extends State<HeaderData> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 200 * 10,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return SizedBox(
            width: 200,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/coins/btc.png',
                          height: 40,
                          width: 40,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                'Bitcoin',
                                color: Colors.white,
                              ),
                              CustomText(
                                'BTC',
                                color: Colors.white,
                              ),
                            ]),
                      ]),
                  Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CustomText(
                            '\$33.22',
                            color: Colors.white,
                          ),
                          CustomText(
                            '2.33%',
                            color: Colors.white,
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Container(
                          width: 3,
                          color: Colors.grey.shade500,
                          height: 30,
                        ),
                      )
                    ],
                  ),
                ]),
          );
        },
      ),
    );
  }
}
