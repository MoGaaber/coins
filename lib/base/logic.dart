import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:usatolebanese/pages/drawer/change_currency/change.dart';
import 'package:usatolebanese/pages/drawer/currency_value/value.dart';
import 'package:usatolebanese/utility/localization/localization.dart';

class BaseLogic extends ChangeNotifier {
  InterstitialAd fullScreenAd;

  InterstitialAd createFullScreenAd() {
    return InterstitialAd(
      adUnitId: InterstitialAd.testAdUnitId,
    );
  }

  showAd() {
    fullScreenAd = createFullScreenAd()
      ..load()
      ..show();
  }

  int index = 0;

  var pages = [
    CurrencyValue(
      isLebanon: true,
    ),
    CurrencyValue(
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
    localization = Localization.of(context).currencyTypes;

    FirebaseAdMob.instance
        .initialize(appId: 'ca-app-pub-3118554882781656~3307182209')
        .then((x) {
      showAd();
    });
  }

  var icons = [
    FontAwesomeIcons.coins,
    FontAwesomeIcons.coins,
    FontAwesomeIcons.exchangeAlt,
    FontAwesomeIcons.share,
    FontAwesomeIcons.star,
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
