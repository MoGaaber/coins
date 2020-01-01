import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:usatolebanese/base/logic.dart';
import 'package:usatolebanese/globals/widgets/warning.dart';
import 'package:usatolebanese/pages/drawer/currency_value/table.dart';
import 'package:usatolebanese/pages/out/chart/root.dart';
import 'package:usatolebanese/utility/localization/localization.dart';

class Value extends StatelessWidget {
  bool isLebanon;
  Value({this.isLebanon});

  @override
  Widget build(BuildContext context) {
    var logic = Provider.of<BaseLogic>(context);
    var localization = Localization.of(context).coin;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      color: Color(0xff1B191A),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    '${localization[0]} : ',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w300),
                  ),
                  Text(
                    '${formatDate(this.isLebanon ? logic.model.lebanonQuery.documents[0]['Date'].toDate() : logic.model.syrianQuery.documents[0]['Date'].toDate(), [
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
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text('${localization[1]} :  ',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w300)),
                Text(
                  '${isLebanon ? logic.model.lebanonOfficial.data['official'] : logic.model.syrianOfficial.data['official']}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                )
              ],
            ),
          ),
          Divider(
            height: 5,
            indent: 80,
            color: Colors.white,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Tabl(this.isLebanon),
          ),
          Divider(
            height: 5,
            endIndent: 80,
            color: Colors.white,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Warning(),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
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
                          builder: (BuildContext context) => ChartRoot(
                              this.isLebanon ? 'lebaness' : 'turkesh')));
                },
                icon: Icon(FontAwesomeIcons.coins),
                label: Text(localization.last),
              ),
            ),
          )
        ],
      ),
    );
  }
}
