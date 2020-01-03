import 'package:admob_flutter/admob_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:provider/provider.dart';
import 'package:usatolebanese/base/logic.dart';
import 'package:usatolebanese/base/root.dart';
import 'package:usatolebanese/globals/widgets/ad.dart';
import 'package:usatolebanese/model/lebanon.dart';
import 'package:usatolebanese/model/syria.dart';
import 'package:usatolebanese/pages/drawer/change_currency/first_card.dart';
import 'package:usatolebanese/pages/drawer/change_currency/logic.dart';
import 'package:usatolebanese/utility/localization/localization.dart';
import 'package:async/async.dart';

class Change extends StatefulWidget {
  @override
  _ChangeState createState() => _ChangeState();
}

class _ChangeState extends State<Change> {
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var changeLogic = Provider.of<ChangeLogic>(context, listen: true);
    var logic = Provider.of<BaseLogic>(context, listen: false);
    var streamLogic = Provider.of<Syria>(context, listen: false);
    var localization = Localization.of(
      context,
    );
    return StreamBuilder<DocumentSnapshot>(
        stream: Firestore.instance
            .collection('Pounds')
            .document('Lebanese')
            .snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<DocumentSnapshot> lebanonSnapshot) {
          if (!lebanonSnapshot.hasData) {
            return Text('!');
          } else {
            return StreamBuilder<DocumentSnapshot>(
              stream: Firestore.instance
                  .collection('Pounds')
                  .document('Syrian')
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<DocumentSnapshot> syrianSnapshot) {
                if (!syrianSnapshot.hasData) {
                  return Text('!!!');
                } else {
                  changeLogic.currencyTypes = [
                    {'value': 1.0, 'name': changeLogic.localization[0]},
                    {
                      'value': lebanonSnapshot.data.data['buy']['to'],
                      'name': changeLogic.localization[1]
                    },
                    {
                      'value': syrianSnapshot.data.data['sell']['to'],
                      'name': changeLogic.localization[2]
                    },
                  ];

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
                                index: 0,
                              ),
                              Cardd(
                                index: 1,
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Selector<ChangeLogic, bool>(
                              selector: (BuildContext, changeLogic) =>
                                  changeLogic.buttonEnabled,
                              builder: (BuildContext context, bool value,
                                  Widget child) {
                                return FloatingActionButton(
                                  child: Icon(
                                    Icons.repeat,
                                    color: Colors.black,
                                  ),
                                  onPressed: () {
                                    if (changeLogic
                                            .controller.text.isNotEmpty &&
                                        double.parse(
                                                changeLogic.controller.text) !=
                                            0) {
                                      changeLogic.result = changeLogic.convert(
                                          double.parse(
                                              changeLogic.controller.text),
                                          changeLogic.selectedValues[0]['value']
                                              .toDouble(),
                                          changeLogic.selectedValues[1]['value']
                                              .toDouble());
                                      changeLogic.adVisibility = true;
                                    } else {
                                      changeLogic.result = 0;
                                    }

                                    changeLogic.notifyListeners();
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
                          selector: (BuildContext, changeLogic) =>
                              changeLogic.adVisibility,
                          builder:
                              (BuildContext context, bool value, Widget child) {
                            return value && false
                                ? Ad(AdmobBannerSize.MEDIUM_RECTANGLE)
                                : Container(
                                    color: Color(0xff242527),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: x.map((element) {
                                        return Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: element.map((rowElement) {
                                            return SizedBox(
                                              height: 52,
                                              width: 52,
                                              child: FloatingActionButton(
                                                backgroundColor: Colors.white,
                                                onPressed: () {
                                                  if (rowElement == 'd') {
                                                    if (changeLogic.controller
                                                        .text.isNotEmpty)
                                                      changeLogic
                                                              .controller.text =
                                                          changeLogic
                                                              .controller.text
                                                              .substring(
                                                                  0,
                                                                  changeLogic
                                                                          .controller
                                                                          .text
                                                                          .length -
                                                                      1);
                                                  } else {
                                                    changeLogic.controller
                                                        .text += rowElement;
                                                  }
                                                },
                                                child: rowElement == 'd'
                                                    ? Icon(
                                                        FontAwesomeIcons
                                                            .backspace,
                                                        size: 16,
                                                        color: Colors.black,
                                                      )
                                                    : Text(
                                                        rowElement,
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 20),
                                                      ),
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
              },
            );
          }
        });
  }

  var x = [
    ['1', '2', '3'],
    ['4', '5', '6'],
    ['7', '8', '9'],
    ['.', '0', 'd'],
  ];
}
