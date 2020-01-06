import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:usatolebanese/base/logic.dart';
import 'package:usatolebanese/globals/widgets/ad.dart';
import 'package:usatolebanese/pages/out/chart/chart.dart';
import 'package:usatolebanese/pages/out/chart/logic.dart';

class ChartRoot extends StatelessWidget {
  String collection, title;
  double aspectRatio;

  ChartRoot(this.collection, this.title, this.aspectRatio);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return ChartLogic();
      },
      child: SafeArea(
          child: Scaffold(
              backgroundColor: Color(0xff1B191A),
//            appBar: AppBar(
//              centerTitle: true,
//              title: Text(
//                this.title,
//              ),
//            ),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  //Expanded(child: Ad(AdmobBannerSize.LARGE_BANNER)),
                  Consumer<ChartLogic>(
                    builder:
                        (BuildContext context, ChartLogic value, Widget child) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          value.text,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                      );
                    },
                  ),
                  Chart(this.collection, this.aspectRatio),
                  Expanded(child: Ad(AdmobBannerSize.LARGE_BANNER)),
                ],
              ))),
    );
  }
}
