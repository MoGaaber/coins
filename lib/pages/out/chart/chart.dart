import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:usatolebanese/base/logic.dart';
import 'package:usatolebanese/pages/drawer/change_currency/logic.dart';
import 'package:usatolebanese/pages/out/chart/customChart.dart';
import 'package:usatolebanese/pages/out/chart/x.dart';

class Chart extends StatelessWidget {
  String collection;
  Chart(this.collection);
  @override
  Widget build(BuildContext context) {
    var baseLogic = Provider.of<BaseLogic>(context, listen: false);

    return FutureBuilder(
      future: Firestore.instance
          .collection('Syria Statics ')
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
              padding: const EdgeInsets.only(bottom: 20),
              child: BezierChart(
                fromDate: documents[documents.length - 1].data['date'].toDate(),
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
                  physics: BouncingScrollPhysics(),
                  pinchZoom: false,
                  footerHeight: 25 * baseLogic.aspectRatio,
                ),
              ),
            ),
          );
        } else {
          return Text('!!');
        }
      },
    );
  }
}
