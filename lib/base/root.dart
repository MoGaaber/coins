import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import 'package:usatolebanese/base/Base.dart';
import 'package:usatolebanese/base/logic.dart';
import 'package:usatolebanese/base/tabby.dart';
import 'package:usatolebanese/pages/pageview/change_currency/root.dart';

class BaseRoot extends StatefulWidget {
  @override
  _BaseRootState createState() => _BaseRootState();
}

class _BaseRootState extends State<BaseRoot> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.black,
            body: ChangeNotifierProvider.value(
              value: BaseLogic(),
              child: Base(),
            )));
  }
}
