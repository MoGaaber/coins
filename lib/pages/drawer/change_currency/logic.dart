import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:usatolebanese/base/logic.dart';
import 'package:usatolebanese/model/lebanon.dart';
import 'package:usatolebanese/model/syria.dart';
import 'package:usatolebanese/utility/localization/localization.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:async/async.dart';

//import '';
class ChangeLogic extends ChangeNotifier {
  double convert(double input, double from, double to) {
    if (input <= 0) {
      return 0.0;
    } else {
      return (input * from) / to;
    }
  }

  bool buttonEnabled = false;
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

  void removeAd() {
    if (bannerAd != null) {
      bannerAd.dispose();
      bannerAd = null;
    }
  }

  var focus = FocusNode();

  bool adVisibility = true;
  double syrianPrice, lebanonPrice;
  bool isLoading = true;
//
  ChangeLogic(BuildContext context) {
    localization = Localization.of(context).currencyTypes;

    selectedValues = [
      {'name': localization[0], 'value': 1},
      {'name': localization[0], 'value': 1}
    ];
    KeyboardVisibilityNotification().addNewListener(onChange: (x) {
      adVisibility = x;
      print(adVisibility);
      notifyListeners();
    });
  }
  List<Map> selectedValues;
  var localization;

  var controller = TextEditingController();
  List<Map> currencyTypes;

  double from = 1.0;
  double to = 1.0;
  String fromT = '', toT = '';
  var result = 0.0;
}
