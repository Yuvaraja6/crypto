import 'package:cryptodesign/Common/CommonColors.dart';
import 'package:cryptodesign/Common/DynamicSizes.dart';
import 'package:cryptodesign/Widgets/Backgrounds/EmailChangeBG.dart';
import 'package:cryptodesign/Widgets/CustomText.dart';
import 'package:cryptodesign/Widgets/RoundedBoxButton.dart';
import 'package:flutter/material.dart';

class BrowserSessions extends StatefulWidget {
  const BrowserSessions({Key? key}) : super(key: key);

  @override
  State<BrowserSessions> createState() => _BrowserSessionsState();
}

class _BrowserSessionsState extends State<BrowserSessions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          'Browser Session',
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        toolbarHeight: 70,
        elevation: 14,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(60),
          bottomLeft: Radius.circular(60),
        )),
      ),
      body: EmailChangeBG(
          child: Column(
        children: [
          SizedBox(
            height: 200,
            child: ListView.builder(
                itemCount: 2,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: SizedBox(
                      height: 100,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.computer,
                            size: 50,
                            color: CommonColors().appTheme,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText('Windows'),
                              CustomText('22-08-2022 12:00:00 PM')
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
          RoundedBoxButton(
              width: DynamicSizes().dynamicWidth(context, 0.85),
              text: 'Logout All Sessions')
        ],
      )),
    );
  }
}
