import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';
import 'package:usatolebanese/base/drawer.dart';
import 'package:usatolebanese/base/logic.dart';
import 'package:usatolebanese/utility/localization/localization.dart';

class Base extends StatefulWidget {
  @override
  _BaseState createState() => _BaseState();
}

class _BaseState extends State<Base> {
  var localization;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    baseLogic = Provider.of<BaseLogic>(context, listen: false);
  }

  void showDialoggy(BuildContext context) {
    var localization = Localization.of(context).exit;
    var localizationButtons = Localization.of(context).dialogButtons;

    var buttons = [
      {
        'text': localizationButtons[0],
        'onPressed': () {
          exit(0);
        }
      },
      {
        'text': localizationButtons[1],
        'onPressed': () {
          baseLogic.shareApp();
        }
      }
    ];
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              localization,
              style: Theme.of(context)
                  .textTheme
                  .headline
                  .copyWith(color: Colors.black87),
            ),
            actions: buttons.map((element) {
              return FlatButton(
                  onPressed: element['onPressed'],
                  child: Text(element['text']));
            }).toList(),
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
          );
        });
  }

  List<Map> buttons;

  BaseLogic baseLogic;

  @override
  Widget build(BuildContext context) {
    var baseLogic = Provider.of<BaseLogic>(context, listen: false);

    return WillPopScope(
      onWillPop: () async {
        showDialoggy(context);
        return false;
      },
      child: SafeArea(
          child: Scaffold(
              floatingActionButton: FloatingActionButton(onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(
                          'Rate App now !',
                          style: Theme.of(context)
                              .textTheme
                              .headline
                              .copyWith(color: Colors.black87),
                        ),
                        actions: <Widget>[
                          FlatButton(
                            onPressed: () {},
                            child: Text('Let me rate it !!'),
                          ),
                          FlatButton(
                            onPressed: () {},
                            child: Text('Later'),
                          )
                        ],
                      );
                    });
              }),
              key: baseLogic.scaffoldKey,
              drawer: Draw(),
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(100 * baseLogic.aspectRatio),
                child: AppBar(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusDirectional.vertical(
                          bottom: Radius.circular(10))),
                  actions: <Widget>[
                    RotationTransition(
                      turns: baseLogic.rotationAnimation,
                      child: IconButton(
                          icon: Icon(Icons.refresh),
                          onPressed: () {
                            baseLogic.rotationController.forward(from: 0);
                            baseLogic.fetchData();
                          }),
                    ),
                    IconButton(
                        icon: AnimatedBuilder(
                          animation: baseLogic.colorController,
                          builder: (BuildContext context, Widget child) => Icon(
                            Icons.share,
                            color: baseLogic.colorAnimation.value,
                          ),
                        ),
                        onPressed: () {
                          baseLogic.colorController.forward().then((x) {
                            baseLogic.colorController.reverse().then((x) {
                              baseLogic.shareApp();
                            });
                          });
                        })
                  ],
                  title: Selector<BaseLogic, int>(
                    selector: (_, BaseLogic logic) => logic.index,
                    builder: (BuildContext context, int value, _) {
                      return Text(
                        Localization.of(context).drawer[value],
                        style: TextStyle(
                            fontSize: baseLogic.aspectRatio * 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      );
                    },
                  ),
                  centerTitle: false,
                  leading: Builder(
                    builder: (BuildContext context) => IconButton(
                      icon: Icon(
                        Icons.menu,
                        size: baseLogic.aspectRatio * 42.7555555556,
                      ),
                      onPressed: () {
                        baseLogic.openDrawer(context); ////
                      },
                    ),
                  ),
                ),
              ),
              body: Selector<BaseLogic, Tuple2<int, bool>>(
                selector: (_, BaseLogic baseLogic) {
                  return Tuple2(baseLogic.index, baseLogic.isLoading);
                },
                builder: (_, Tuple2 value, __) {
                  return value.item2
                      ? Center(child: CircularProgressIndicator())
                      : baseLogic.pages[value.item1];
                },
              ))),
    );
  }
}
