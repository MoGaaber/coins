import 'package:admob_flutter/admob_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:provider/provider.dart';
import 'package:usatolebanese/base/logic.dart';
import 'package:usatolebanese/globals/widgets/ad.dart';
import 'package:usatolebanese/pages/drawer/change_currency/first_card.dart';
import 'package:usatolebanese/pages/drawer/change_currency/logic.dart';
import 'package:usatolebanese/utility/localization/localization.dart';

class Change extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var changeLogic = Provider.of<ChangeLogic>(context, listen: false);
    var logic = Provider.of<BaseLogic>(context, listen: false);
    var streamLogic = Provider.of<DocumentSnapshot>(context, listen: true);
    print(streamLogic.data);
    var localization = Localization.of(
      context,
    );

    return Column(
      children: <Widget>[
        Stack(
          alignment: localization.locale.languageCode == 'ar'
              ? Alignment.centerLeft
              : Alignment.centerRight,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Cardd(
                  isFirst: true,
                ),
                Cardd(
                  isFirst: false,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Selector<ChangeLogic, bool>(
                selector: (BuildContext, changeLogic) =>
                    changeLogic.buttonEnabled,
                builder: (BuildContext context, bool value, Widget child) {
                  return FloatingActionButton(
                    child: Icon(
                      Icons.repeat,
                      color: Colors.black,
                    ),
                    onPressed: () {
//                      if (changeLogic.controller.text.isNotEmpty) {
//                        changeLogic.result = changeLogic.convert(
//                            double.parse(changeLogic.controller.text),
//                            changeLogic.from,
//                            changeLogic.to);
//                        changeLogic.adVisibility = true;
//                      } else {
//                        changeLogic.result = 0;
//                      }
//
//                      changeLogic.notifyListeners();

                      //print(logic.lastPrices);
                      print(streamLogic.data);
                    },
                    backgroundColor: Colors.white,
                  );
                },
              ),
            ),
          ],
        ),
        Expanded(
          child: Selector<ChangeLogic, bool>(
            selector: (BuildContext, changeLogic) => changeLogic.adVisibility,
            builder: (BuildContext context, bool value, Widget child) {
              return value
                  ? Ad(AdmobBannerSize.MEDIUM_RECTANGLE)
                  : Container(
                      color: Color(0xff242527),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: x.map((element) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: element.map((rowElement) {
                              return FloatingActionButton(
                                backgroundColor: Colors.indigo,
                                onPressed: () {
                                  if (rowElement == 'd') {
                                    if (changeLogic.controller.text.isNotEmpty)
                                      changeLogic.controller.text =
                                          changeLogic.controller.text.substring(
                                              0,
                                              changeLogic
                                                      .controller.text.length -
                                                  1);
                                  } else {
                                    changeLogic.controller.text += rowElement;
                                  }
                                },
                                child: rowElement == 'd'
                                    ? Icon(
                                        FontAwesomeIcons.backspace,
                                        size: 16,
                                      )
                                    : Text(
                                        rowElement,
                                        style: TextStyle(fontSize: 20),
                                      ),
                              );
                            }).toList(),
                          );
                        }).toList(),
                      ),
                    );
            },
          ),
        )
      ],
    );
  }

  var x = [
    ['1', '2', '3'],
    ['4', '5', '6'],
    ['7', '8', '9'],
    ['.', '0', 'd'],
  ];
}
