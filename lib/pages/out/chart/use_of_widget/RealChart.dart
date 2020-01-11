import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:usatolebanese/globals/widgets/ad.dart';
import 'package:usatolebanese/pages/out/chart/use_of_widget/chart.dart';
import 'package:usatolebanese/pages/out/chart/use_of_widget/logic.dart';

class RealChart extends StatelessWidget {
  String collection;
  double aspectRatio;

  RealChart(this.collection, this.aspectRatio);

  @override
  Widget build(BuildContext context) {
    ChartLogic chartLogic = Provider.of<ChartLogic>(context, listen: false);
    return SafeArea(
        child: Scaffold(
            backgroundColor: Color(0xff0E0E0E),
//            appBar: AppBar(
//              centerTitle: true,
//              title: Text(
//              ),
//
//            ),
            body: FutureBuilder<SharedPreferences>(
              builder: (BuildContext context,
                  AsyncSnapshot<SharedPreferences> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting)
                  return Stack(
                    alignment: Alignment.topCenter,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                              child: snapshot.data.getBool('ready') == null
                                  ? Container()
                                  : Ad(AdmobBannerSize.MEDIUM_RECTANGLE)),
                          Chart(this.collection, this.aspectRatio),
                          Expanded(child: Ad(AdmobBannerSize.LARGE_BANNER)),
                        ],
                      ),
                      chartLogic.sharedPreferences.getBool('ready') == null
                          ? Container()
                          : AnimatedBuilder(
                              builder: (BuildContext context, Widget child) {
                                return Transform.translate(
                                  offset: Offset(0, 0),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 0,
                                        vertical: 25 * aspectRatio),
                                    child: Material(
                                      color: Colors.lightBlue,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 16 * aspectRatio,
                                            horizontal: 33 * aspectRatio),
                                        child: Text(
                                          chartLogic.text,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 31 * aspectRatio,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(14)),
                                    ),
                                  ),
                                );
                              },
                              animation: chartLogic.animation,
                            ),
                    ],
                  );
                else {
                  return Center(
                    child: Text('!!'),
                  );
                }
              },
            )));
  }
}
