import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:usatolebanese/base/logic.dart';
import 'package:usatolebanese/globals/widgets/ad.dart';
import 'package:usatolebanese/pages/out/chart/RealChart.dart';
import 'package:usatolebanese/pages/out/chart/chart.dart';
import 'package:usatolebanese/pages/out/chart/logic.dart';

class ChartRoot extends StatefulWidget {
  String collection, title;
  double aspectRatio;

  ChartRoot(this.collection, this.title, this.aspectRatio);

  @override
  _ChartRootState createState() => _ChartRootState();
}

class _ChartRootState extends State<ChartRoot> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) {
          return ChartLogic(this);
        },
        child: RealChart(widget.collection, widget.aspectRatio));
  }
}
