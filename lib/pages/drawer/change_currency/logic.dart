import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:usatolebanese/base/logic.dart';

class ChangeLogic extends ChangeNotifier {
  ChangeLogic() {
    controller.addListener(() {
      if (controller.text.isEmpty) {
        value = 0.0;
        notifyListeners();
      }
    });
  }
  double convert(double input, double from, double to) {
    if (input <= 0) {
      return 0.0;
    } else {
      return (input / from) * to;
    }
  }

  var controller = TextEditingController();
  var priceToday = '';
  static const imagesPath = 'assets/images';
  List<Map> currencyTypes;

  int selectedIndex1 = 0;
  int selectedIndex2 = 0;
  double from;
  double to;
  String fromT = '', toT = '';
  var value = 0.0;
}
