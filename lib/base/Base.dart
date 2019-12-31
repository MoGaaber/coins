import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:usatolebanese/base/logic.dart';
import 'package:usatolebanese/base/tabby.dart';
import 'package:usatolebanese/pages/pageview/change_currency/root.dart';

class Base extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var logic = Provider.of<BaseLogic>(context);
    print(MediaQuery.of(context).size.width);
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              child: Tabby(),
            ),
            Expanded(
              child: PageView(controller: logic.controller, children: <Widget>[
                Container(
                  color: Colors.red,
                ),
                Container(
                  color: Colors.white,
                ),
                ChangeRoot(),
              ]),
            )
          ]),
    );
  }
}
