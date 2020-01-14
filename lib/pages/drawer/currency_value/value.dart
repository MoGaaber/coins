import 'package:admob_flutter/admob_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:usatolebanese/base/logic.dart';
import 'package:usatolebanese/globals/logics/constants.dart';
import 'package:usatolebanese/globals/widgets/ad.dart';
import 'package:usatolebanese/globals/widgets/warning.dart';
import 'package:usatolebanese/pages/drawer/currency_value/table.dart';
import 'package:usatolebanese/utility/localization/localization.dart';

class CurrencyValue extends StatefulWidget {
  @override
  _CurrencyValueState createState() => _CurrencyValueState();
}

class _CurrencyValueState extends State<CurrencyValue>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    BaseLogic logic = Provider.of<BaseLogic>(context, listen: false);
    var data = logic.documents[logic.index].data;
    var x = data['at'] as Timestamp;
    print(DateTime.fromMicrosecondsSinceEpoch(x.microsecondsSinceEpoch));
    var localization = Localization.of(context).coin;
    var textTheme = Theme.of(context).textTheme;
    num aspectRatio = logic.aspectRatio;
    double height = (MediaQuery.of(context).size.height);
    bool bigScreenSize = height >= 792;
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 25 * aspectRatio),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 33 * aspectRatio),
                  child: CustomPaint(
                    size: Size(0, 0),
                    painter: Circle(),
                  ),
                ),
                Text(
                  '${localization[0]}  :  ',
                  style: GoogleFonts.cairo(
                    textStyle: textTheme.headline,
                  ),
                ),
                Text(
                  '${formatDate(data['at'].toDate(), [
                    'dd',
                    '/',
                    mm,
                    '/',
                    yyyy,
                    ' - ',
                    h,
                    ':',
                    nn,
                    ' ',
                    am
                  ])}',
                  style: textTheme.body1,
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
                Text('${localization[1]}       :       ',
                    style: textTheme.headline),
                Text(
                  '${data['officialPrice']}',
                  style: textTheme.body2,
                )
              ],
            ),
          ),
          bigScreenSize
              ? Divider(
                  endIndent: 117 * aspectRatio,
                  indent: 117 * aspectRatio,
                  height: aspectRatio * 8.3,
                  color: Color(0xff3E3E3E),
                )
              : Container(),
          Tabl(data),
          Divider(
            height: aspectRatio * 8.3,
            color: Color(0xff3E3E3E),
          ),
          bigScreenSize ? Warning() : Container(),
          bigScreenSize
              ? Padding(
                  padding: EdgeInsets.symmetric(vertical: 34 * aspectRatio),
                  child: ButtonTheme(
                    textTheme: ButtonTextTheme.primary,
                    height: 80 * aspectRatio,
                    minWidth: 240 * aspectRatio,
                    child: FlatButton(
                      color: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          side: BorderSide(
                            color: Colors.white,
                            width: 1.5,
                          )),
                      onPressed: () {
                        logic.navigateToChart();
                      },
                      child: Text(
                        localization.last,
                        style: TextStyle(
                            wordSpacing: 0.8,
                            fontWeight: FontWeight.w700,
                            fontSize: 26 * logic.aspectRatio),
                      ),
                    ),
                  ),
                )
              : Container(),
          Expanded(
              child:
                  Ad(AdmobBannerSize.MEDIUM_RECTANGLE, Constants.firstAdCode))
        ],
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
