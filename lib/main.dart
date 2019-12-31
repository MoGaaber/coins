import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:usatolebanese/app_localizations.dart';
import 'package:usatolebanese/base/Base.dart';
import 'package:usatolebanese/base/root.dart';
import 'pages/out/chart/root.dart';
import 'package:fl_chart/fl_chart.dart';

import 'package:admob_flutter/admob_flutter.dart';

//void main() {
// Admob.initialize("ca-app-pub-3940256099942544~3347511713");

//  runApp(
//    MaterialApp(
//        supportedLocales: [
//          Locale('en', 'US'),
//          Locale('ar', 'EG'),
//        ],
//        // These delegates make sure that the localization data for the proper language is loaded
//        localizationsDelegates: [
//          // THIS CLASS WILL BE ADDED LATER
//          // A class which loads the translations from JSON files
//          Local.delegate,
//          // Built-in localization of basic text for Material widgets
//          GlobalMaterialLocalizations.delegate,
//          // Built-in localization for text direction LTR/RTL
//          GlobalWidgetsLocalizations.delegate,
//        ],
//        // Returns a locale which will be used by the app
//        localeResolutionCallback: (locale, supportedLocales) {
//          // Check if the current device locale is supported
//          for (var supportedLocale in supportedLocales) {
//            if (supportedLocale.languageCode == locale.languageCode &&
//                supportedLocale.countryCode == locale.countryCode) {
//              return supportedLocale;
//            }
//          }
//          // If the locale of the device is not supported, use the first one
//          // from the list (English, in this case).
//          return supportedLocales.first;
//        },
//        home: Directionality(
//            textDirection: TextDirection.rtl, child: BaseRoot())),
//  );
//}

class Usatolebaness extends StatefulWidget {
  @override
  _UsatolebanessState createState() => _UsatolebanessState();
}

var _themdata = ThemeData(
    primarySwatch: Colors.black54,
    textSelectionColor: Colors.white,
    brightness: Brightness.dark);

class _UsatolebanessState extends State<Usatolebaness> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: _themdata,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Base(),
      ),
    );
  }
}

main() {
  runApp(Demo());
}

class DemoLocalizations {
  DemoLocalizations(this.locale);

  final Locale locale;

  static DemoLocalizations of(BuildContext context) {
    return Localizations.of<DemoLocalizations>(context, DemoLocalizations);
  }

  static Map<String, Map> _localizedValues = {
    'en': {
      'drawer': [
        'Currency exchanger',
        'Syrian currecny',
        'Lebanon currecny',
        'Rate App',
        'Share App'
      ],
    },
    'ar': {
      'drawer': [
        'محول العملات',
        'العملة السورية',
        'العملة اللبنانية',
        'تقييم التطبيق',
        'مشاركه التطبيق'
      ],
    },
  };

  String get title {
    return _localizedValues[locale.languageCode]['drawer']['title'];
  }

  List get drawer {
    return _localizedValues[locale.languageCode]['drawer'];
  }
}

class DemoLocalizationsDelegate
    extends LocalizationsDelegate<DemoLocalizations> {
  const DemoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ar'].contains(locale.languageCode);

  @override
  Future<DemoLocalizations> load(Locale locale) {
    // Returning a SynchronousFuture here because an async "load" operation
    // isn't needed to produce an instance of DemoLocalizations.
    return SynchronousFuture<DemoLocalizations>(DemoLocalizations(locale));
  }

  @override
  bool shouldReload(DemoLocalizationsDelegate old) => false;
}

class DemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(DemoLocalizations.of(context).title),
      ),
      body: Center(
        child: Text(DemoLocalizations.of(context).title),
      ),
    );
  }
}

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        const DemoLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''),
        const Locale('ar', ''),
      ],
      // Watch out: MaterialApp creates a Localizations widget
      // with the specified delegates. DemoLocalizations.of()
      // will only find the app's Localizations widget if its
      // context is a child of the app.
      home: BaseRoot(),
    );
  }
}
