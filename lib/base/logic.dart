import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BaseLogic extends ChangeNotifier {
  var xTranslate = 100.0;
  var tabsTitles = [
    {'selected': false, 'title': 'العمله اللبنانيه', 'idx': 0},
    {'selected': false, 'title': 'العمله السوريه', 'idx': 1},
    {'selected': false, 'title': 'محول العملات', 'idx': 2}
  ];
  var controller = PageController();
  BaseLogic() {
    controller.addListener(() {
      print(controller.offset / 360);
      xTranslate = (controller.offset * 4 / 360);
      print(xTranslate);
      notifyListeners();
    });
  }

  onPressed() {}

  @override
  // TODO: implement props
  List<Object> get props => tabsTitles;
}
