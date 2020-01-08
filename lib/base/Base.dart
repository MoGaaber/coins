import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_admob/firebase_admob.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:tuple/tuple.dart';
import 'package:usatolebanese/base/drawer.dart';
import 'package:usatolebanese/base/logic.dart';
import 'package:usatolebanese/pages/drawer/change_currency/logic.dart';
import 'package:usatolebanese/utility/localization/localization.dart';

class Base extends StatefulWidget {
  @override
  _BaseState createState() => _BaseState();
}

class _BaseState extends State<Base> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  BannerAd _bannerAd;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    baseLogic = Provider.of<BaseLogic>(context, listen: false);
    buttons = [
      {
        'text': 'Exit App',
        'onPressed': () {
          exit(0);
        }
      },
      if (baseLogic.isShareReady) {'text': 'Share App', 'onPressed': () {}}
    ];
  }

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

  List<Map> buttons;

  BaseLogic baseLogic;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var changeLogic = Provider.of<ChangeLogic>(context, listen: false);
    return WillPopScope(
      onWillPop: () async {
        showDialoggy(context);
        return false;
      },
      child: SafeArea(
          child: Scaffold(
              key: baseLogic.scaffoldKey,
              floatingActionButton: FloatingActionButton(onPressed: () {
                baseLogic.showSnackBar();
              }),
              backgroundColor: Color(0xff0E0E0E),
              drawer: Draw(),
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(60),
                child: AppBar(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusDirectional.vertical(
                          bottom: Radius.circular(10))),
                  actions: <Widget>[
                    RotationTransition(
                      turns: baseLogic.rotationAnimation,
                      child: IconButton(
                          icon: Icon(Icons.refresh),
                          onPressed: () {
                            baseLogic.rotationController.forward(from: 0);
                            baseLogic.fetchData();
                          }),
                    ),
                    IconButton(
                        icon: AnimatedBuilder(
                          animation: baseLogic.colorController,
                          builder: (BuildContext context, Widget child) => Icon(
                            Icons.share,
                            color: baseLogic.colorAnimation.value,
                          ),
                        ),
                        onPressed: () {
//                          Share.share(
//                              'check out my website https://example.com',
//                              subject: 'Look what I made!');
                          baseLogic.colorController.forward().then((x) {
                            baseLogic.colorController.reverse();
                          });
                        })
                  ],
                  textTheme: TextTheme(
                      title: TextStyle(
                    fontSize: baseLogic.aspectRatio * 30,
                    fontWeight: FontWeight.bold,
                  )),
                  title: Selector<BaseLogic, int>(
                    selector: (_, BaseLogic logic) => logic.index,
                    builder: (BuildContext context, int value, _) {
                      return Text(
                        Localization.of(context).drawer[value],
                        style: TextStyle(
                            fontSize: baseLogic.aspectRatio * 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      );
                    },
                  ),
                  centerTitle: false,
                  backgroundColor: Color(0xff242527),
                  leading: Builder(
                    builder: (BuildContext context) => IconButton(
                      icon: Icon(
                        Icons.menu,
                        size: baseLogic.aspectRatio * 42.7555555556,
                      ),
                      onPressed: () {
                        baseLogic.openDrawer(context); ////
                      },
                    ),
                  ),
                ),
              ),
              body: Selector<BaseLogic, Tuple2<int, bool>>(
                selector: (_, BaseLogic baseLogic) {
                  return Tuple2(baseLogic.index, baseLogic.isLoading);
                },
                builder: (_, Tuple2 value, __) {
                  return value.item2
                      ? Center(child: Text('!!'))
                      : baseLogic.pages[value.item1];
                },
              ))),
    );
  }
}
