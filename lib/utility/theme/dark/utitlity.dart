import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DarkThemeUtility {
  double aspectRatio;
  Color scaffoldColor = Color(0xff1B191A);
  IconThemeData iconThemeData = IconThemeData(color: Colors.white);
  AppBarTheme appBarTheme;
  FloatingActionButtonThemeData floatingActionButtonThemeData =
      FloatingActionButtonThemeData(backgroundColor: Colors.redAccent);
  String fontFamily = GoogleFonts.cairo().fontFamily;
  TextTheme textTheme;

  DarkThemeUtility(this.aspectRatio) {
    textTheme = TextTheme(
      // التاريخ
      body1: TextStyle(fontSize: 24 * aspectRatio, fontWeight: FontWeight.w800),
      headline:
          TextStyle(fontSize: 18 * aspectRatio, fontWeight: FontWeight.w400),
      body2: TextStyle(fontWeight: FontWeight.w700, fontSize: 40 * aspectRatio),

      // من الى بيع وشراء
      caption: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 20 * aspectRatio,
        letterSpacing: 0.5,
      ),

      // الاسعار
      title: TextStyle(
        fontSize: 38.4 * aspectRatio,
        letterSpacing: 1,
      ),

      // ارقام السعر الرسمى

      // كلمه السعر الرسمى و  اخر تحديث
    ).apply(displayColor: Colors.white, bodyColor: Colors.white);
    appBarTheme = AppBarTheme(
        actionsIconTheme: IconThemeData(color: Colors.white),
        iconTheme: IconThemeData(color: Colors.white),
        color: Color(0xff242527),
        textTheme: TextTheme(
            title: TextStyle(
                fontFamily: GoogleFonts.cairo(letterSpacing: 20).fontFamily,
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: aspectRatio * 30)));
  }
}
