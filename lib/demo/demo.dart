import 'package:flutter/material.dart';

class Demo extends StatefulWidget {
  const Demo({Key? key}) : super(key: key);

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  bool a = true;
  bool b = true;
  bool c = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Visibility(
            visible: a,
            child: Container(
              height: 100,
              width: 100,
              color: Colors.red,
            ),
          ),
          Visibility(
            visible: b,
            child: Container(
              height: 100,
              width: 100,
              color: Colors.yellow,
            ),
          ),
          Visibility(
            visible: c,
            child: Container(
              height: 100,
              width: 100,
              color: Colors.green,
            ),
          ),
          IconButton(
              onPressed: () {
                setState(() {
                  a = true;
                  b = false;
                  c = true;
                });
              },
              icon: Icon(Icons.account_balance_wallet)),
          IconButton(
              onPressed: () {
                setState(() {
                  a = false;
                  b = true;
                  c = true;
                });
              },
              icon: Icon(Icons.account_balance_wallet))
        ],
      ),
    );
  }
}
