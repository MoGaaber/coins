import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:usatolebanese/ads.dart';
import 'package:usatolebanese/globals/widgets/warning.dart';
import 'package:usatolebanese/pages/bnb/change_currency/card.dart';
import 'package:usatolebanese/pages/bnb/change_currency/logic.dart';
import 'package:usatolebanese/pages/bnb/change_currency/notice.dart';

class ChangeRoot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      child: Column(
        children: <Widget>[
          TheText(),
          TheCard(),
          TheText(),
          TheCard(),
          Ads(),
        ],
      ),
      create: (BuildContext context) => ChangeLogic(),
    );
  }
}
