import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:usatolebanese/base/logic.dart';
import 'package:usatolebanese/main.dart';
import 'package:usatolebanese/utility/localization/localization.dart';

class Draw extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var logic = Provider.of<BaseLogic>(context, listen: false);

    return SizedBox.fromSize(
      size: Size.fromWidth(230),
      child: Drawer(
        child: Container(
          color: Colors.black,
          child: Column(
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
//                image: DecorationImage(
//                    image: AssetImage('assets/images/logo.png'),
//                    fit: BoxFit.contain),
                  color: Color(0xff6F0702),
                ),
              ),
              for (int i = 0; i < logic.icons.length; i++)
                Column(
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        Localization.of(context).drawer[i],
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      leading: Icon(logic.icons[i], color: Colors.white),
                      onTap: () {
                        Navigator.pop(context);

                        logic.controller.animateToPage(i,
                            duration: Duration(milliseconds: 400),
                            curve: Curves.easeInOutExpo);
                        logic.index = i;
                        logic.notifyListeners();
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
      ),
    );
  }
}
