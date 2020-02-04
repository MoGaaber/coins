import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/scheduler.dart';
import 'package:usatolebanese/globals/logics/constants.dart';
import 'package:usatolebanese/globals/widgets/ad.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
/*
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = ScrollController();
  OverlayEntry sticky;
  GlobalKey stickyKey = GlobalKey();

  @override
  void initState() {
    if (sticky != null) {
      sticky.remove();
    }
    sticky = OverlayEntry(
      opaque: false,
      // lambda created to help working with hot-reload
      builder: (context) => stickyBuilder(context),
    );

    // not possible inside initState
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Overlay.of(context).insert(sticky);
    });
    super.initState();
  }

  @override
  void dispose() {
    // remove possible overlays on dispose as they would be visible even after [Navigator.push]
    sticky.remove();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
          body: Stack(children: <Widget>[
        FractionallySizedBox(
            // heightFactor: 0.4,
            widthFactor: 1,
            child: Material(
                color: Colors.blueGrey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  textDirection: TextDirection.rtl,
                  children: <Widget>[
                    Ad(AdmobBannerSize.FULL_BANNER, Constants.thirdAdCode),
                    Padding(
                      key: stickyKey,
                      padding: EdgeInsets.only(right: 3, left: 3, bottom: 40),
                      child: Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            'ايه الكلامايه الكلامايه الكلامايه الكلامايه الكلامايه الكلامايه الكلامالكلام..............',
                            textDirection: TextDirection.rtl,
                            style: TextStyle(fontSize: 25),
                          )),
                    )
                  ],
                )))
      ])),
    );
  }

  Widget stickyBuilder(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, Widget child) {
        final keyContext = stickyKey.currentContext;
        if (keyContext != null) {
          // widget is visible
          final box = keyContext.findRenderObject() as RenderBox;
          final pos = box.localToGlobal(Offset.zero);
          print(box.size.height);
          return Positioned(
            height: 300,
            width: MediaQuery.of(context).size.width / 1.1,
            top: 220,
            child: Material(
              child: Container(
                alignment: Alignment.center,
                color: Colors.black,
                child: const Text("^ Nah I think you're okay.........."),
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}


*/
class Pagedetails extends StatefulWidget {
  String collection;
  Pagedetails({this.collection});

  @override
  _PagedetailsState createState() => _PagedetailsState();
}

class _PagedetailsState extends State<Pagedetails> {
 GlobalKey key = GlobalKey();



  @override
  Widget build(BuildContext context) {
    double aspectRatio = MediaQuery.of(context).size.aspectRatio;
  //  final box = keyContext.findRenderObject() as RenderBox;
   // final pos = box.localToGlobal(Offset.zero);

    return SafeArea(
      child: Scaffold(

          backgroundColor: Colors.white,
          body: Card(
            color: Colors.blueGrey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                textDirection: TextDirection.rtl,
                children: <Widget>[
                  Ad(AdmobBannerSize.FULL_BANNER, Constants.thirdAdCode),
                  Padding(
                    key: key,
                    padding: EdgeInsets.only(right: 3, left: 3, bottom: 40),
                    child: Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
widget.collection,
                          textDirection: TextDirection.rtl,
                          style: TextStyle(fontSize: 25),
                        )),
                  ),
                ],

              ),
            ),
          ),
          appBar: AppBar(
            backgroundColor: Colors.blueGrey,
            elevation: 0,
            centerTitle: true,
            title: Text("تفاصيل"),
          )),
    );
  }
}
