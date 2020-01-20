import 'package:admob_flutter/admob_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:usatolebanese/base/logic.dart';
import 'package:usatolebanese/globals/logics/constants.dart';
import 'package:usatolebanese/globals/widgets/ad.dart';
import 'package:usatolebanese/globals/widgets/warning.dart';
import 'package:usatolebanese/pages/drawer/currency_value/table.dart';
import 'package:usatolebanese/utility/localization/localization.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

class CurrencyValue extends StatefulWidget {
  @override
  _CurrencyValueState createState() => _CurrencyValueState();
}

class _CurrencyValueState extends State<CurrencyValue>
    with TickerProviderStateMixin {
//
//  List<String> listdata =List();
//
//  CarouselSlider instance;
//
//  get data => data;
//
//  @override
//  void initState() {
//    listdata.add("${data["image"]}");
//    listdata.add("${data["image1"]}");
//    listdata.add("${data["image"]}");
//    listdata.add("${data["image1"]}");
//    listdata.add("${data["image"]}");
//
//
//    super.initState();
//  }

  int _current = 0;
//  List imgList = [
//    'https://images.unsplash.com/photo-1502117859338-fd9daa518a9a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
//    'https://images.unsplash.com/photo-1554321586-92083ba0a115?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
//    'https://images.unsplash.com/photo-1536679545597-c2e5e1946495?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
//    'https://images.unsplash.com/photo-1543922596-b3bbaba80649?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
//    'https://images.unsplash.com/photo-1502943693086-33b5b1cfdf2f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=668&q=80'
//  ];

  @override
  Widget build(BuildContext context) {
    BaseLogic logic = Provider.of<BaseLogic>(context, listen: false);
    var data = logic.documents[logic.index].data;
//List xy  = data['images'] as List <String >;

    var x = data['at'] as Timestamp;
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
            padding: EdgeInsets.symmetric(vertical: 15 * aspectRatio),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text('${localization[1]}       :       ',
                    style: textTheme.headline),
                Text(
                  '${data['officialPrice']}',
                  style: textTheme.body2,
                ),
              ],
            ),
          ),
          Divider(
            height: aspectRatio * 8.3,
            color: Color(0xff3E3E3E),
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
            height: aspectRatio * 8.8,
            color: Color(0xff3E3E3E),
          ),
          Warning(),
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
          Padding(
            padding:  EdgeInsets.symmetric(vertical: 2*aspectRatio),
            child: CarouselSlider(
                scrollPhysics: BouncingScrollPhysics(),
                enableInfiniteScroll: true,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                pauseAutoPlayOnTouch: Duration(seconds: 10),
                height: 250.0,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
                items: [
                  for (int i = 0; i < data['images'].length; i++)
                    Builder(
                      builder: (BuildContext context) {
                        return InkWell(
                          onTap: () async {
//                          final flutterWebviewPlugin = new FlutterWebviewPlugin();
//
//                          flutterWebviewPlugin.launch('https://www.facebook.com/', hidden: true);
await launch(data['images'][i]['webSite']);



                          },
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Image.network(
                              data['images'][i]['image'],
                              loadingBuilder: (_, Widget child,
                                  ImageChunkEvent loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Center(
                                    child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes
                                      : null,
                                ));
                              },
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    )
                ]),
          )

//          Expanded(
//            child: FlatButton(
//              onPressed: (){},
//              color: Colors.white,
//              child: Image.network(
//                "${data["image"]}",
//                fit: BoxFit.fill,
//              width: 300,
//                height: 300,
//
//              ),
//            ),
//            //  child:
//           //       Ad(AdmobBannerSize.MEDIUM_RECTANGLE, Constants.thirdAdCode),
//          )
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
