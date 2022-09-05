import 'package:cryptodesign/Common/CommonColors.dart';
import 'package:cryptodesign/Common/DynamicSizes.dart';
import 'package:flutter/material.dart';

class BackgroundUI extends StatefulWidget {
  final Widget child;
  const BackgroundUI({Key? key, required this.child}) : super(key: key);

  @override
  State<BackgroundUI> createState() => _BackgroundUIState();
}

class _BackgroundUIState extends State<BackgroundUI> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Container(
                color: CommonColors().white(context),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(370.0),
                    // bottomRight: Radius.circular(15.0)
                  ),
                  child: Container(
                    height: DynamicSizes().dynamicHeight(context, 0.6),
                    // color: CommonColors().appTheme,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          CommonColors().appTheme,
                          CommonColors().appTheme.withOpacity(0.9),
                          CommonColors().appTheme.withOpacity(0.7),
                          CommonColors().appTheme.withOpacity(0.5),
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: CommonColors().white(context),
                            blurRadius: 3),
                        BoxShadow(
                            color: CommonColors().white(context),
                            blurRadius: 3),
                      ],
                    ),
                    // gradient: LinearGradient(
                    //   begin: Alignment.topRight,
                    //   end: Alignment.bottomLeft,
                    //   colors: [
                    //     Colors.grey.shade300,
                    //     CommonColors().white(context),
                    //     Colors.grey.shade300,
                    //     CommonColors().white(context),
                    //   ],
                    // ),
                  ),
                ),
              ),
            ],
          ),
        ),
        widget.child
      ],
    );
  }
}
