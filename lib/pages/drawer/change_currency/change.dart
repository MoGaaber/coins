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
import 'package:usatolebanese/pages/drawer/change_currency/Cardyy.dart';
import 'package:usatolebanese/pages/drawer/change_currency/logic.dart';
import 'package:usatolebanese/utility/localization/localization.dart';
import 'package:async/async.dart';

class Change extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var changeLogic = Provider.of<ChangeLogic>(context, listen: false);
    var localization = Localization.of(
      context,
    );
    return DefaultTextStyle(
      style: TextStyle(color: Colors.white),
      child: StreamBuilder<DocumentSnapshot>(
          stream: Firestore.instance
              .collection('Pounds')
              .document('Lebanese')
              .snapshots(),
          builder: (BuildContext context,
              AsyncSnapshot<DocumentSnapshot> lebanonSnapshot) {
            if (!lebanonSnapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            } else {
              return StreamBuilder<DocumentSnapshot>(
                stream: Firestore.instance
                    .collection('Pounds')
                    .document('Syrian')
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<DocumentSnapshot> syrianSnapshot) {
                  if (!syrianSnapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    changeLogic.currencyTypes = [
                      {'value': 1.0, 'name': changeLogic.localization[0]},
                      {
                        'value': lebanonSnapshot.data.data['buy']['to'],
                        'name': changeLogic.localization[1]
                      },
                      {
                        'value': syrianSnapshot.data.data['buy']['to'],
                        'name': changeLogic.localization[2]
                      },
                    ];

                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Carddy(
                          index: 0,
                        ),
                        Carddy(
                          index: 1,
                        ),
                        Expanded(
                            child: Selector<ChangeLogic, bool>(
                          selector: (BuildContext, ChangeLogic changeLogic) {
                            return changeLogic.keyboardVisibility;
                          },
                          builder:
                              (BuildContext context, bool value, Widget child) {
                            return Ad(value
                                ? AdmobBannerSize.BANNER
                                : AdmobBannerSize.MEDIUM_RECTANGLE);
                          },
                        ))
                      ],
                    );
                  }
                },
              );
            }
          }),
    );
  }

  var x = [
    ['1', '2', '3'],
    ['4', '5', '6'],
    ['7', '8', '9'],
    ['.', '0', 'd'],
  ];
}
