import 'package:admob_flutter/admob_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:usatolebanese/globals/logics/constants.dart';
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
            body: FutureBuilder<List>(
              future: Future.wait([
                SharedPreferences.getInstance(),
                Firestore.instance
                    .collection(collection)
                    .limit(7)
                    .orderBy('date', descending: true)
                    .getDocuments()
              ]),
              builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  chartLogic.sharedPreferences = snapshot.data[0];
                  chartLogic.documents = snapshot.data[1].documents;
                  return Stack(
                    alignment: Alignment.topCenter,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                              child: chartLogic.sharedPreferences
                                          .getBool('ready') ==
                                      null
                                  ? Container()
                                  : Ad(AdmobBannerSize.LARGE_BANNER,
                                      Constants.firstAdCode)),
                          Chart(this.collection, this.aspectRatio),
                          Expanded(
                              child: Ad(AdmobBannerSize.LARGE_BANNER,
                                  Constants.firstAdCode)),
                        ],
                      ),
                      chartLogic.sharedPreferences.getBool('ready') != null
                          ? Container()
                          : AnimatedBuilder(
                              builder: (BuildContext context, Widget child) {
                                return Transform.translate(
                                  offset: chartLogic.animation.value,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 0,
                                        vertical: 25 * aspectRatio),
                                    child: Material(
                                      color: Colors.red,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 16 * aspectRatio,
                                            horizontal: 33 * aspectRatio),
                                        child: Text(
                                          chartLogic.text,
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption,
                                        ),
                                      ),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                    ),
                                  ),
                                );
                              },
                              animation: chartLogic.animation,
                            ),
                    ],
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            )));
  }
}
