import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class HTMLDemo extends StatefulWidget {
  const HTMLDemo({Key? key}) : super(key: key);

  @override
  State<HTMLDemo> createState() => _HTMLDemoState();
}

class _HTMLDemoState extends State<HTMLDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 300,
        width: 300,
        child: HtmlWidget('''
              <script type="text/javascript" src="https://files.coinmarketcap.com/static/widget/coinMarquee.js"></script>
            <div id="coinmarketcap-widget-marquee" coins="1,2,74,825,1027,1839,1966,3890,4687,5994" currency="USD" theme="light" transparent="false" show-symbol-logo="true"></div>
              '''),
      ),
    );
  }
}
