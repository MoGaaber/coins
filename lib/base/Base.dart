import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:usatolebanese/app_localizations.dart';
import 'package:usatolebanese/base/bnb.dart';
import 'package:usatolebanese/base/drawer.dart';
import 'package:usatolebanese/base/logic.dart';
import 'package:usatolebanese/changhmoney.dart';
import 'package:usatolebanese/junk/tabby.dart';
import 'package:usatolebanese/lebaness.dart';
import 'package:usatolebanese/main.dart';
import 'package:usatolebanese/pages/bnb/change_currency/root.dart';
import 'package:usatolebanese/syriya.dart';

class Base extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var logic = Provider.of<BaseLogic>(context);
    print(DemoLocalizations.of(context).drawer[0]);
    return SafeArea(
        child: Scaffold(
      drawer: Draw(),
      appBar: AppBar(
        title: Text('العملة اللبنانية'),
        centerTitle: true,
        backgroundColor: Colors.black,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.apps),
            onPressed: () {
              logic.openDrawer(context);
            },
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              Share.share(
                  'https://play.google.com/store/apps/details?id=com.usatolebanese',
                  subject: 'شارك تطبيقنا مع اصاحبك !');
            },
          ),
        ],
      ),
//      body: PageView(
//        controller: logic.controller,
//        children: <Widget>[Lebaness(), Syriya(), Changhmoney()],
//      ),
    ));
  }
}
