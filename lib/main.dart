import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:usatolebanese/app_localizations.dart';
import 'package:usatolebanese/base/Base.dart';
import 'package:usatolebanese/base/root.dart';
import 'pages/out/chart/root.dart';
import 'package:fl_chart/fl_chart.dart';

import 'package:admob_flutter/admob_flutter.dart';



void main() {
  Admob.initialize("ca-app-pub-3940256099942544~3347511713");

  runApp(
    MaterialApp(   supportedLocales: [
      Locale('en', 'US'),
      Locale('ar', 'EG'),
    ],
        // These delegates make sure that the localization data for the proper language is loaded
        localizationsDelegates: [
          // THIS CLASS WILL BE ADDED LATER
          // A class which loads the translations from JSON files
          Local.delegate,
          // Built-in localization of basic text for Material widgets
          GlobalMaterialLocalizations.delegate,
          // Built-in localization for text direction LTR/RTL
          GlobalWidgetsLocalizations.delegate,
        ],
        // Returns a locale which will be used by the app
        localeResolutionCallback: (locale, supportedLocales) {
          // Check if the current device locale is supported
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale.languageCode &&
                supportedLocale.countryCode == locale.countryCode) {
              return supportedLocale;
            }
          }
          // If the locale of the device is not supported, use the first one
          // from the list (English, in this case).
          return supportedLocales.first;
        },

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
        backgroundColor: Colors.black,
        navigateAfterSeconds: Base(),
        title: Text(
          'مرحبا بكم',
          style: TextStyle(fontFamily: 'BalooBhaijaan'),
        ),
      ),
    );
  }
}
