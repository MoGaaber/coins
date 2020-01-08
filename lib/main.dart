import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:usatolebanese/base/Base.dart';
import 'package:usatolebanese/base/root.dart';
import 'package:usatolebanese/language_select/language.dart';
import 'package:usatolebanese/utility/localization/delegate.dart';

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
  @override
  Widget build(BuildContext context) {
    Test test = Provider.of(context);
    return MaterialApp(
      locale: Locale.fromSubtags(languageCode: test.locales[test.index]),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(
          textTheme: TextTheme(
              button: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
          buttonTheme: ButtonThemeData(
            textTheme: ButtonTextTheme.primary,
            minWidth: 280,
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
      darkTheme: ThemeData(
          textTheme: TextTheme(
              button: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w700)),
          buttonColor: Colors.white,
          buttonTheme: ButtonThemeData(
            minWidth: 280,
            height: 45,
            textTheme: ButtonTextTheme.normal,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12))),
            focusColor: Colors.white,
            highlightColor: Colors.white,
            colorScheme: ColorScheme.light(),
            buttonColor: Colors.white,
          ),
          appBarTheme: AppBarTheme(
              color: Color(0xff242527),
              textTheme: TextTheme(
                  title: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20))),
          scaffoldBackgroundColor: Color(0xff1B191A),
          primaryColor: Color(0xff242527),
          iconTheme: IconThemeData(color: Colors.white)),
      localizationsDelegates: [
        const LocalizationDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''),
        const Locale('ar', ''),
      ],
      home: Language(),
    );
  }
}
