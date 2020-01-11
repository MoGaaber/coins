import 'package:admob_flutter/admob_flutter.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';

class Ad extends StatelessWidget {
  AdmobBannerSize adMobBannerSize;
  String adCode;
  Ad(this.adMobBannerSize, this.adCode);
  @override
  Widget build(BuildContext context) {
    return AdmobBanner(
      adUnitId: BannerAd.testAdUnitId,
      adSize: adMobBannerSize,
    );
  }
}
