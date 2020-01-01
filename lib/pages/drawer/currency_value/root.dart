import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:usatolebanese/pages/drawer/currency_value/logic.dart';
import 'package:usatolebanese/pages/drawer/currency_value/value.dart';

class ValueRoot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      child: Value(),
      create: (BuildContext context) => ValueLogic(),
    );
  }
}
