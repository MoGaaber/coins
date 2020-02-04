import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:usatolebanese/base/logic.dart';
import 'package:usatolebanese/globals/logics/constants.dart';
import 'package:usatolebanese/pages/drawer/change_currency/change.dart';
import 'package:usatolebanese/pages/drawer/currency_value/value.dart';
import 'package:usatolebanese/pages/out/chart/use_of_widget/goldpounds.dart';
import 'package:usatolebanese/pages/out/chart/use_of_widget/oilpoundes.dart';
import 'package:usatolebanese/pages/out/chart/use_of_widget/reader.dart';
import 'package:usatolebanese/utility/localization/localization.dart';
import 'package:launch_review/launch_review.dart';

class Draw extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var logic = Provider.of<BaseLogic>(context, listen: false);
    return FractionallySizedBox(
      widthFactor: 0.70,
      child: Drawer(
        child: Material(
          color: Colors.black,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                DrawerHeader(
                  child: Center(
                      child: Image.asset(
                    'assets/images/logo.png',
                    fit: BoxFit.cover,
                    width: logic.aspectRatio * 164.444444444,
                    height: logic.aspectRatio * 164.444444444,
                  )),
                  decoration: BoxDecoration(
                    color: Color(0xff250101),
                  ),
                ),
                ListTile(
                    leading: Icon(
                      FontAwesomeIcons.coins,
                      color: Colors.white,
                    ),
                    title: Text(
                      Localization.of(context).drawer[0],
                      style: TextStyle(fontSize: 16),
                    ),
                    onTap: () {
                      logic.navigateToPage(context, 0);
                    }),
                ListTile(
                    leading: Icon(
                      FontAwesomeIcons.coins,
                      color: Colors.white,
                    ),
                    title: Text(
                      Localization.of(context).drawer[1],
                      style: TextStyle(fontSize: 16),
                    ),
                    onTap: () {
                      logic.navigateToPage(context, 1);
                    }),
                ListTile(
                    leading: Icon(
                      FontAwesomeIcons.exchangeAlt,
                      color: Colors.white,
                    ),
                    title: Text(
                      Localization.of(context).drawer[2],
                      style: TextStyle(fontSize: 16),
                    ),
                    onTap: () {
                      logic.navigateToPage(context, 2);
                    }),
                Divider(
                  height: 50 * logic.aspectRatio,
                  color: Colors.white.withOpacity(0.3),
                ),
                ListTile(
                    leading: Icon(
                      FontAwesomeIcons.gasPump,
                      color: Colors.white,
                    ),
                    title: Text(
                      Localization.of(context).drawer[3],
                      style: TextStyle(fontSize: 16),
                    ),
                    onTap: () {
                      logic.pop();

                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Oil()));
                    }),
                ListTile(
                    leading: Icon(
                      FontAwesomeIcons.coins,
                      color: Colors.white,
                    ),
                    title: Text(
                      Localization.of(context).drawer[4],
                      style: TextStyle(fontSize: 16),
                    ),
                    onTap: () {
                      logic.pop();

                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Gold()));
                    }),
                Divider(
                  height: 50 * logic.aspectRatio,
                  color: Colors.white.withOpacity(0.3),
                ),
                ListTile(
                    leading: Icon(
                      Icons.book,
                      color: Colors.white,
                    ),
                    title: Text(
                      Localization.of(context).drawer[5],
                      style: TextStyle(fontSize: 16),
                    ),
                    onTap: () {
                      logic.pop();

                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Reader()));
                    }),
                Divider(
                  height: 50 * logic.aspectRatio,
                  color: Colors.white.withOpacity(0.3),
                ),
                ListTile(
                    leading: Icon(
                      FontAwesomeIcons.share,
                      color: Colors.white,
                    ),
                    title: Text(
                      Localization.of(context).drawer[6],
                      style: TextStyle(fontSize: 16),
                    ),
                    onTap: () {
                      logic.shareApp();
                    }),
                ListTile(
                    leading: Icon(
                      FontAwesomeIcons.star,
                      color: Colors.white,
                    ),
                    title: Text(
                      Localization.of(context).drawer[7],
                      style: TextStyle(fontSize: 16),
                    ),
                    onTap: () {
                      logic.rateApp();
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
