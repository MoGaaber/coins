import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChartLogic extends ChangeNotifier {
  Animation<Offset> animation;
  AnimationController controller;
  bool ready = false;

  ChartLogic(TickerProvider provider) {
    SharedPreferences.getInstance().then((x) {});
    controller = AnimationController(
      vsync: provider,
      duration: Duration(milliseconds: 200),
    );
    animation = Tween<Offset>(begin: Offset(0, 20), end: Offset(0, -100))
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));
  }
  String text = 'Long press on statics';
}
