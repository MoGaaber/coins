import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:usatolebanese/base/logic.dart';
import 'package:usatolebanese/utility/localization/localization.dart';

class ChangeLogic extends ChangeNotifier {
  double convert(double input, double from, double to) {
    if (input <= 0) {
      return 0.0;
    } else {
      return (input / from) * to;
    }
  }

  ChangeLogic(BuildContext context) {
    localization = Localization.of(context);
  }
  var localization;

  var controller = TextEditingController();
  var priceToday = '';
  static const imagesPath = 'assets/images';
  List<Map> currencyTypes;

  int selectedIndex1 = 0;
  int selectedIndex2 = 0;
  double from = 1.0;
  double to = 1.0;
  String fromT = '', toT = '';
  var result = 0.0;
}
