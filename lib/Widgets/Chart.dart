import 'package:cryptodesign/Common/CommonColors.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class Chart extends StatefulWidget {
  Color? color;
  Chart({Key? key, this.color}) : super(key: key);

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            height: 30,
            width: 100,
            child: SfSparkLineChart(
              axisLineColor: Colors.transparent,
              color: widget.color ?? CommonColors().appTheme,
              data: <double>[
                1,
                5,
                -6,
                0,
                1,
                -2,
                7,
                -7,
                -4,
                -10,
                13,
                -6,
                7,
                5,
                11,
                5,
                3
              ],
            )));
  }
}
