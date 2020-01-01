import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:usatolebanese/base/logic.dart';

class Tabl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var logic = Provider.of<BaseLogic>(context);
    return SizedBox.fromSize(
        size: Size.fromHeight(150),
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
                  'From',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                ),
                Text(
                  'To',
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
                      'Buy',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                    ),
                    Icon(Icons.keyboard_arrow_up),
                  ],
                ),
                Text(
                  logic.model.lebanonQuery.documents.last.data['buy']
                      .toString(),
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                ),
                Text(
                  logic.model.lebanonQuery.documents.first.data['buy']
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
                      'Sell',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                    ),
                    Icon(Icons.keyboard_arrow_down),
                  ],
                ),
                Text(
                  logic.model.lebanonQuery.documents.last.data['Sale']
                      .toString(),
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                ),
                Text(
                  logic.model.lebanonQuery.documents.first.data['Sale']
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
