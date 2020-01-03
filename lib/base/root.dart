import 'package:admob_flutter/admob_flutter.dart';
import 'package:bezier_chart/bezier_chart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';
import 'package:usatolebanese/base/Base.dart';
import 'package:usatolebanese/base/logic.dart';

import 'package:usatolebanese/globals/widgets/ad.dart';
import 'package:usatolebanese/pages/drawer/change_currency/logic.dart';
import 'package:usatolebanese/utility/localization/localization.dart';
import 'package:async/async.dart';

class BaseRoot extends StatefulWidget {
  @override
  _BaseRootState createState() => _BaseRootState();
}

class _BaseRootState extends State<BaseRoot>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext cx) {
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
