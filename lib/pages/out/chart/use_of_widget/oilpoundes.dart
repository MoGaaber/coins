import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:usatolebanese/globals/logics/constants.dart';
import 'package:usatolebanese/globals/widgets/ad.dart';

class Oil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("اسعار المحروقات"),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[800],
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 190, top: 20),
            child: Text(
              "أكتان 95",
              textDirection: TextDirection.rtl,
              style: TextStyle(fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 120),
            child: Text(
              "20لتر  = 24,900  ل.ل ",
            ),
          ),
          Divider(
            height: 50,
            color: Colors.white.withOpacity(0.3),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 190, top: 20),
            child: Text(
              "أكتان 98",
              textDirection: TextDirection.rtl,
              style: TextStyle(fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 120),
            child: Text("20لتر  = 25,600  ل.ل "),
          ),
          Divider(
            height: 50,
            color: Colors.white.withOpacity(0.3),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 190, top: 20),
            child: Text("مازوت",
                textDirection: TextDirection.rtl,
                style: TextStyle(fontSize: 16)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 120),
            child: Text("20لتر  = 18,600  ل.ل "),
          ),
          Divider(
            height: 50,
            color: Colors.white.withOpacity(0.3),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 140, top: 20),
            child: Text("قارورة غاز10 كلغ",
                textDirection: TextDirection.rtl,
                style: TextStyle(fontSize: 16)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 120),
            child: Text("10كلغ  = 14,600  ل.ل "),
          ),
          Ad(AdmobBannerSize.FULL_BANNER, Constants.thirdAdCode),
          Ad(AdmobBannerSize.BANNER, Constants.firstAdCode),
        ],
      ),
    );
  }
}
