import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:usatolebanese/base/bnb.dart';
import 'package:usatolebanese/base/logic.dart';
import 'package:usatolebanese/junk/tabby.dart';
import 'package:usatolebanese/lebaness.dart';
import 'package:usatolebanese/pages/bnb/change_currency/root.dart';
import 'package:usatolebanese/syriya.dart';

class Base extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var logic = Provider.of<BaseLogic>(context);
    //print(MediaQuery.of(context).size.width);
    return SafeArea(
        child: Scaffold(
      body: PageView(
        controller: logic.controller,
        children: <Widget>[
          Lebaness(),
          Syriya(),
          ChangeRoot()
        ],
      ),
      bottomNavigationBar: Bnb(),
    ));
  }
}
