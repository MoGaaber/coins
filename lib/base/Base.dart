import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:usatolebanese/base/drawer.dart';
import 'package:usatolebanese/base/logic.dart';
import 'package:usatolebanese/pages/drawer/currency_value/root.dart';
import 'package:usatolebanese/utility/localization/localization.dart';

class Base extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var logic = Provider.of<BaseLogic>(context, listen: false);
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.black,
            drawer: Draw(),
            appBar: AppBar(
              title: Selector<BaseLogic, int>(
                selector: (BuildContext, BaseLogic logic) => logic.index,
                builder: (BuildContext context, int value, Widget child) {
                  return Text(Localization.of(context).drawer[value]);
                },
              ),
              centerTitle: true,
              backgroundColor: Colors.black,
              leading: Builder(
                builder: (context) => IconButton(
                  icon: Icon(Icons.apps),
                  onPressed: () {
                    logic.openDrawer(context);
                    print('!!');
                  },
                ),
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.refresh),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.share),
                  onPressed: () {
                    Share.share(
                        'https://play.google.com/store/apps/details?id=com.usatolebanese',
                        subject: 'شارك تطبيقنا مع اصاحبك !');
                  },
                ),
              ],
            ),
            body: ValueRoot()));
  }
}
