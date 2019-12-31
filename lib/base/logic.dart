import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BaseLogic extends ChangeNotifier {
  var bnbItems = [
    {'icon': 'assets/images/lebanon.png', 'title': 'Lebanon'},
    {'icon': 'assets/images/turkey-flag.png', 'title': 'syria'},
    {'icon': 'assets/images/exchange.png', 'title': 'Exchange'}
  ];
  int index = 0;
  var controller = PageController();

  var xTranslate = 0.0;
  onTap(int idx) {
    this.index = idx;
    controller.animateToPage(idx,
        duration: Duration(milliseconds: 300), curve: Curves.easeInOutExpo);
  }
}
