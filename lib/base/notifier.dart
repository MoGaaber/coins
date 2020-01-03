import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:usatolebanese/utility/localization/localization.dart';

class Notifier extends ChangeNotifier {
  Stream<DocumentSnapshot> lebanonSnapshot, syriaSnapshot2;
  Notifier(BuildContext context, this.lebanonSnapshot, this.syriaSnapshot2) {
    localization = Localization.of(
      context,
    );
  }
  var controller = TextEditingController();
  var textValues = {'from': 'USA', 'to': 'Lebanon'};
  Localization localization;
  var dropDownElements = [];
  double converter(double input, double from, double to) {
    return (input * from) / to;
  }

  List data;
  var buyPrices;
}
