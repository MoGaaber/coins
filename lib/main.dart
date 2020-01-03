import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:usatolebanese/base/Base.dart';
import 'package:usatolebanese/base/root.dart';
import 'package:usatolebanese/pages/drawer/change_currency/root.dart';
import 'package:usatolebanese/pages/drawer/currency_value/root.dart';
import 'package:usatolebanese/utility/localization/delegate.dart';
import 'pages/out/chart/root.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:bezier_chart/bezier_chart.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:admob_flutter/admob_flutter.dart';

main() {
  runApp(Root());
}

const String testDevice = 'YOUR_DEVICE_ID';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    testDevices: testDevice != null ? <String>[testDevice] : null,
    keywords: <String>['foo', 'bar'],
    contentUrl: 'http://foo.com/bar.html',
    childDirected: true,
    nonPersonalizedAds: true,
  );

  BannerAd _bannerAd;
  InterstitialAd _interstitialAd;
  int _coins = 0;

  BannerAd createBannerAd() {
    return BannerAd(
      adUnitId: BannerAd.testAdUnitId,
      size: AdSize.mediumRectangle,
      listener: (MobileAdEvent event) {
        print("BannerAd event $event");
      },
    );
  }

  InterstitialAd createInterstitialAd() {
    return InterstitialAd(
      adUnitId: InterstitialAd.testAdUnitId,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        print("InterstitialAd event $event");
      },
    );
  }

  @override
  void initState() {
    super.initState();
    FirebaseAdMob.instance.initialize(appId: FirebaseAdMob.testAppId);
    _bannerAd = createBannerAd()..load();
    RewardedVideoAd.instance.listener =
        (RewardedVideoAdEvent event, {String rewardType, int rewardAmount}) {
      print("RewardedVideoAd event $event");
      if (event == RewardedVideoAdEvent.rewarded) {
        setState(() {
          _coins += rewardAmount;
        });
      }
    };
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    _interstitialAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('AdMob Plugin example app'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                RaisedButton(
                    child: const Text('SHOW BANNER'),
                    onPressed: () {
                      _bannerAd ??= createBannerAd();
                      _bannerAd
                        ..load()
                        ..show();
                    }),
                RaisedButton(
                    child: const Text('SHOW BANNER WITH OFFSET'),
                    onPressed: () {
                      _bannerAd ??= createBannerAd();
                      _bannerAd
                        ..load()
                        ..show(horizontalCenterOffset: -50, anchorOffset: 100);
                    }),
                RaisedButton(
                    child: const Text('REMOVE BANNER'),
                    onPressed: () {
                      _bannerAd?.dispose();
                      _bannerAd = null;
                    }),
                RaisedButton(
                  child: const Text('LOAD INTERSTITIAL'),
                  onPressed: () {
                    _interstitialAd?.dispose();
                    _interstitialAd = createInterstitialAd()..load();
                  },
                ),
                RaisedButton(
                  child: const Text('SHOW INTERSTITIAL'),
                  onPressed: () {
                    _interstitialAd?.show();
                  },
                ),
                RaisedButton(
                  child: const Text('LOAD REWARDED VIDEO'),
                  onPressed: () {
                    RewardedVideoAd.instance.load(
                        adUnitId: RewardedVideoAd.testAdUnitId,
                        targetingInfo: targetingInfo);
                  },
                ),
                RaisedButton(
                  child: const Text('SHOW REWARDED VIDEO'),
                  onPressed: () {
                    RewardedVideoAd.instance.show();
                  },
                ),
                Text("You have $_coins coins."),
              ].map((Widget button) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: button,
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}

class Root extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/1': (context) => ValueRoot(
              isLebanon: false,
            ),
        '/2': (context) => ChangeRoot()
      },
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
          scaffoldBackgroundColor: Color(0xff1B191A),
          primaryColor: Color(0xff242527),
          iconTheme: IconThemeData(color: Colors.white)),
      localizationsDelegates: [
        const LocalizationDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''),
        const Locale('ar', ''),
      ],
      home: BaseRoot(),
    );
  }
}

class X extends StatefulWidget {
  @override
  _XState createState() => _XState();
}

class _XState extends State<X> {
  @override
  Widget build(BuildContext context) {
    print('!!!!!');

    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder<DocumentSnapshot>(
        stream: Firestore.instance
            .collection('Pounds')
            .document('Lebanese')
            .snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasData) {
            print('!!!');
            return Center(
                child: Text(snapshot.data.data['buy']['from'].toString()));
          } else {
            return Center(child: Text('!!!'));
          }
        },
      ),
    );
  }
}
