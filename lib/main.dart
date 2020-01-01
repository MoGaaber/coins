import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:usatolebanese/base/Base.dart';
import 'package:usatolebanese/base/root.dart';
import 'package:usatolebanese/utility/localization/delegate.dart';
import 'pages/out/chart/root.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:bezier_chart/bezier_chart.dart';

import 'package:admob_flutter/admob_flutter.dart';

main() {
  runApp(Root());
}

class Root extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(iconTheme: IconThemeData(color: Colors.white)),
      localizationsDelegates: [
        const LocalizationDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''),
        const Locale('ar', ''),
      ],
      home: BaseRoot(),
    );
  }
}
