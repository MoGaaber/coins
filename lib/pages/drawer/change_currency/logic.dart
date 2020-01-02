import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:usatolebanese/base/logic.dart';
import 'package:usatolebanese/utility/localization/localization.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

//import '';
class ChangeLogic extends ChangeNotifier {
  double convert(double input, double from, double to) {
    if (input <= 0) {
      return 0.0;
    } else {
      return (input / from) * to;
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

  ChangeLogic(BuildContext context) {
    focus.addListener(() {
      print(focus.hasFocus);
    });
    localization = Localization.of(context).currencyTypes;
    fromT = localization[0];
    toT = localization[0];
    KeyboardVisibilityNotification().addNewListener(onChange: (x) {
      adVisibility = x;
      print(adVisibility);
      notifyListeners();
    });
  }
  var localization;

  var controller = TextEditingController();
  var priceToday = '';
  List<Map> currencyTypes;

  int selectedIndex1 = 0;
  int selectedIndex2 = 0;
  double from = 1.0;
  double to = 1.0;
  String fromT, toT;
  var result = 0.0;
}
