import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:usatolebanese/pages/out/chart/use_of_widget/RealChart.dart';
import 'package:usatolebanese/pages/out/chart/use_of_widget/logic.dart';

class ChartRoot extends StatefulWidget {
  String collection, title;
  double aspectRatio;
  Map<String, dynamic> data;
  int index;
  ChartRoot(
    this.collection,
    this.aspectRatio,
  );

  @override
  _ChartRootState createState() => _ChartRootState();
}

class _ChartRootState extends State<ChartRoot> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext cx) {
    return ChangeNotifierProvider(
        create: (context) {
          return ChartLogic(this, cx);
        },
        child: RealChart(
          widget.collection,
          widget.aspectRatio,
        ));
  }
}
