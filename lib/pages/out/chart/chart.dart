import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:usatolebanese/base/logic.dart';
import 'package:usatolebanese/pages/out/chart/customChart.dart';
import 'package:usatolebanese/pages/out/chart/x.dart';

class Chart extends StatelessWidget {
  String collection;
  double aspectRatio;
  Chart(this.collection, this.aspectRatio);
  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: Size.fromHeight(340),
      child: FutureBuilder(
        future: Firestore.instance
            .collection('Syria Statics ')
            .limit(7)
            .orderBy('date', descending: true)
            .getDocuments(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.done ||
              snapshot.connectionState == ConnectionState.waiting) {
            var documents = snapshot.data.documents;
            return Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: BezierChart(
                  onIndicatorVisible: (x) {
                    print(x);
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
