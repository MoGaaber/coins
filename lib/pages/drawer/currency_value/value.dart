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
import 'package:usatolebanese/model/lebanon.dart';
import 'package:usatolebanese/model/syria.dart';
import 'package:usatolebanese/pages/drawer/currency_value/table.dart';
import 'package:usatolebanese/pages/out/chart/root.dart';
import 'package:usatolebanese/utility/localization/localization.dart';
import 'package:firebase_admob/firebase_admob.dart';

class Value extends StatelessWidget {
  bool isLebanon;
  Value({this.isLebanon});
  BannerAd createBannerAd() {
    return BannerAd(
      adUnitId: 'ca-app-pub-3118554882781656/5044318592',
      size: AdSize.banner,
      listener: (MobileAdEvent event) {
        print("BannerAd event $event");
      },
    );
  }

  InterstitialAd createInterstitialAd() {
    return InterstitialAd(
      adUnitId: InterstitialAd.testAdUnitId,
      listener: (MobileAdEvent event) {
        print("InterstitialAd event $event");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var logic = Provider.of<BaseLogic>(context);
    var localization = Localization.of(context).coin;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var syrianStream = Provider.of<Syria>(context, listen: false);
    var lebanonStream = Provider.of<Lebanon>(context, listen: false);
    return StreamBuilder<DocumentSnapshot>(
      stream: this.isLebanon
          ? lebanonStream.documentSnapshot
          : syrianStream.documentSnapshot,
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        '${localization[0]} : ',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
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
                            fontSize: 14, fontWeight: FontWeight.w700),
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
                      '${snapshot.data.data['officialPrice']}',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 25),
                    )
                  ],
                ),
              ),
              Divider(
                height: 5,
                color: Color(0xff3E3E3E),
              ),
              Tabl(this.isLebanon, snapshot.data),
              Divider(
                height: 5,
                color: Color(0xff3E3E3E),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Warning(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: ButtonTheme(
                  textTheme: ButtonTextTheme.primary,
                  height: 40,
                  minWidth: 100,
                  child: FlatButton.icon(
                    color: Color(0xff1B191A),
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.white, width: 1)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => ChartRoot(
                                  this.isLebanon ? 'lebaness' : 'turkesh',
                                  localization.last)));
                    },
                    icon: Icon(
                      FontAwesomeIcons.calendarAlt,
                      size: 17,
                    ),
                    label: Text(localization.last),
                  ),
                ),
              ),
              //  Expanded(child: Ad(AdmobBannerSize.LARGE_BANNER))
            ],
          );
        } else
          return Text('Loading');
      },
    );
  }
}
