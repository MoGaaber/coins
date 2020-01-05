import 'dart:io';
import 'dart:math';

import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:usatolebanese/base/drawer.dart';
import 'package:usatolebanese/base/logic.dart';
import 'package:usatolebanese/utility/localization/localization.dart';

class Base extends StatelessWidget {
  BannerAd _bannerAd;

  @override
  Widget build(BuildContext context) {
    var logic = Provider.of<BaseLogic>(context, listen: false);
    var buttons = [
      {
        'text': 'Exit App',
        'onPressed': () {
          exit(0);
        }
      },
      if (logic.isShareReady) {'text': 'Share App', 'onPressed': () {}}
    ];

    void showDialoggy(BuildContext context) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Are'),
              actions: buttons.map((element) {
                return FlatButton(
                    onPressed: element['onPressed'],
                    child: Text(element['text']));
              }).toList(),
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            );
          });
    }

    return WillPopScope(
      onWillPop: () async {
        showDialoggy(context);
        return false;
      },
      child: SafeArea(
          child: Scaffold(
              backgroundColor: Color(0xff1B191A),
              drawer: Draw(),
              appBar: AppBar(
                actions: <Widget>[
                  IconButton(
                      icon: Icon(Icons.share),
                      onPressed: () {
                        Share.share('check out my website https://example.com',
                            subject: 'Look what I made!');
                      })
                ],
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
