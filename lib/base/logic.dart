import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BaseLogic extends ChangeNotifier {
  var xTranslate = 1.0;
  var tabsTitles = [
    {'selected': false, 'title': 'العمله اللبنانيه', 'idx': 0},
    {'selected': false, 'title': 'العمله السوريه', 'idx': 1},
    {'selected': false, 'title': 'محول العملات', 'idx': 2}
  ];
  var controller = PageController();
}
