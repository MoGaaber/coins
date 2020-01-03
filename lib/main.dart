import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:usatolebanese/base/root.dart';
import 'package:usatolebanese/utility/localization/delegate.dart';

main() {
  runApp(Root());
}

class Root extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
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
      home: BaseRoot(),
    );
  }
}
