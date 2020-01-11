import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChartLogic extends ChangeNotifier {
  Animation<Offset> animation;
  AnimationController controller;
  Duration duration = Duration(milliseconds: 1000);
  Tween<Offset> tween = Tween(begin: Offset(0, 0), end: Offset(0, 20));
  bool ready = false;
  SharedPreferences sharedPreferences;
  void initPreference() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  ChartLogic(TickerProvider provider) {
//    SharedPreferences.getInstance().then((x) {
//      if (x.getBool('learn') == null) {
//      } else {
//        x.setBool('learn', false);
//      }
//    });
//
    controller = AnimationController(
      vsync: provider,
      duration: duration,
    );
    animation = tween
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));
    tickerFuture = controller.repeat(reverse: true);
  }
  TickerFuture tickerFuture;
  String text = 'Long press on statics';
}
