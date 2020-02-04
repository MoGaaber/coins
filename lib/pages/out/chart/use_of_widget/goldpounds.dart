import 'package:admob_flutter/admob_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:usatolebanese/base/logic.dart';
import 'package:usatolebanese/globals/logics/constants.dart';
import 'package:usatolebanese/globals/widgets/ad.dart';

class Gold extends StatefulWidget {
  @override
  _GoldState createState() => _GoldState();
}

class _GoldState extends State<Gold> {
  @override
  Widget build(BuildContext context) {
//    BaseLogic logic = Provider.of<BaseLogic>(context, listen: false);
//
//    var data = logic.documents[logic.index].data;
    return Scaffold(
      appBar: AppBar(
        title: Text("اسعار الذهب"),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[800],
      body: StreamBuilder<DocumentSnapshot>(
        stream: Firestore.instance
            .collection("products")
            .document('gold')
            .snapshots(),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Text("loading");
          } else {
            Map<String, dynamic> data = snapshot.data.data;
            return Column(children: <Widget>[
              Card(
                child: ListTile(
                    title: Text(
                      "كيلو الذهب",
                      textDirection: TextDirection.rtl,
                    ),
                    subtitle: Text(
                       '${data['kilogold']}' + " \$ ",
                      style: TextStyle(color: Colors.redAccent),
                      textDirection: TextDirection.rtl,
                    ),
                    ),
              ),
              Card(
                child: ListTile(
                    title: Text(
                      "أونصة الذهب",
                      textDirection: TextDirection.rtl,
                    ),
                    subtitle: Text(
                       '${data['onsagold']}' + " \$ ",
                      style: TextStyle(color: Colors.redAccent),
                      textDirection: TextDirection.rtl,
                    ),
                    ),
              ),
              Card(
                child: ListTile(
                    title: Text(
                      "ليرة الذهب",
                      textDirection: TextDirection.rtl,
                    ),
                    subtitle: Text(
                        '${data['liragold']}' + " \$ ",
                      style: TextStyle(color: Colors.redAccent),
                      textDirection: TextDirection.rtl,
                    ),
                   ),
              ),
              Card(
                child: ListTile(
                    title: Text(
                      "غرام عيار 21",
                      textDirection: TextDirection.rtl,
                    ),
                    subtitle: Text(
                       '${data['gram21']}' + " \$ ",
                      style: TextStyle(color: Colors.redAccent),
                      textDirection: TextDirection.rtl,
                    ),
                   ),
              ),
              Card(
                child: ListTile(
                  title: Text(
                    "غرام عيار 18",
                    textDirection: TextDirection.rtl,
                  ),
                  subtitle: Text(
                       '${data['gram18']}' + " \$ ",
                    style: TextStyle(color: Colors.redAccent),
                    textDirection: TextDirection.rtl,
                  ),
                ),
              ),

////          Text(
////            '${formatDate(data['at'].toDate(), [
////              'dd',
////              '/',
////              mm,
////              '/',
////              yyyy,
////              ' - ',
////              h,
////              ':',
////              nn,
////              ' ',
////              am
////            ])}',
////            style: textTheme.body1,
////          ),
              Ad(AdmobBannerSize.LARGE_BANNER, Constants.thirdAdCode),
//              //  Ad(AdmobBannerSize.LARGE_BANNER, Constants.firstAdCode),
            ]);
            //      );
            //  });
          }
        },
      ),
    );
  }
}
