import 'package:admob_flutter/admob_flutter.dart';
import 'package:bezier_chart/bezier_chart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';
import 'package:usatolebanese/base/Base.dart';
import 'package:usatolebanese/base/card.dart';
import 'package:usatolebanese/base/logic.dart';
import 'package:usatolebanese/base/notifier.dart';
import 'package:usatolebanese/globals/widgets/ad.dart';
import 'package:usatolebanese/model/lebanon.dart';
import 'package:usatolebanese/model/syria.dart';
import 'package:usatolebanese/pages/drawer/change_currency/logic.dart';
import 'package:usatolebanese/utility/localization/localization.dart';
import 'package:async/async.dart';

class Hello extends StatelessWidget {
  String xy = ' ';
  @override
  Widget build(BuildContext context) {
    Notifier notifier = Provider.of<Notifier>(context, listen: false);
    var localization = Localization.of(
      context,
    );
    var x = [
      ['1', '2', '3'],
      ['4', '5', '6'],
      ['7', '8', '9'],
      ['.', '0', 'd'],
    ];

    return StreamBuilder<DocumentSnapshot>(
      stream: Firestore.instance
          .collection('Pounds')
          .document('Lebanese')
          .snapshots(),
      builder: (BuildContext context,
          AsyncSnapshot<DocumentSnapshot> lebanonSnapshot) {
        if (!lebanonSnapshot.hasData) {
          return Text('!');
        }

        return StreamBuilder<DocumentSnapshot>(
          stream: Firestore.instance
              .collection('Pounds')
              .document('Syrian')
              .snapshots(),
          builder: (BuildContext context,
              AsyncSnapshot<DocumentSnapshot> syrianSnapshot) {
            if (!lebanonSnapshot.hasData) {
              print('hello');
              return Text('!!!');
            } else {
              return Column(
                children: <Widget>[
                  Stack(
                    alignment: localization.locale.languageCode == 'ar'
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Cardd(
                            isFirst: true,
                          ),
                          Cardd(
                            isFirst: false,
                          ),
                        ],
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: FloatingActionButton(
                            child: Icon(
                              Icons.repeat,
                              color: Colors.black,
                            ),
                            onPressed: () {},
                            backgroundColor: Colors.white,
                          )),
                    ],
                  ),
                  Expanded(
                      child: Container(
                          color: Color(0xff242527),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: x.map((element) {
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: element.map((rowElement) {
                                  return FloatingActionButton(
                                    backgroundColor: Colors.indigo,
                                    onPressed: () {},
                                    child: rowElement == 'd'
                                        ? Icon(
                                            FontAwesomeIcons.backspace,
                                            size: 16,
                                          )
                                        : Text(
                                            rowElement,
                                            style: TextStyle(fontSize: 20),
                                          ),
                                  );
                                }).toList(),
                              );
                            }).toList(),
                          )))
                ],
              );
            }
          },
        );
      },
    );
  }
}

class BaseRoot extends StatefulWidget {
  @override
  _BaseRootState createState() => _BaseRootState();
}

class _BaseRootState extends State<BaseRoot> {
  @override
  Widget build(BuildContext cx) {
    return MultiProvider(
      child: Base(),
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) => BaseLogic(cx)),
        ChangeNotifierProvider(
            create: (BuildContext context) => ChangeLogic(cx)),
        Provider(
          create: (BuildContext context) {
            return Syria(Firestore.instance
                .collection('Pounds')
                .document('Syrian')
                .snapshots());
          },
        ),
        Provider(
          create: (BuildContext context) {
            return Lebanon(Firestore.instance
                .collection('Pounds')
                .document('Lebanese')
                .snapshots());
          },
        ),
        ListenableProxyProvider2<Lebanon, Syria, Notifier>(
          update: (BuildContext context, Lebanon value, Syria value2,
              Notifier previous) {
            return Notifier(
                context, value.documentSnapshot, value2.documentSnapshot);
          },
        ),
      ],
    );
  }
}

class X {}

class Test extends ChangeNotifier {}
