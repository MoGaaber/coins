import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'home.dart';
import 'app_localizations.dart';

void main(){
  runApp(Usatolebaness());
  
  
}

class Usatolebaness extends StatefulWidget {
  @override
  _UsatolebanessState createState() => _UsatolebanessState();
}

class _UsatolebanessState extends State<Usatolebaness> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      supportedLocales: [
        Locale('en', 'US'),
        Locale('ar', 'EG'),
      ],
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
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: SplashScreen(

        seconds: 3,
        backgroundColor: Colors.black,
        navigateAfterSeconds: Home(),
        title: Text(
          'welcome',
          style: TextStyle(fontFamily: 'BalooBhaijaan'),
        ),
      ),
    );
  }
}