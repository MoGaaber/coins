import 'package:admob_flutter/admob_flutter.dart';
import 'package:bezier_chart/bezier_chart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:usatolebanese/globals/widgets/ad.dart';
import 'package:usatolebanese/pages/out/chart/chart.dart';

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
                Expanded(child: Chart(this.collection)),
                Expanded(child: Ad(AdmobBannerSize.MEDIUM_RECTANGLE))
              ],
            )));
  }
}
