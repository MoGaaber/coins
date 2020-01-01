import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:usatolebanese/base/logic.dart';
import 'package:usatolebanese/globals/widgets/warning.dart';
import 'package:usatolebanese/pages/drawer/currency_value/table.dart';
import 'package:usatolebanese/pages/out/chart/root.dart';

class Value extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var logic = Provider.of<BaseLogic>(context);

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'Last updated in : ',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w300),
                ),
                Text(
                  '${formatDate(logic.model.lebanonQuery.documents[0]['Date'].toDate(), [
                    'dd',
                    '/',
                    mm,
                    '/',
                    yyyy,
                    ' - ',
                    h,
                    ':',
                    mm
                  ])}',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('Official price : ',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w300)),
              Text(
                '5454',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              )
            ],
          ),
        ),
        Divider(
          indent: 80,
          color: Colors.white,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Tabl(),
        ),
        Divider(
          endIndent: 80,
          color: Colors.white,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Warning(),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: ButtonTheme(
            textTheme: ButtonTextTheme.primary,
            height: 50,
            minWidth: 180,
            child: FlatButton.icon(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  side: BorderSide(color: Colors.white, width: 1)),
              color: Colors.black,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => ChartRoot()));
              },
              icon: Icon(FontAwesomeIcons.coins),
              label: Text('Previous days'),
            ),
          ),
        )
      ],
    );
  }
}
