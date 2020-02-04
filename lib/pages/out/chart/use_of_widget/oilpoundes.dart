import 'package:admob_flutter/admob_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:usatolebanese/base/logic.dart';
import 'package:usatolebanese/globals/logics/constants.dart';
import 'package:usatolebanese/globals/widgets/ad.dart';

class Oil extends StatefulWidget {
  @override
  _OilState createState() => _OilState();
}

class _OilState extends State<Oil> {
  @override
  Widget build(BuildContext context) {
//    BaseLogic logic = Provider.of<BaseLogic>(context, listen: false);
//
//    var data = logic.documents[logic.index].data;
    return Scaffold(
      appBar: AppBar(
        title: Text("اسعار المحروقات"),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[800],
      body: StreamBuilder<DocumentSnapshot>(
        stream: Firestore.instance
            .collection("products")
            .document('oil')
            .snapshots(),
        builder: (context, AsyncSnapshot <DocumentSnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Text("loading");
          } else {



            Map<String , dynamic > data = snapshot.data.data ;
            return Column(
              children: <Widget>[
                Card(
                  child: ListTile(
                    title: Text("اوكتان 95",textDirection: TextDirection.rtl,),
                    subtitle: Text(" عشرون لتر = "+'${data['ok95']}'+" ل.ل ",style: TextStyle(color: Colors.redAccent),textDirection: TextDirection.rtl,),
                    trailing: Icon(FontAwesomeIcons.gasPump,color: Colors.redAccent,)),
                ),
                Card(
                  child: ListTile(
                      title: Text("اوكتان 98",textDirection: TextDirection.rtl,),
                      subtitle: Text(" عشرون لتر = "+'${data['ok98']}'+" ل.ل ",style: TextStyle(color: Colors.redAccent),textDirection: TextDirection.rtl,),
                      trailing: Icon(FontAwesomeIcons.gasPump,color: Colors.redAccent,)),
                ),
                Card(
                  child: ListTile(
                      title: Text("مازوت",textDirection: TextDirection.rtl,),
                      subtitle: Text(" عشرون لتر = "+'${data['mazot']}'+" ل.ل ",style: TextStyle(color: Colors.redAccent),textDirection: TextDirection.rtl,),
                      trailing: Icon(FontAwesomeIcons.gasPump,color: Colors.redAccent,)),
                ),
                Card(
                  child: ListTile(
                      title: Text("قاروة غاز 10 كلغ",textDirection: TextDirection.rtl,),
                      subtitle: Text(" عشرون لتر = "+'${data['gas']}'+" ل.ل ",style: TextStyle(color: Colors.redAccent),textDirection: TextDirection.rtl,),
                      trailing: Icon(FontAwesomeIcons.fire,color: Colors.redAccent,)),
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
         //       Ad(AdmobBannerSize.LARGE_BANNER, Constants.thirdAdCode),
                Ad(AdmobBannerSize.LARGE_BANNER, Constants.firstAdCode),
         ]);
      //      );
            //  });
          }
        },
      ),
    );
  }
}
