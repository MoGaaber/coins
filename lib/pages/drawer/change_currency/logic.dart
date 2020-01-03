import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:usatolebanese/utility/localization/localization.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

class ChangeLogic extends ChangeNotifier {
  double convert(double input, double from, double to) {
    if (input <= 0) {
      return 0.0;
    } else {
      return (input * from) / to;
    }
  }

  bool adVisibility = true;
  double syrianPrice, lebanonPrice;
  bool isLoading = true;

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

  var result = 0.0;
}
