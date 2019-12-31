import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:usatolebanese/pages/bnb/currency_value/logic.dart';

class ValueRoot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      child: MaterialApp(
          home: SafeArea(
              child: Scaffold(
        body: Column(
          children: <Widget>[],
        ),
      ))),
      create: (BuildContext context) => ValueLogic(),
    );
  }
}
