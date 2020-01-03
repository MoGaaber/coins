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
  Stream<DocumentSnapshot> stream1, stream2;

  ChangeLogic(BuildContext context, [this.stream1, this.stream2]) {
    localization = Localization.of(context).currencyTypes;
    fromT = localization[0];
    toT = localization[0];
    KeyboardVisibilityNotification().addNewListener(onChange: (x) {
      adVisibility = x;
      print(adVisibility);
      notifyListeners();
    });

    currencyTypes = [
      {'value': 1.0, 'name': localization[0]},
      {'value': lebanonPrice, 'name': localization[1]},
      {'value': syrianPrice, 'name': localization[2]},
    ];
  }
  var localization;

  var controller = TextEditingController();
  var priceToday = '';
  List<Map> currencyTypes;

  int selectedIndex1 = 0;
  int selectedIndex2 = 0;
  double from = 1.0;
  double to = 1.0;
  String fromT = '', toT = '';
  var result = 0.0;

  void b() {
    fromT = 'hello';
    notifyListeners();
  }
}
