import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:usatolebanese/pages/drawer/change_currency/change.dart';
import 'package:usatolebanese/pages/drawer/currency_value/value.dart';
import 'package:usatolebanese/utility/localization/localization.dart';

class BaseLogic extends ChangeNotifier {
  InterstitialAd fullScreenAd;
  AnimationController controller;
  Animation<Offset> animation;
  AnimationController rotationController;
  Animation<double> rotationAnimation;
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
      currencyTypes = List.generate(3, (index) {
        return {
          'name': localization[index],
          'value': index == 0 ? 1 : documents[index - 1].data['buy']['to']
        };
      });
      isLoading = false;
      notifyListeners();
    });
  }

  List<Map> currencyTypes;
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
  void showSnackBar() {
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

  var scaffoldKey = GlobalKey();
  BaseLogic(BuildContext context, TickerProvider tickerProvider) {
    this.context = context;
    fireBaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        showSnackBar();
      },
    );

    pages = [CurrencyValue(), CurrencyValue(), Change(context)];
    Stream.value(MediaQuery.of(context).viewInsets.bottom).listen((x) {
      print(x.toString() + '!!!!!!');
    });
    KeyboardVisibilityNotification().addNewListener(onChange: (x) {
      print(x);
    });

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

    controller.repeat(reverse: true);
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
}
