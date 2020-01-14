import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:usatolebanese/utility/localization/localization.dart';

class ChartLogic extends ChangeNotifier {
  Animation<Offset> animation;
  AnimationController controller;
  List<String> localization;
  ScrollController scrollController = ScrollController();
  List<DocumentSnapshot> documents;
  Duration duration = Duration(milliseconds: 1000);
  Tween<Offset> tween = Tween(begin: Offset(0, 0), end: Offset(0, 20));
  bool ready = false;
  bool displayIndicator = false;
  void inProgress(String text, bool hideIndicator) {
    if (hideIndicator) displayIndicator = false;
    tween.begin = Offset(0, 0);
    tween.end = Offset(0, -85);
    tickerFuture.timeout(Duration(milliseconds: 0), onTimeout: () {
      controller.forward().then((x) {
        this.text = text;

        controller.reverse().then((x) {
          tween.begin = Offset(0, 0);
          tween.end = Offset(0, 20);
          tickerFuture = controller.repeat(reverse: true);
        });
      });
    });
  }

  void scrollListening() {
    if (sharedPreferences.getBool('ready') != null)
      scrollController.addListener(() {
        if (text == localization.last) {
          success();
          scrollController.dispose();
        } else if (text != localization[2]) {
          inProgress(localization[2], false);
        }
      });
  }

  void onLongPressMove(LongPressMoveUpdateDetails details) {
    if (text != localization.last) {
      if (details.localOffsetFromOrigin.dx.abs() > 100) {
        inProgress(localization.last, false);
      }
    } else {
      success();
    }
  }

  void onLongPressUp() {
    if (text != localization.last) {
      if (text == localization[3]) {
        inProgress(localization[1], true);
      }
    } else {
      success();
    }
  }

  void success() {
    tween.begin = Offset(0, 0);
    tween.end = Offset(0, -85);
    controller.forward().then((x) {
      sharedPreferences.setBool('ready', true);
    });
  }

  SharedPreferences sharedPreferences;
  ChartLogic(TickerProvider provider, BuildContext context) {
    localization = Localization.of(context).instruction;
    text = localization.first;
    controller = AnimationController(
      vsync: provider,
      duration: duration,
    );
    animation = tween
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));
    tickerFuture = controller.repeat(reverse: true);
  }
  TickerFuture tickerFuture;
  String text;
}
