import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:usatolebanese/base/root.dart';

import 'home.dart';
import 'pages/out/chart/root.dart';
import 'package:fl_chart/fl_chart.dart';

import 'package:admob_flutter/admob_flutter.dart';



void main() {
  Admob.initialize("ca-app-pub-3940256099942544~3347511713");

  runApp(
    MaterialApp(
        home: Directionality(
            textDirection: TextDirection.rtl, child: BaseRoot())),
  );
}

class Usatolebaness extends StatefulWidget {
  @override
  _UsatolebanessState createState() => _UsatolebanessState();
}

class _UsatolebanessState extends State<Usatolebaness> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: SplashScreen(
        seconds: 3,
        photoSize: 80,
        backgroundColor: Colors.black,
        navigateAfterSeconds: Home(),
        title: Text(
          'مرحبا بكم في quotes_mix',
          style: TextStyle(fontFamily: 'BalooBhaijaan'),
        ),
      ),
    );
  }
}
