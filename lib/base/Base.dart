import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:usatolebanese/base/drawer.dart';
import 'package:usatolebanese/base/logic.dart';
import 'package:usatolebanese/pages/drawer/change_currency/root.dart';
import 'package:usatolebanese/pages/drawer/currency_value/root.dart';
import 'package:usatolebanese/utility/localization/localization.dart';

class Base extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var logic = Provider.of<BaseLogic>(context, listen: false);
    return SafeArea(
        child: Scaffold(
            backgroundColor: Color(0xff1B191A),
            drawer: Draw(),
            appBar: AppBar(
              textTheme: TextTheme(
                  title: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              )),
              title: Selector<BaseLogic, int>(
                selector: (BuildContext, BaseLogic logic) => logic.index,
                builder: (BuildContext context, int value, Widget child) {
                  return Text(
                    Localization.of(context).drawer[value],
                  );
                },
              ),
              centerTitle: false,
              backgroundColor: Color(0xff242527),
              leading: Builder(
                builder: (context) => IconButton(
                  icon: Icon(Icons.apps),
                  onPressed: () {
                    logic.openDrawer(context); ////
                    print('!!');
                  },
                ),
              ),
//              actions: <Widget>[
//                IconButton(
//                  icon: Icon(Icons.refresh),
//                  onPressed: () {},
//                ),
//                IconButton(
//                  icon: Icon(Icons.share),
//                  onPressed: () {
//                    Share.share(
//                        'https://play.google.com/store/apps/details?id=com.usatolebanese',
//                        subject: 'شارك تطبيقنا مع اصاحبك !');
//                  },
//                ),
//              ],
            ),
            body: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  // Where the linear gradient begins and ends
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  // Add one stop for each color. Stops should increase from 0 to 1
                  stops: [0.1, 0.5],
                  colors: [
                    // Colors are easy thanks to Flutter's Colors class.
                    Colors.black,
                    Color(0xff1E1E2E)
                  ],
                ),
              ),
              child: DefaultTextStyle(
                style: TextStyle(color: Colors.white),
                child: PageView(
                    onPageChanged: (x) {
                      logic.index = x;
                      logic.notifyListeners();
                    },
                    controller: logic.controller,
                    children: <Widget>[
                      ChangeRoot(),
                      ValueRoot(
                        isLebanon: false,
                      ),
                      ValueRoot(
                        isLebanon: true,
                      )
                    ]),
              ),
            )));
  }
}
