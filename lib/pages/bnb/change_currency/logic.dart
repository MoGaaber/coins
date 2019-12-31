import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class ChangeLogic extends ChangeNotifier {
  dynamic convertToSyria(double input) {
    if (input <= 0) {
      return false;
    } else {
//      return (input / lebanon) * syria;
    }
  }

  var controller = TextEditingController();
  var priceToday = '';
  static const imagesPath = 'assets/images';
  static const images = [
    '$imagesPath/usa.png',
    '$imagesPath/lebanon.png',
    '$imagesPath/syria.png'
  ];
  static const currencyTypes = [
    {'value': 0, 'name': 'الدولار الامريكى'},
    {'value': 1, 'name': 'الليره اللبنانى'},
    {'value': 2, 'name': 'الليره السوري'},
  ];

  int selectedIndex1 = 0;
  int selectedIndex2 = 0;
  String firstPicture = images[0];
  String secondPicture = images[0];
}
