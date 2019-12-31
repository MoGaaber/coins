import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:usatolebanese/globals/widgets/warning.dart';
import 'package:usatolebanese/pages/bnb/change_currency/card.dart';
import 'package:usatolebanese/pages/bnb/change_currency/logic.dart';
import 'package:usatolebanese/pages/bnb/change_currency/notice.dart';

class ChangeRoot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
            child: Warning(),
          ),
          TheCard(
            index: 0,
          ),
          TheCard(
            index: 1,
          )
        ],
      ),
      create: (BuildContext context) => ChangeLogic(),
    );
  }
}
