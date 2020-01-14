import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:provider/provider.dart';
import 'package:usatolebanese/base/Base.dart';
import 'package:usatolebanese/base/logic.dart';

import 'package:usatolebanese/pages/drawer/change_currency/logic.dart';

class BaseRoot extends StatefulWidget {
  @override
  _BaseRootState createState() => _BaseRootState();
}

class _BaseRootState extends State<BaseRoot> with TickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext cx) {
    KeyboardVisibilityNotification().addNewListener(onChange: (x) {
      print(x);
    });

    return MultiProvider(
      child: Base(),
      providers: [
        ChangeNotifierProvider(
            create: (BuildContext context) => BaseLogic(cx, this)),
        ChangeNotifierProvider(
            create: (BuildContext context) => ChangeLogic(cx)),
      ],
    );
  }
}
