import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:usatolebanese/base/Base.dart';
import 'package:usatolebanese/base/root.dart';
import 'package:usatolebanese/language_select/language.dart';
import 'package:usatolebanese/utility/localization/delegate.dart';
import 'package:usatolebanese/utility/theme/dark/dark.dart';

main() {
  runApp(
    ChangeNotifierProvider(
        create: (c) {
          return Test();
        },
        child: Root()),
  );
}

class Test extends ChangeNotifier {
  var locales = ['und', 'en', 'ar'];
  int index = 0;
}

class Root extends StatelessWidget {
  String x = 'banana';
  @override
  Widget build(BuildContext context) {
    Test test = Provider.of(context);

    num aspectRatio;
    return MaterialApp(
      builder: (context, widget) {
        aspectRatio = MediaQuery.of(context).size.aspectRatio;
        DarkTheme darkTheme =
            DarkTheme(MediaQuery.of(context).size.aspectRatio);
        return MaterialApp(
          showSemanticsDebugger: false,
          debugShowMaterialGrid: false,
          debugShowCheckedModeBanner: false,
          locale: Locale.fromSubtags(languageCode: 'ar'),
          themeMode: ThemeMode.dark,
          theme: ThemeData(
              textTheme: TextTheme(
                  button: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
              buttonTheme: ButtonThemeData(
                textTheme: ButtonTextTheme.primary,
                minWidth: 280 * aspectRatio,
                height: 48,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                buttonColor: Colors.red,
              ),
              appBarTheme: AppBarTheme(
                  actionsIconTheme: IconThemeData(color: Colors.black),
                  color: Colors.white,
                  textTheme: TextTheme(
                      title: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 21))),
              scaffoldBackgroundColor: Colors.white,
              primaryColor: Color(0xff242527),
              iconTheme: IconThemeData(color: Colors.black)),
          darkTheme: darkTheme.themeData,
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
      },
    );
  }
}
