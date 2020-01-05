import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:usatolebanese/base/logic.dart';
import 'package:usatolebanese/globals/widgets/ad.dart';
import 'package:usatolebanese/pages/out/chart/chart.dart';

class ChartRoot extends StatelessWidget {
  String collection, title;
  double aspectRatio;

  ChartRoot(this.collection, this.title, this.aspectRatio);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Color(0xff1B191A),
//            appBar: AppBar(
//              centerTitle: true,
//              title: Text(
//                this.title,
//              ),
//            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(child: Ad(AdmobBannerSize.LARGE_BANNER)),
                Container(
                    color: Colors.transparent,
                    child: Chart(this.collection, this.aspectRatio)),
                Expanded(child: Ad(AdmobBannerSize.LARGE_BANNER)),
              ],
            )));
  }
}
