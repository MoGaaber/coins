import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import 'package:usatolebanese/base/Base.dart';
import 'package:usatolebanese/base/bnb.dart';
import 'package:usatolebanese/base/logic.dart';
import 'package:usatolebanese/junk/tabby.dart';
import 'package:usatolebanese/pages/bnb/change_currency/root.dart';

class BaseRoot extends StatefulWidget {
  @override
  _BaseRootState createState() => _BaseRootState();
}

class _BaseRootState extends State<BaseRoot> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        child: Base(), create: (BuildContext context) => BaseLogic());
  }
}
