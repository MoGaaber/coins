import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:usatolebanese/main.dart';
import 'package:usatolebanese/model/model.dart';

class BaseLogic extends ChangeNotifier {
  List<Map> currencyTypes;
  int index = 0;
  int syrianPrice, lebanonPrice;
  Future<QuerySnapshot> lebanonQuery, syrianQuery;
  Future<DocumentSnapshot> lebanonOfficial, syrianOfficial;
  bool isLoading = true;
  Model model;
  void fetchData() {
    Future.wait([
      Firestore.instance
          .collection('lebaness')
          .reference()
          .orderBy('Date', descending: true)
          .limit(2)
          .getDocuments(),
      Firestore.instance
          .collection('turkesh')
          .reference()
          .orderBy('Date', descending: true)
          .limit(2)
          .getDocuments(),
      Firestore.instance.collection('coin').document('lebanon').get(),
      Firestore.instance.collection('coin').document('turkey').get()
    ]).then((x) {
      this.model = Model(
          lebanonQuery: x[0],
          syrianQuery: x[1],
          lebanonOfficial: x[2],
          syrianOfficial: x[3]);
      currencyTypes = [
        {'value': 1.0, 'name': 'Usa Dollar'},
        {'value': model.buyLebanon, 'name': 'Lebanon Lera'},
        {'value': model.buySyrian, 'name': 'Syrian Lera'},
      ];

      isLoading = false;
      notifyListeners();
    });
  }

  BaseLogic() {
    //fetchData();
  }
  var listTiles = <Map>[];
  var icons = [
    FontAwesomeIcons.exchangeAlt,
    FontAwesomeIcons.coins,
    FontAwesomeIcons.coins,
    FontAwesomeIcons.star,
    FontAwesomeIcons.share
  ];

  var bnbItems = [
    {'icon': 'assets/images/lebanon.png', 'title': 'Lebanon'},
    {'icon': 'assets/images/turkey-flag.png', 'title': 'syria'},
    {'icon': 'assets/images/exchange.png', 'title': 'Exchange'}
  ];
  var controller = PageController();

  var xTranslate = 0.0;
  onTap(int idx) {
    this.index = idx;
    controller.animateToPage(idx,
        duration: Duration(milliseconds: 300), curve: Curves.easeInOutExpo);
  }

  void openDrawer(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }
}
