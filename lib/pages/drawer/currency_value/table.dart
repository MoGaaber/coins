import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:usatolebanese/base/logic.dart';
import 'package:usatolebanese/utility/localization/localization.dart';

class Tabl extends StatelessWidget {
  bool isLebanon;
  DocumentSnapshot snapshot;
  Tabl(this.isLebanon, this.snapshot);
  @override
  Widget build(BuildContext context) {
    var localization = Localization.of(context).globals;
    var baseLogic = Provider.of<BaseLogic>(context, listen: false);

    var logic = Provider.of<BaseLogic>(context);
    return SizedBox.fromSize(
        size: Size.fromHeight(baseLogic.aspectRatio * 233),
        child: Row(
          children: <Widget>[
            Spacer(
              flex: 1,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(''),
                Text(
                  localization[0],
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                ),
                Text(
                  localization[1],
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                ),
              ],
            ),
            Spacer(
              flex: 3,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      localization[2],
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                    ),
                    logic.icon('buy', snapshot)
                  ],
                ),
                Text(
                  snapshot.data['buy']['from'].toString(),
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                Text(
                  snapshot.data['buy']['to'].toString(),
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                )
              ],
            ),
            Spacer(
              flex: 3,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      localization[3],
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                    ),
                    logic.icon('sell', this.snapshot)
                  ],
                ),
                Text(
                  snapshot.data['sell']['from'].toString(),
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                Text(
                  snapshot.data['sell']['to'].toString(),
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                )
              ],
            ),
            Spacer(
              flex: 2,
            ),
          ],
        ));
  }
}
