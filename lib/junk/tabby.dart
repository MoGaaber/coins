//import 'dart:math';
//
//import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
//import 'package:usatolebanese/base/logic.dart';
//
//class Tabby extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    var logic = Provider.of<BaseLogic>(context);
//
//    return Column(
//      mainAxisSize: MainAxisSize.min,
//      children: <Widget>[
//        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//          for (var i = 0; i < logic.tabsTitles.length; i++)
//            ButtonTheme(
//              buttonColor: Colors.red,
//              shape: logic.tabsTitles[i]['title'] == 'العمله السوريه'
//                  ? Border(
//                      right: BorderSide(color: Colors.white),
//                      left: BorderSide(color: Colors.white))
//                  : null,
//              materialTapTargetSize: MaterialTapTargetSize.padded,
//              height: 50,
//              child: FlatButton(
//                color: logic.tabsTitles[i]['selected']
//                    ? Colors.white
//                    : Colors.black,
//                onPressed: () {
//                  for (var element in logic.tabsTitles) {
//                    element['selected'] = false;
//                  }
//                  logic.tabsTitles[i]['selected'] = true;
//                  if (i == 0) {
//                    logic.xTranslate = 100;
//                  } else if (i == 1) {
//                    logic.xTranslate = 0;
//                  } else {
//                    logic.xTranslate = -100;
//                  }
//
//                  logic.notifyListeners();
//                },
//                child: Text(
//                  logic.tabsTitles[i]['title'].toString(),
//                  style: TextStyle(
//                      color: logic.tabsTitles[i]['selected']
//                          ? Colors.black
//                          : Colors.white),
//                ),
//              ),
//            )
//        ]),
//        Padding(
//          padding: const EdgeInsets.only(top: 20),
//          child: AnimatedContainer(
//            transform: Matrix4.translationValues(logic.xTranslate, 0, 0),
//            width: 10,
//            height: 10,
//            decoration:
//                BoxDecoration(color: Colors.yellow, shape: BoxShape.circle),
//            duration: Duration(milliseconds: 200),
//          ),
//        )
//      ],
//    );
//  }
//}
