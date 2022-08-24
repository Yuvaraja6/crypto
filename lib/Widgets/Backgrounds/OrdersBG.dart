import 'package:cryptodesign/Common/CommonColors.dart';
import 'package:cryptodesign/Common/DynamicSizes.dart';
import 'package:cryptodesign/Widgets/Clipper/WaveClipperOne.dart';
import 'package:cryptodesign/Widgets/Clipper/WaveClipperTwo.dart';
import 'package:flutter/material.dart';

class OrdersBG extends StatefulWidget {
  final Widget child;
  const OrdersBG({Key? key, required this.child}) : super(key: key);

  @override
  State<OrdersBG> createState() => _OrdersBGState();
}

class _OrdersBGState extends State<OrdersBG> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            ClipPath(
                clipper: WaveClipperOne(),
                child: Container(
                  height: DynamicSizes().dynamicHeight(context, 0.3),
                  color: CommonColors().appTheme,
                )),
            Expanded(
              child: Container(
                color: CommonColors().white,
              ),
            ),
          ],
        ),
        widget.child
      ],
    );
  }
}
