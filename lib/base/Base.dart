import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity/connectivity.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:tuple/tuple.dart';
import 'package:usatolebanese/base/drawer.dart';
import 'package:usatolebanese/base/logic.dart';
import 'package:usatolebanese/utility/localization/localization.dart';
import 'package:firebase_admob/firebase_admob.dart';

class Base extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var logic = Provider.of<BaseLogic>(context, listen: false);

    return SafeArea(
        child: Scaffold(
            backgroundColor: Color(0xff1B191A),
            drawer: Draw(),
            appBar: AppBar(
              textTheme: TextTheme(
                  title: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              )),
              title: Selector<BaseLogic, int>(
                selector: (BuildContext, BaseLogic logic) => logic.index,
                builder: (BuildContext context, int value, Widget child) {
                  return Text(
                    Localization.of(context).drawer[value],
                  );
                },
              ),
              centerTitle: true,
              backgroundColor: Color(0xff242527),
              leading: Builder(
                builder: (context) => IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {
                    logic.openDrawer(context); ////
                  },
                ),
              ),
            ),
            body: Selector<BaseLogic, int>(
              selector: (BuildContext, BaseLogic baseLogic) {
                return baseLogic.index;
              },
              builder: (BuildContext context, int value, Widget child) {
                return logic.pages[value];
              },
            )));
  }
}
