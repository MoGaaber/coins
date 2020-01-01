import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:usatolebanese/pages/drawer/currency_value/logic.dart';
import 'package:usatolebanese/pages/drawer/currency_value/value.dart';

class ValueRoot extends StatelessWidget {
  bool isLebanon;
  ValueRoot({this.isLebanon});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      child: Value(
        isLebanon: this.isLebanon,
      ),
      create: (BuildContext context) => ValueLogic(),
    );
  }
}
