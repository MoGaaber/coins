import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:usatolebanese/pages/drawer/change_currency/change.dart';
import 'package:usatolebanese/pages/drawer/currency_value/value.dart';
import 'package:usatolebanese/pages/out/chart/use_of_widget/root.dart';
import 'package:usatolebanese/utility/localization/localization.dart';

class BaseLogic extends ChangeNotifier {
  InterstitialAd fullScreenAd;
  AnimationController controller;
  Animation<Offset> animation;
  AnimationController rotationController;
  Animation<double> rotationAnimation;
  AnimationController scaleController;
  Animation<double> scaleAnimation;

  AnimationController colorController;
  Animation<Color> colorAnimation;
  final FirebaseMessaging fireBaseMessaging = FirebaseMessaging();

  InterstitialAd createFullScreenAd() {
    return InterstitialAd(
      adUnitId: InterstitialAd.testAdUnitId,
    );
  }

  void showAd() {
    FirebaseAdMob.instance
        .initialize(appId: 'ca-app-pub-3118554882781656~3307182209')
        .then((x) {
      fullScreenAd = createFullScreenAd()
        ..load()
        ..show();
    });
  }

  int index = 0;
  Map<String, dynamic> data;
  var pages;
  bool isLoading = true;
  List<DocumentSnapshot> documents;
  void fetchData() {
    if (isLoading == false) isLoading = true;
    notifyListeners();
    Future.wait([
      Firestore.instance.collection('Pounds').document('Lebanese').get(),
      Firestore.instance.collection('Pounds').document('Syrian').get()
    ]).then((x) {
      documents = x;

      data = {
        'currencyTypes': List.generate(3, (index) {
          return {
            'name': localization[index],
            'value': index == 0 ? 1 : documents[index - 1].data['buy']['to']
          };
        }),
        'lebanonChart': [],
        'syrianChart': [],
      };

      isLoading = false;
      notifyListeners();
    });
  }

  int syrianPrice, lebanonPrice;
  var lastPrices = {};
  AnimationController animationController;

  List<String> localization;
  Widget icon(String x, Map<String, dynamic> data) {
    if (data[x]['to'] > data[x]['from']) {
      return Icon(
        Icons.keyboard_arrow_up,
        color: Colors.green,
      );
    } else {
      return Icon(
        Icons.keyboard_arrow_down,
        color: Colors.red,
      );
    }
  }

  int openApp;
  double screenWidth, screenHeight, aspectRatio;
  Size size;
  BuildContext context;
  Widget snackBar;
  void showSnackBar(int index) {
    ScaffoldState scaffoldState = scaffoldKey?.currentState as ScaffoldState;

    scaffoldState?.showSnackBar(SnackBar(
        duration: Duration(minutes: 1),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        behavior: SnackBarBehavior.fixed,
        action: SnackBarAction(
            label: 'Refresh',
            onPressed: () {
              fetchData();
            }),
        content: Text(
          'The prices is refreshed check the last update now by clicking on refresh button ',
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
        )));
  }

  void indexing(int index) {
    this.index = index;
    notifyListeners();
  }

  bool isLoadContext = false;
  var scaffoldKey = GlobalKey();
  BaseLogic(BuildContext context, TickerProvider tickerProvider) {
    this.context = context;
    isLoadContext = true;
    fireBaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
//        indexing(message['data']['index']);
//        int index = message['data']['index'];
//        print(message['data']);
//        print(message['data']['index']);
//        this.index = index;
//        notifyListeners();
//        message['data'].forEach((k, v) {
//          print(k);
//          if (k != 'index') {
//            documents[index].data[k]['to'] = documents[index].data[k]['from'];
//            documents[index].data[k]['to'] = v;
//          }
//        });
//
//        notifyListeners();
        showSnackBar(message['index']);
      },
    );

    pages = [CurrencyValue(), CurrencyValue(), Change(context)];

    fetchData();
    //showAd();
    size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;
    aspectRatio = size.aspectRatio;
    localization = Localization.of(context).currencyTypes;
    controller = AnimationController(
      vsync: tickerProvider,
      duration: Duration(milliseconds: 800),
    );
    animation = Tween<Offset>(begin: Offset(0, -0.15), end: Offset(0, 0.2))
        .animate(controller);
    rotationController = AnimationController(
      vsync: tickerProvider,
      duration: Duration(milliseconds: 800),
    );
    rotationAnimation =
        Tween<double>(begin: 0, end: 1).animate(rotationController);
    colorController = AnimationController(
      vsync: tickerProvider,
      duration: Duration(milliseconds: 200),
    );
    colorAnimation = ColorTween(begin: Colors.white, end: Colors.pinkAccent)
        .animate(colorController);
    scaleController = AnimationController(
      vsync: tickerProvider,
      duration: Duration(milliseconds: 1000),
    );

    controller.repeat(reverse: true);
    scaleAnimation = Tween<double>(begin: 1, end: 1.2).animate(
        CurvedAnimation(parent: scaleController, curve: Curves.easeInOutCirc));
    scaleController.repeat(reverse: true);
  }
  bool isShareReady = false;
  void initPref() async {
    var instance = await SharedPreferences.getInstance();
    int num = instance.getInt('openApp') ?? 0;

    instance.setInt('openApp', num += 1).then((x) {
      if (num % 7 == 0) {
        isShareReady = true;
      }
    });
  }

  var icons = [
    FontAwesomeIcons.coins,
    FontAwesomeIcons.coins,
    FontAwesomeIcons.exchangeAlt,
    FontAwesomeIcons.share,
    FontAwesomeIcons.star,
  ];

  void openDrawer(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }

  void navigateToPage(BuildContext context, int i) {
    Navigator.of(
      context,
    ).pop();
    index = i;
    notifyListeners();
  }

  void shareApp() {
    Share.share(
        'بين ال1500 و3000، الدولار عم يلعب ويلعبنا معه! إذا بدك تعرف سعر الدولار لحظة بلحظة ويوصلك تنبيه بتغير السعر بكل بساطة نزل هالتطبيق الأول من نوعه : https://play.google.com/store/apps/details?id=com.usatolebanese');
  }

  var collections = [
    'Lebanon Statics',
    'Syria Statics ',
  ];
  void navigateToChart() {
    Navigator.of(context).push(PageRouteBuilder(
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return ChartRoot(collections[index], aspectRatio);
      },
      transitionsBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) {
        return SlideTransition(
          position: new Tween<Offset>(
            begin: const Offset(0.0, 1.0),
            end: Offset.zero,
          ).animate(animation),
          child: new SlideTransition(
            position: new Tween<Offset>(
              begin: Offset.zero,
              end: const Offset(0.0, 1.0),
            ).animate(secondaryAnimation),
            child: child,
          ),
        );
      },
    ));
  }
}
