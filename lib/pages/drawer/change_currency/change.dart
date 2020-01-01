import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:usatolebanese/base/logic.dart';
import 'package:usatolebanese/pages/drawer/change_currency/first_card.dart';
import 'package:usatolebanese/pages/drawer/change_currency/logic.dart';

class Change extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var logic = Provider.of<BaseLogic>(context);
    var changeLogic = Provider.of<ChangeLogic>(context);
    return Container(
      color: Color(0xff1B191A),
      child: SingleChildScrollView(
        child: Stack(
          overflow: Overflow.visible,
          alignment: Alignment.topRight,
          children: <Widget>[
            Container(
              color: Colors.red,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Cardd(
                    isFirst: true,
                  ),
                  Cardd(
                    isFirst: false,
                  ),
                ],
              ),
            ),
            Positioned(
              top: 90,
              right: 10,
              child: FloatingActionButton(
                child: Icon(
                  Icons.repeat,
                  color: Colors.black,
                ),
                onPressed: () {
                  print(changeLogic.to);
                  changeLogic.result = changeLogic.convert(
                      double.parse(changeLogic.controller.text),
                      changeLogic.from,
                      changeLogic.to);
                  changeLogic.notifyListeners();
                },
                backgroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
