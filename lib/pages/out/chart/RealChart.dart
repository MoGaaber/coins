import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:usatolebanese/globals/widgets/ad.dart';
import 'package:usatolebanese/pages/out/chart/chart.dart';
import 'package:usatolebanese/pages/out/chart/logic.dart';

class RealChart extends StatelessWidget {
  String collection;
  double aspectRatio;
  RealChart(this.collection, this.aspectRatio);

  @override
  Widget build(BuildContext context) {
    ChartLogic chartLogic = Provider.of<ChartLogic>(context, listen: false);

    return SafeArea(
        child: Scaffold(
            backgroundColor: Color(0xff1B191A),
//            appBar: AppBar(
//              centerTitle: true,
//              title: Text(
//                this.title,
//              ),

//            ),
            body: Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                        child: !chartLogic.ready
                            ? Container()
                            : Ad(AdmobBannerSize.MEDIUM_RECTANGLE)),
                    Chart(this.collection, this.aspectRatio),
                    Expanded(child: Ad(AdmobBannerSize.LARGE_BANNER)),
                  ],
                ),
                AnimatedBuilder(
                  builder: (BuildContext context, Widget child) {
                    return Transform.translate(
                      offset: chartLogic.animation.value,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Material(
                          color: Color(0xff494949),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            child: Text(
                              chartLogic.text,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.5,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(14)),
                        ),
                      ),
                    );
                  },
                  animation: chartLogic.animation,
                ),
              ],
            )));
  }
}
