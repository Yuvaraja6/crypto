import 'package:flutter/material.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

class JSDemo extends StatefulWidget {
  const JSDemo({Key? key}) : super(key: key);

  @override
  State<JSDemo> createState() => _JSDemoState();
}

class _JSDemoState extends State<JSDemo> {
  WebViewPlusController? _controller;
  double _height = 400;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JS Demo'),
      ),
      body: SizedBox(
        height: _height,
        child: WebViewPlus(
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (controller) {
            controller.loadString(r"""
          <script type="text/javascript" src="https://files.coinmarketcap.com/static/widget/coinMarquee.js"></script>
          <div id="coinmarketcap-widget-marquee" coins="1,2,74,825,1027,1839,1966,3890,4687,5994" currency="USD" theme="light" transparent="false" show-symbol-logo="true"></div>
        """);
          },
        ),
      ),
    );
  }
}
