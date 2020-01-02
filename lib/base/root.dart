import 'package:bezier_chart/bezier_chart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import 'package:usatolebanese/base/Base.dart';
import 'package:usatolebanese/base/logic.dart';

class BaseRoot extends StatefulWidget {
  @override
  _BaseRootState createState() => _BaseRootState();
}

class _BaseRootState extends State<BaseRoot> {
  @override
  Widget build(BuildContext cx) {
    return MultiProvider(
      child: Base(),
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) => BaseLogic(cx)),
        StreamProvider(
          create: (BuildContext context) {
            return Firestore.instance
                .collection('Pounds')
                .document('Lebanese')
                .snapshots();
          },
        ),
        StreamProvider(
          create: (BuildContext context) {
            return Firestore.instance
                .collection('Pounds')
                .document('Syrian')
                .snapshots();
          },
        ),
      ],
    );
  }
}

class X extends ChangeNotifier {}
