import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity/connectivity.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:tuple/tuple.dart';
import 'package:usatolebanese/base/drawer.dart';
import 'package:usatolebanese/base/logic.dart';
import 'package:usatolebanese/pages/drawer/change_currency/root.dart';
import 'package:usatolebanese/pages/drawer/currency_value/root.dart';
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
              centerTitle: false,
              backgroundColor: Color(0xff242527),
              leading: Builder(
                builder: (context) => IconButton(
                  icon: Icon(Icons.apps),
                  onPressed: () {
                    logic.openDrawer(context); ////
                  },
                ),
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.refresh),
                  onPressed: () {
                    Connectivity().checkConnectivity().then((x) {
                      if (x == ConnectivityResult.none) {
                      } else {
                        logic.fetchData();
                        logic.notifyListeners();
                      }
                    });
                  },
                ),
//                IconButton(
//                  icon: Icon(Icons.share),
//                  onPressed: () {
//                    Share.share(
//                        'https://play.google.com/store/apps/details?id=com.usatolebanese',
//                        subject: 'شارك تطبيقنا مع اصاحبك !');
//                  },
//                ),
              ],
            ),
            body: Selector<BaseLogic, Tuple2<bool, int>>(
              builder: (BuildContext context, Tuple2 value, Widget child) =>
                  !value.item1
                      ? Center(child: Text('!!'))
                      : DefaultTextStyle(
                          style: TextStyle(color: Colors.white),
                          child: logic.pages[value.item2]),
              selector: (BuildContext, BaseLogic baseLogic) => Tuple2(
                logic.isLoading,
                logic.index,
              ),
            )));
  }
}
