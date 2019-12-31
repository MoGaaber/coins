import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:usatolebanese/app_localizations.dart';
import 'package:usatolebanese/base/Base.dart';
import 'package:usatolebanese/base/root.dart';
import 'package:usatolebanese/widget/messaging_widget.dart';
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
var _themdata=ThemeData(primarySwatch: Colors.black54,textSelectionColor: Colors.white,brightness: Brightness.dark);
class _UsatolebanessState extends State<Usatolebaness> {


  @override
  Widget build(BuildContext context) {
    return Theme(data: _themdata,
      child: MaterialApp(

        debugShowCheckedModeBanner: false,
        home: Base(),
      ),
    );
  }
}
class MyApp extends StatelessWidget {
  final String appTitle = 'Firebase messaging';
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: appTitle,
    home: MainPage(appTitle: appTitle),
  );
}

class MainPage extends StatelessWidget {
  final String appTitle;

  const MainPage({this.appTitle});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(appTitle),
    ),
    body: MessagingWidget(),
  );
}