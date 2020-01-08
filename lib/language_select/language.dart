import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:usatolebanese/language_select/button.dart';
import 'package:usatolebanese/main.dart';
import 'package:usatolebanese/utility/localization/localization.dart';
import 'dart:math' as math;

class Language extends StatefulWidget {
  @override
  _LanguageState createState() => _LanguageState();
}

class _LanguageState extends State<Language> with TickerProviderStateMixin {
  AnimationController rotateC, translateC;
  Animation<double> rotate;

  Animation<Offset> translate;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    rotateC =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..repeat(reverse: true);
    translateC =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..repeat(reverse: true);
    rotate = Tween<double>(begin: 0.2, end: -0.4).animate(rotateC);
    translate = Tween<Offset>(begin: Offset(0, 0), end: Offset(0, 30))
        .animate(CurvedAnimation(curve: Curves.easeInOut, parent: translateC));
  }

  @override
  Widget build(BuildContext context) {
    var local = Localization.of(context).language;
    print(Localization.of(context).locale.languageCode);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(local[0]),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.more_vert), onPressed: () {})
          ],
        ),
        // backgroundColor: Color(0xff0E0E0E),
        body: Center(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Spacer(
                flex: 1,
              ),

              Spacer(
                flex: 1,
              ),

              AnimatedBuilder(
                animation: translate,
                builder: (BuildContext context, Widget child) {
                  return Transform.translate(
                    offset: Offset(0, 0),
                    child: Image.asset(
                      'assets/images/logo.png',
                      height: 130,
                      width: 130,
                    ),
                  );
                },
              ),
              Spacer(
                flex: 1,
              ),
//              Center(
//                child: Text(
//
//                  style: TextStyle(
//                      fontSize: 20,
//                      fontWeight: FontWeight.w700,
//                      color: Colors.white),
//                ),
//              ),
              Spacer(
                flex: 3,
              ),
              Buttony(),
              Spacer(
                flex: 1,
              ),

              Buttony(),
              Spacer(
                flex: 3,
              )
            ],
          ),
        ),
      ),
    );
  }
}
