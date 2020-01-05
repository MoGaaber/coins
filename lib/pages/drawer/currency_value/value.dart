import 'package:admob_flutter/admob_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:usatolebanese/base/logic.dart';
import 'package:usatolebanese/globals/widgets/ad.dart';
import 'package:usatolebanese/globals/widgets/warning.dart';
import 'package:usatolebanese/pages/drawer/currency_value/table.dart';
import 'package:usatolebanese/pages/out/chart/root.dart';
import 'package:usatolebanese/utility/localization/localization.dart';

class CurrencyValue extends StatefulWidget {
  bool isLebanon;
  CurrencyValue({this.isLebanon});

  @override
  _CurrencyValueState createState() => _CurrencyValueState();
}

class _CurrencyValueState extends State<CurrencyValue> {
  GlobalKey _keyRed = GlobalKey();

  double getHeight() {
    final RenderBox renderBoxRed = _keyRed.currentContext?.findRenderObject();
    final height = renderBoxRed?.size?.height;
    return height;
  }

  @override
  Widget build(BuildContext context) {
    BaseLogic logic = Provider.of<BaseLogic>(context);
    var localization = Localization.of(context).coin;
    num aspectRatio = logic.aspectRatio;
    return DefaultTextStyle(
      style: TextStyle(color: Colors.white),
      child: StreamBuilder<DocumentSnapshot>(
        stream: this.widget.isLebanon
            ? Firestore.instance
                .collection('Pounds')
                .document('Lebanese')
                .snapshots()
            : Firestore.instance
                .collection('Pounds')
                .document('Syrian')
                .snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data.data;
            print(snapshot.data.data);
            logic.lastPrices = {
              'syriaLastPrice': data['buy']['to'],
              'lebanonLastPrice': data['buy']['to']
            };
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 33 * aspectRatio),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          '${localization[0]} : ',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 23 * aspectRatio,
                              fontWeight: FontWeight.w300),
                        ),
                        Text(
                          '${formatDate(snapshot.data.data['at'].toDate(), [
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
                          style: TextStyle(
                              fontSize: 23 * aspectRatio,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16 * aspectRatio),
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
                        '${snapshot.data.data['officialPrice']}',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 42 * aspectRatio),
                      )
                    ],
                  ),
                ),
                Divider(
                  height: aspectRatio * 8.3,
                  color: Color(0xff3E3E3E),
                ),
                Tabl(this.widget.isLebanon, snapshot.data),
                Divider(
                  height: aspectRatio * 8.3,
                  color: Color(0xff3E3E3E),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 50 * aspectRatio),
                  child: Warning(),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 34 * aspectRatio),
                  child: ButtonTheme(
                    textTheme: ButtonTextTheme.primary,
                    height: 66 * aspectRatio,
                    minWidth: 300 * aspectRatio,
                    child: FlatButton.icon(
                      color: Color(0xff1B191A),
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white, width: 1)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => ChartRoot(
                                    widget.isLebanon ? 'lebaness' : 'turkesh',
                                    localization.last,
                                    aspectRatio)));
                      },
                      icon: Icon(
                        FontAwesomeIcons.calendarAlt,
                        size: 28 * aspectRatio,
                      ),
                      label: Text(
                        localization.last,
                        style: TextStyle(fontSize: 25 * logic.aspectRatio),
                      ),
                    ),
                  ),
                ),
                Expanded(
                    key: _keyRed,
                    child: Ad(100 < 250
                        ? AdmobBannerSize.LARGE_BANNER
                        : AdmobBannerSize.MEDIUM_RECTANGLE))
                //  Expanded(child: Ad(AdmobBannerSize.LARGE_BANNER))
              ],
            );
          } else
            return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
