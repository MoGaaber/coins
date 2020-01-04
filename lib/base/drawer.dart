import 'dart:math';

import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:usatolebanese/base/logic.dart';
import 'package:usatolebanese/main.dart';
import 'package:usatolebanese/utility/localization/localization.dart';

class Draw extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var logic = Provider.of<BaseLogic>(context, listen: false);
    return FractionallySizedBox(
      widthFactor: 0.70,
      child: Drawer(
        child: Material(
          color: Colors.black,
          child: Column(
            children: <Widget>[
              DrawerHeader(
                child: Center(
                    child: Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.cover,
                  width: logic.aspectRatio * 164.444444444,
                  height: logic.aspectRatio * 164.444444444,
                )),
                decoration: BoxDecoration(
                  color: Color(0xff49000E),
                ),
              ),
              for (int i = 0; i < logic.icons.length; i++)
                Column(
                  children: <Widget>[
                    ListTile(
                        title: Text(
                          Localization.of(context).drawer[i],
                          style: TextStyle(
                              fontSize: logic.aspectRatio * 29,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                        leading: Icon(logic.icons[i],
                            size: logic.aspectRatio * 44, color: Colors.white),
                        onTap: () {
                          logic.navigateToPage(context, i);
                        }),
                    Divider()

//                    i == 2
//                        ? Column(
//                            crossAxisAlignment: CrossAxisAlignment.start,
//                            children: <Widget>[
//                              Divider(
//                                color: Colors.white,
//                              ),
//                              Padding(
//                                padding: const EdgeInsets.all(8.0),
//                                child: Text(
//                                  Localization.of(context).drawer[i + 1],
//                                  style: TextStyle(
//                                      fontSize: 20,
//                                      fontWeight: FontWeight.bold,
//                                      color: Colors.white),
//                                ),
//                              )
//                            ],
//                          )
//                        : Container()
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
