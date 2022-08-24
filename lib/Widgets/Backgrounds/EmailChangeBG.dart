import 'package:cryptodesign/Common/CommonColors.dart';
import 'package:cryptodesign/Common/DynamicSizes.dart';
import 'package:cryptodesign/Widgets/Clipper/WaveClipperOne.dart';
import 'package:cryptodesign/Widgets/Clipper/WaveClipperTwo.dart';
import 'package:flutter/material.dart';

class EmailChangeBG extends StatefulWidget {
  final Widget child;
  const EmailChangeBG({Key? key, required this.child}) : super(key: key);

  @override
  State<EmailChangeBG> createState() => _EmailChangeBGState();
}

class _EmailChangeBGState extends State<EmailChangeBG> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ClipPath(
                clipper: WaveClipperOne(reverse: true),
                child: Container(
                  height: DynamicSizes().dynamicHeight(context, 0.2),
                  color: CommonColors().appTheme,
                )),
          ],
        ),
        widget.child
      ],
    );
  }
}
