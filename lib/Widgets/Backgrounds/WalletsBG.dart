import 'package:cryptodesign/Common/CommonColors.dart';
import 'package:cryptodesign/Common/DynamicSizes.dart';
import 'package:cryptodesign/Widgets/Clipper/DiagonalPathClipper.dart';
import 'package:cryptodesign/Widgets/Clipper/WaveClipperOne.dart';
import 'package:cryptodesign/Widgets/Clipper/WaveClipperTwo.dart';
import 'package:flutter/material.dart';

class WalletsBG extends StatefulWidget {
  final Widget child;
  const WalletsBG({Key? key, required this.child}) : super(key: key);

  @override
  State<WalletsBG> createState() => _WalletsBGState();
}

class _WalletsBGState extends State<WalletsBG> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            ClipPath(
                clipper: WaveClipperTwo(flip: true),
                child: Container(
                  height: DynamicSizes().dynamicHeight(context, 0.27),
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
