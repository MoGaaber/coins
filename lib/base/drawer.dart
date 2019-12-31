import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:usatolebanese/app_localizations.dart';
import 'package:usatolebanese/base/logic.dart';
import 'package:usatolebanese/changhmoney.dart';
import 'package:usatolebanese/main.dart';

class Draw extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var logic = Provider.of<BaseLogic>(context);

    return Drawer(
      child: Container(
        color: Colors.black,
        child: Column(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
//                image:DecorationImage(
//                  image: NetworkImage(''),
//                ),
                color: Color(0xff6F0702),
              ),
            ),
            for (int i = 0; i < logic.icons.length; i++)
              Column(
                children: <Widget>[
                  ListTile(
                    title: Text(
                      DemoLocalizations.of(context).drawer[i],
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    leading: Icon(logic.icons[i], color: Colors.white),
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                  ),
                  i == 2
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Divider(
                              color: Colors.white,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Support us',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            )
                          ],
                        )
                      : Container()
                ],
              ),
          ],
        ),
      ),
    );
  }
}
