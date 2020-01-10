import 'package:admob_flutter/admob_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:usatolebanese/base/logic.dart';
import 'package:usatolebanese/globals/widgets/ad.dart';
import 'package:usatolebanese/globals/widgets/warning.dart';
import 'package:usatolebanese/pages/drawer/currency_value/table.dart';
import 'package:usatolebanese/pages/out/chart/root.dart';
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
    var localization = Localization.of(context).coin;
    var textTheme = Theme.of(context).textTheme;
    num aspectRatio = logic.aspectRatio;
    return DefaultTextStyle(
      style: TextStyle(color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Stack(
            overflow: Overflow.visible,
            alignment: Alignment.bottomRight,
            children: <Widget>[
              Positioned(
                bottom: -20,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: FloatingActionButton(
                      onPressed: () {
                        logic.navigateToChart();
                      },
                      child: Icon(
                        FontAwesomeIcons.chartLine,
                        size: 15,
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Column(
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
                              mm,
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
                    Divider(
                      indent: 60,
                      height: aspectRatio * 8.3,
                      color: Color(0xff3E3E3E),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Tabl(data),
          Divider(
            height: aspectRatio * 8.3,
            color: Color(0xff3E3E3E),
          ),
//          Padding(
//            padding: EdgeInsets.only(top: 50 * aspectRatio),
//            child: Warning(),
//          ),
//          Padding(
//            padding: EdgeInsets.symmetric(vertical: 34 * aspectRatio),
//            child: ButtonTheme(
//              textTheme: ButtonTextTheme.primary,
//              height: 80 * aspectRatio,
//              minWidth: 240 * aspectRatio,
//              child: FlatButton(
//                color: Colors.transparent,
//                shape: RoundedRectangleBorder(
//                    borderRadius: BorderRadius.all(Radius.circular(5)),
//                    side: BorderSide(
//                      color: Colors.white,
//                      width: 1.5,
//                    )),
//                onPressed: () {
//                  Navigator.push(
//                      context,
//                      MaterialPageRoute(
//                          builder: (BuildContext context) => ChartRoot(
//                              logic.index == 0 ? 'lebaness' : '',
//                              localization.last,
//                              aspectRatio)));
//                },
//                child: Text(
//                  localization.last,
//                  style: TextStyle(
//                      wordSpacing: 0.8,
//                      fontWeight: FontWeight.w700,
//                      fontSize: 26 * logic.aspectRatio),
//                ),
//              ),
//            ),
//          ),
          Expanded(child: Ad(AdmobBannerSize.MEDIUM_RECTANGLE))
          //  Expanded(child: Ad(AdmobBannerSize.LARGE_BANNER))
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
