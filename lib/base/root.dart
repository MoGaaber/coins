import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class BaseRoot extends StatefulWidget {
  @override
  _BaseRootState createState() => _BaseRootState();
}

class _BaseRootState extends State<BaseRoot> {
  var tabsTitles = ['العمله اللبنانيه', 'العمله السوريه', 'محول العملات'];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.white),
      home: SafeArea(
          child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: tabsTitles
                      .map((x) => ButtonTheme(
                            shape: RoundedRectangleBorder(
                                side: BorderSide(),
                                borderRadius: x == 'العمله السوريه'
                                    ? BorderRadius.zero
                                    : x == 'محول العملات'
                                        ? BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            bottomLeft: Radius.circular(10))
                                        : BorderRadius.only(
                                            topRight: Radius.circular(10),
                                            bottomRight: Radius.circular(10))),
                            buttonColor: Colors.white,
                            height: 50,
                            child: FlatButton(
                              onPressed: () {},
                              child: Text(x),
                            ),
                          ))
                      .toList(),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10)),
                  child: ButtonBar(
                    buttonPadding: EdgeInsets.zero,
                    children: tabsTitles
                        .map((x) => ButtonTheme(,
                              buttonColor: Colors.red,
                              height: 50,
                              child: FlatButton(
                                onPressed: () {},
                                child: Text(x),
                              ),
                            ))
                        .toList(),
                  ),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}

class TabBarr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TabBar();
  }
}
