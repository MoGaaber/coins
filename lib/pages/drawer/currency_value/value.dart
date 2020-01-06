import 'package:admob_flutter/admob_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: CustomPaint(
                          size: Size(0, 0),
                          painter: Circle(),
                        ),
                      ),
                      Text(
                        '${localization[0]}  :  ',
                        style: TextStyle(
                            fontSize: 22 * aspectRatio,
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
                          mm,
                          ' ',
                          am
                        ])}',
                        style: TextStyle(
                            fontSize: 23 * aspectRatio,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20 * aspectRatio),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text('${localization[1]} :  ',
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.9),
                              fontSize: 22 * aspectRatio,
                              fontWeight: FontWeight.w300)),
                      Text(
                        '${snapshot.data.data['officialPrice']}',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 36 * aspectRatio),
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
                    height: 60 * aspectRatio,
                    minWidth: 250 * aspectRatio,
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
                        style: TextStyle(fontSize: 22 * logic.aspectRatio),
                      ),
                    ),
                  ),
                ),
                Expanded(
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

class Circle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    // set the color property of the paint
    paint.color = Colors.green;

    // center of the canvas is (x,y) => (width/2, height/2)
    var center = Offset(size.width / 2, size.height / 2);

    // draw the circle on centre of canvas having radius 75.0
    canvas.drawCircle(center, 4, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
