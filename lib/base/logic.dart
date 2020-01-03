import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity/connectivity.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:usatolebanese/base/root.dart';
import 'package:usatolebanese/main.dart';
import 'package:usatolebanese/pages/drawer/change_currency/change.dart';
import 'package:usatolebanese/pages/drawer/currency_value/value.dart';
import 'package:usatolebanese/utility/localization/localization.dart';

class BaseLogic extends ChangeNotifier {
  int index = 0;

  var pages = [
    Value(
      isLebanon: true,
    ),
    Value(
      isLebanon: false,
    ),
    Change()
  ];

  List<Map> currencyTypes;
  int syrianPrice, lebanonPrice;
  var lastPrices = {};
  AnimationController animationController;

  var localization;
  Widget icon(String x, DocumentSnapshot snapshot) {
    if (snapshot.data[x]['to'] > snapshot.data[x]['from']) {
      return Icon(
        Icons.keyboard_arrow_up,
        color: Colors.green,
      );
    } else {
      return Icon(
        Icons.keyboard_arrow_down,
        color: Colors.red,
      );
    }
  }

  double screenWidth, screenHeight, aspectRatio;
  Size size;
  BaseLogic(BuildContext context, TickerProvider tickerProvider) {
    size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;
    aspectRatio = size.aspectRatio;

    animationController = AnimationController(
      lowerBound: 0,
      upperBound: 1,
      vsync: tickerProvider,
      duration: Duration(milliseconds: 300),
    );

    FirebaseAdMob.instance
        .initialize(appId: 'ca-app-pub-3118554882781656~3307182209')
        .then((x) {
      print(x);
    });
    localization = Localization.of(context).currencyTypes;
  }
  var icons = [
    FontAwesomeIcons.exchangeAlt,
    FontAwesomeIcons.coins,
    FontAwesomeIcons.coins,
    FontAwesomeIcons.star,
    FontAwesomeIcons.share
  ];

  void openDrawer(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }

  void navigateToPage(BuildContext context, int i) {
    Navigator.of(
      context,
    ).pop();
    index = i;
    notifyListeners();
  }
}
