import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity/connectivity.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:usatolebanese/base/root.dart';
import 'package:usatolebanese/main.dart';
import 'package:usatolebanese/model/model.dart';
import 'package:usatolebanese/pages/drawer/change_currency/root.dart';
import 'package:usatolebanese/pages/drawer/currency_value/root.dart';
import 'package:usatolebanese/utility/localization/localization.dart';

class BaseLogic extends ChangeNotifier {
  int syriaLastPrice, lebanonLastPrice;
  var lastPrices = {};

  var pages = [
    ValueRoot(
      isLebanon: true,
    ),
    ValueRoot(
      isLebanon: false,
    ),
    ChangeRoot()
  ];
  List<Map> currencyTypes;
  int index = 0;
  int syrianPrice, lebanonPrice;
  Future<QuerySnapshot> lebanonQuery, syrianQuery;
  Future<DocumentSnapshot> lebanonOfficial, syrianOfficial;
  bool isLoading = true;
  Model model;

  void fetchData() {
    print('!!');
    if (!isLoading) {
      isLoading = true;
      notifyListeners();
    }
    Future.wait([
      Firestore.instance
          .collection('lebaness')
          .reference()
          .orderBy('Date', descending: true)
          .limit(2)
          .getDocuments(),
      Firestore.instance
          .collection('turkesh')
          .reference()
          .orderBy('Date', descending: true)
          .limit(2)
          .getDocuments(),
      Firestore.instance.collection('coin').document('lebanon').get(),
      Firestore.instance.collection('coin').document('turkey').get()
    ]).then((x) {
      this.model = Model(
          lebanonQuery: x[0],
          syrianQuery: x[1],
          lebanonOfficial: x[2],
          syrianOfficial: x[3]);
      currencyTypes = [
        {'value': 1.0, 'name': localization[0]},
        {'value': model.buyLebanon, 'name': localization[1]},
        {'value': model.buySyrian, 'name': localization[2]},
      ];

      isLoading = false;

      notifyListeners();
    });
  }

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

  void removeAd() {
    bannerAd.dispose();
    bannerAd = null;
  }

  BannerAd bannerAd;
  BannerAd createBannerAd(AdSize size) {
    return BannerAd(
      adUnitId: BannerAd.testAdUnitId,
      size: size,
      listener: (MobileAdEvent event) {
        print("BannerAd event $event");
      },
    );
  }

  bool isConnectedToInternet = false;
  BaseLogic(BuildContext context) {
    Connectivity().checkConnectivity().then((x) {
      if (x == ConnectivityResult.none) {
        this.isConnectedToInternet = false;
      } else {
        isConnectedToInternet = true;
      }
    });

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
}
