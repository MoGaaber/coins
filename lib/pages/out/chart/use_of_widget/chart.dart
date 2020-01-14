import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:usatolebanese/pages/out/chart/widget/customChart.dart';
import 'package:usatolebanese/pages/out/chart/use_of_widget/logic.dart';
import 'package:usatolebanese/pages/out/chart/widget/x.dart';
import 'package:usatolebanese/utility/localization/localization.dart';

class Chart extends StatelessWidget {
  Offset x = Offset(0, 0);
  String collection;
  double aspectRatio;
  Chart(this.collection, this.aspectRatio);

  @override
  Widget build(BuildContext context) {
    var localization = Localization.of(context).instruction;
    var logic = Provider.of<ChartLogic>(context, listen: false);

    return SizedBox.fromSize(
        size: Size.fromHeight(566 * 0.60),
        child: Container(
          height: MediaQuery.of(context).size.height / 2,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: EdgeInsets.only(bottom: 33 * aspectRatio),
            child: BezierChart(
              onIndicatorVisible: (indicatorVisibility) {
                if (logic.text != localization.last) {
                  logic.tickerFuture.timeout(Duration(milliseconds: 0),
                      onTimeout: () {
                    logic.tween.begin = Offset(0, 0);
                    logic.tween.end = Offset(0, -85);

                    logic.controller.forward().then((xy) {
                      if (indicatorVisibility) {
                        logic.text = localization[3];
                      } else {
                        logic.text = localization[1];
                      }

                      logic.controller.reverse().then((x) {
                        logic.tween.begin = Offset(0, 0);
                        logic.tween.end = Offset(0, 20);
                        logic.tickerFuture =
                            logic.controller.repeat(reverse: true);
                      });
                    });
                  });
                } else {
                  logic.success();
                }
              },
              fromDate: logic.documents[logic.documents.length - 1].data['date']
                  .toDate(),
              bezierChartScale: BezierChartScale.WEEKLY,
              toDate: logic.documents[0].data['date'].toDate(),
              series: [
                BezierLine(
                  lineColor: Colors.red,
                  label: "Buy price",
                  data: logic.documents.map((x) {
                    return DataPoint<DateTime>(
                        value: x['sell'].toDouble(), xAxis: x['date'].toDate());
                  }).toList(),
                ),
                BezierLine(
                    label: "Sell price",
                    data: logic.documents.map((x) {
                      return DataPoint<DateTime>(
                          value: x['buy'].toDouble(),
                          xAxis: x['date'].toDate());
                    }).toList(),
                    lineColor: Color(0xffA2A2A2)),
              ],
              config: BezierChartConfig(
                displayDataPointWhenNoValue: false,
                showVerticalIndicator: true,
                verticalIndicatorColor: Colors.white,
                verticalIndicatorFixedPosition: false,
                showDataPoints: true,
                physics: BouncingScrollPhysics(),
                pinchZoom: false,
              ),
            ),
          ),
        ));
  }
}
