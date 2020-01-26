import 'package:admob_flutter/admob_flutter.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:usatolebanese/globals/logics/constants.dart';
import 'package:usatolebanese/globals/widgets/ad.dart';

class Gold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("اسعار الذهب"),
      centerTitle: true,),
      backgroundColor: Colors.grey[800],
      body: Column(

        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 190,top: 20),
            child: Text("سعر جنيه الذهب",textDirection: TextDirection.rtl,),

          ),
          Padding(
            padding: const EdgeInsets.only(left: 120),
            child: Text("ليره واحده  = 355  دولار امريكي "),

          ),
          Divider(
            height: 50,
            color: Colors.white.withOpacity(0.3),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 190,top: 20),
            child: Text("سعر قونصة الذهب",textDirection: TextDirection.rtl,),

          ),
          Padding(
            padding: const EdgeInsets.only(left: 120),
            child: Text("قونصة  واحده  = 355  دولار امريكي "),

          ),
          Divider(
            height: 50,
            color: Colors.white.withOpacity(0.3),
          ),
//          Text(
//            '${formatDate(data['at'].toDate(), [
//              'dd',
//              '/',
//              mm,
//              '/',
//              yyyy,
//              ' - ',
//              h,
//              ':',
//              nn,
//              ' ',
//              am
//            ])}',
//            style: textTheme.body1,
//          ),
          Ad(AdmobBannerSize.FULL_BANNER, Constants.thirdAdCode),
          Ad(AdmobBannerSize.BANNER, Constants.firstAdCode),


        ],
      ),

    );
  }
}
