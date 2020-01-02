import 'package:admob_flutter/admob_flutter.dart';
import 'package:bezier_chart/bezier_chart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:usatolebanese/globals/widgets/ad.dart';

class ChartRoot extends StatelessWidget {
  String collection, title;

  ChartRoot(this.collection, this.title);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff1B191A),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            this.title,
          ),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: FutureBuilder<QuerySnapshot>(
                  future: Firestore.instance
                      .collection('lebaness')
                      .reference()
                      .orderBy('Date', descending: true)
                      .limit(30)
                      .getDocuments(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.connectionState == ConnectionState.done)
                      return BezierChart(
                        bezierChartScale: BezierChartScale.WEEKLY,
                        fromDate: snapshot
                            .data
                            .documents[snapshot.data.documents.length - 1]
                                ['Date']
                            .toDate(),
                        toDate: snapshot.data.documents[0]['Date'].toDate(),
                        selectedDate: DateTime.now(),
                        series: [
                          BezierLine(
                              label: "Buy",
                              onMissingValue: (dateTime) {
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
            ),
            Expanded(child: Ad(AdmobBannerSize.MEDIUM_RECTANGLE))
          ],
        ),
      ),
    );
  }
}
