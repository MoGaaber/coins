import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:usatolebanese/base/logic.dart';
import 'package:usatolebanese/pages/out/chart/widget/customChart.dart';
import 'package:usatolebanese/pages/out/chart/use_of_widget/logic.dart';
import 'package:usatolebanese/pages/out/chart/widget/x.dart';

class Chart extends StatelessWidget {
  Offset x = Offset(0, 0);
  String collection;
  double aspectRatio;
  Chart(this.collection, this.aspectRatio);

  @override
  Widget build(BuildContext context) {
    var logic = Provider.of<ChartLogic>(context, listen: false);

    return SizedBox.fromSize(
      size: Size.fromHeight(566 * 0.60),
      child: FutureBuilder(
        future: Firestore.instance
            .collection(collection)
            .limit(7)
            .orderBy('date', descending: true)
            .getDocuments(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var documents = snapshot.data.documents;
            return Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: EdgeInsets.only(bottom: 33 * aspectRatio),
                child: BezierChart(
                  onValueSelected: (x) {},
                  onIndicatorVisible: (x) {
                    if (logic.text != 'success , now you are ready') {
                      logic.tickerFuture.timeout(Duration(milliseconds: 0),
                          onTimeout: () {
                        logic.duration = Duration(milliseconds: 600);
                        logic.tween.begin = Offset(0, 0);
                        logic.tween.end = Offset(0, -66);

                        logic.controller.forward().then((xy) {
                          if (x) {
                            logic.text = 'drag';
                          } else {
                            logic.text = 'long pressss again';
                          }

                          logic.controller.reverse().then((x) {
                            logic.duration = Duration(milliseconds: 600);
                            logic.tween.begin = Offset(0, 0);
                            logic.tween.end = Offset(0, 20);
                            logic.tickerFuture =
                                logic.controller.repeat(reverse: true);
                          });
                        });
                      });
                    } else {
                      logic.duration = Duration(milliseconds: 600);
                      logic.tween.begin = Offset(0, 0);
                      logic.tween.end = Offset(0, -66);

                      logic.controller.forward().then((x) {
                        logic.ready = true;
                      });
                    }
                  },
                  fromDate:
                      documents[documents.length - 1].data['date'].toDate(),
                  bezierChartScale: BezierChartScale.WEEKLY,
                  toDate: documents[0].data['date'].toDate(),
                  series: [
                    BezierLine(
                      lineColor: Colors.red,
                      label: "Buy price",
                      data: documents.map((x) {
                        return DataPoint<DateTime>(
                            value: x['sell'].toDouble(),
                            xAxis: x['date'].toDate());
                      }).toList(),
                    ),
                    BezierLine(
                        label: "Sell price",
                        data: documents.map((x) {
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
            );
          } else {
            return Text('!!');
          }
        },
      ),
    );
  }
}
