import 'package:cryptodesign/Common/CommonColors.dart';
import 'package:cryptodesign/Common/DynamicSizes.dart';
import 'package:cryptodesign/Widgets/Clipper/WaveClipperTwo.dart';
import 'package:flutter/material.dart';

class ExchangeBG extends StatefulWidget {
  final Widget child;
  const ExchangeBG({Key? key, required this.child}) : super(key: key);

  @override
  State<ExchangeBG> createState() => _ExchangeBGState();
}

class _ExchangeBGState extends State<ExchangeBG> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            ClipPath(
                clipper: WaveClipperTwo(),
                child: Container(
                  height: DynamicSizes().dynamicHeight(context, 0.37),
                  color: CommonColors().appTheme,
                )),
            Expanded(
              child: Container(
                color: CommonColors().white(context),
              ),
            ),
          ],
        ),
        widget.child
      ],
    );
  }
}
