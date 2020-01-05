import 'dart:math';

import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:usatolebanese/base/drawer.dart';
import 'package:usatolebanese/base/logic.dart';
import 'package:usatolebanese/utility/localization/localization.dart';

class Base extends StatelessWidget {
  BannerAd _bannerAd;

  @override
  Widget build(BuildContext context) {
    var logic = Provider.of<BaseLogic>(context, listen: false);

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: SafeArea(
          child: Scaffold(
              backgroundColor: Color(0xff1B191A),
              drawer: Draw(),
              appBar: AppBar(
                actions: <Widget>[],
                textTheme: TextTheme(
                    title: TextStyle(
                  fontSize: logic.aspectRatio * 30,
                  fontWeight: FontWeight.bold,
                )),
                title: Selector<BaseLogic, int>(
                  selector: (_, BaseLogic logic) => logic.index,
                  builder: (BuildContext context, int value, _) {
                    return Text(
                      Localization.of(context).drawer[value],
                    );
                  },
                ),
                centerTitle: true,
                backgroundColor: Color(0xff242527),
                leading: Builder(
                  builder: (BuildContext context) => IconButton(
                    icon: Icon(
                      Icons.menu,
                      size: logic.aspectRatio * 42.7555555556,
                    ),
                    onPressed: () {
                      logic.openDrawer(context); ////
                    },
                  ),
                ),
              ),
              body: Selector<BaseLogic, int>(
                selector: (_, BaseLogic baseLogic) {
                  return baseLogic.index;
                },
                builder: (_, int value, __) {
                  return logic.pages[value];
                },
              ))),
    );
  }
}
