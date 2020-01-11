import 'package:admob_flutter/admob_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:provider/provider.dart';
import 'package:usatolebanese/base/logic.dart';
import 'package:usatolebanese/globals/logics/constants.dart';
import 'package:usatolebanese/globals/widgets/ad.dart';
import 'package:usatolebanese/pages/drawer/change_currency/Cardyy.dart';
import 'package:usatolebanese/pages/drawer/change_currency/logic.dart';

class Change extends StatelessWidget {
  BuildContext context;
  Change(this.context);
  @override
  Widget build(BuildContext context) {
    var changeLogic = Provider.of<ChangeLogic>(context, listen: false);

    double x = MediaQuery.of(changeLogic.context).viewInsets.bottom;
    Stream.value(x).listen(
      (x) {
        print(x);
      },
    );

    return DefaultTextStyle(
        style: TextStyle(color: Colors.white),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Carddy(
              index: 0,
            ),
            Carddy(
              index: 1,
            ),
            Selector<ChangeLogic, bool>(
              selector: (_, ChangeLogic changeLogic) {
                return changeLogic.keyboardVisibility;
              },
              builder: (BuildContext context, bool value, Widget child) {
                return MediaQuery.of(changeLogic.context).viewInsets.bottom != 0
                    ? Container(
                        height: 50,
                        width: 50,
                        color: Colors.red,
                      )
                    : Expanded(
                        child: Ad(AdmobBannerSize.MEDIUM_RECTANGLE,
                            Constants.firstAdCode),
                      );
              },
            )
          ],
        ));
  }
}
