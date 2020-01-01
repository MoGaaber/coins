import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:usatolebanese/base/logic.dart';
import 'package:usatolebanese/utility/localization/localization.dart';

class Tabl extends StatelessWidget {
  bool isLebanon;
  Tabl(this.isLebanon);
  @override
  Widget build(BuildContext context) {
    var localization = Localization.of(context).globals;

    var logic = Provider.of<BaseLogic>(context);
    return SizedBox.fromSize(
        size: Size.fromHeight(140),
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
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                ),
                Text(
                  localization[1],
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
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
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                    ),
                    Icon(Icons.keyboard_arrow_up),
                  ],
                ),
                Text(
                  isLebanon
                      ? logic.model.lebanonQuery.documents.last.data['buy']
                          .toString()
                      : logic.model.syrianQuery.documents.last.data['buy']
                          .toString(),
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                ),
                Text(
                  isLebanon
                      ? logic.model.lebanonQuery.documents.first.data['buy']
                          .toString()
                      : logic.model.syrianQuery.documents.first.data['buy']
                          .toString(),
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
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
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                    ),
                    Icon(Icons.keyboard_arrow_down),
                  ],
                ),
                Text(
                  this.isLebanon
                      ? logic.model.lebanonQuery.documents.last.data['Sale']
                          .toString()
                      : logic.model.syrianQuery.documents.last.data['Sale']
                          .toString(),
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                ),
                Text(
                  this.isLebanon
                      ? logic.model.lebanonQuery.documents.first.data['Sale']
                          .toString()
                      : logic.model.syrianQuery.documents.first.data['Sale']
                          .toString(),
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
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
