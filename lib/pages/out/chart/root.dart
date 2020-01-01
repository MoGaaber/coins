import 'package:bezier_chart/bezier_chart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChartRoot extends StatelessWidget {
  String collection;
  ChartRoot(this.collection);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff1B191A),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Previous days',
          ),
        ),
        body: FutureBuilder<QuerySnapshot>(
          future: Firestore.instance
              .collection('lebaness')
              .reference()
              .orderBy('Date', descending: true)
              .limit(30)
              .getDocuments(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.done)
              return BezierChart(
                bezierChartScale: BezierChartScale.WEEKLY,
                fromDate: snapshot
                    .data.documents[snapshot.data.documents.length - 1]['Date']
                    .toDate(),
                toDate: snapshot.data.documents[0]['Date'].toDate(),
                selectedDate: DateTime.now(),
                series: [
                  BezierLine(
                      label: "Buy",
                      onMissingValue: (dateTime) {
                        if (dateTime.month.isEven) {
                          return 10.0;
                        }
                        return 0;
                      },
                      data: snapshot.data.documents.map((element) {
                        return DataPoint<DateTime>(
                            xAxis: element['Date'].toDate(),
                            value: element['buy'].toDouble());
                      }).toList()),
                  BezierLine(
                      lineColor: Colors.orange,
                      label: "Sell",
                      onMissingValue: (dateTime) {
                        if (dateTime.month.isEven) {
                          return 10.0;
                        }
                        return 0;
                      },
                      data: snapshot.data.documents.map((element) {
                        return DataPoint<DateTime>(
                            xAxis: element['Date'].toDate(),
                            value: element['Sale'].toDouble());
                      }).toList()),
                ],
                config: BezierChartConfig(
                  verticalIndicatorStrokeWidth: 3.0,
                  verticalIndicatorColor: Colors.black26,
                  showVerticalIndicator: true,
                  verticalIndicatorFixedPosition: false,
                  backgroundColor: Color(0xff1B191A),
                  footerHeight: 30.0,
                ),
              );
            else
              return Center(child: Text('!'));
          },
        ),
      ),
    );
  }
}
