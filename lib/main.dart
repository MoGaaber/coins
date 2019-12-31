import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:usatolebanese/base/root.dart';
import 'package:usatolebanese/pages/pageview/currency_value/root.dart';

import 'home.dart';
import 'pages/out/chart/root.dart';
import 'package:fl_chart/fl_chart.dart';

void main() {
  runApp(
    MaterialApp(home: BarChartSample2()),
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
