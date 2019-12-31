import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:share/share.dart';
import 'package:admob_flutter/admob_flutter.dart';
import 'app_localizations.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class Lebaness extends StatefulWidget {
  @override
  _LebanessState createState() => _LebanessState();
}

class _LebanessState extends State<Lebaness> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(AppLocalizations.of(context).translate('first3_string'),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.black45,
              ),
            ),
            ListTile(
              title: Text(AppLocalizations.of(context).translate('first4_string'),

              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute<Null>(builder: (BuildContext context) {
                      return WebviewScaffold(
                        url:
                        "https://play.google.com/store/apps/details?id=quotesmix.com.quotes_mix",
                      );
                    }));
              },
              trailing: Icon(Icons.star),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              title: Text( AppLocalizations.of(context).translate('first5_string'),
              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute<Null>(builder: (BuildContext context) {
                      return WebviewScaffold(
                        url: "https://www.facebook.com/abdullah.almasry.562",
                      );
                    }));
              },
              trailing: Icon(Icons.alternate_email),
            ),
            ListTile(
              title: Text(AppLocalizations.of(context).translate('first6_string'),
              ),
              onTap: () {
                Share.share(
                    'https://play.google.com/store/apps/details?id=com.usatolebanese',
                    subject: 'شارك تطبيقنا مع اصاحبك !');
              },
              trailing: Icon(Icons.alternate_email),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Text('USA to Lebanese Pound-سعر الدولار والليره اللبنانيه'),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () => exit(0),
            tooltip: 'Close app',
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance.collection("lebaness").snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return Text('loading data .. please Wait..');
            var x = Timestamp(1577663280, 0);
            print(x.toDate());
            //  print(DateTime.fromMicrosecondsSinceEpoch(x.seconds));

            return ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) =>
                  _buildListItem(context, snapshot.data.documents[index]),
            );
          }),
    );
  }
}

Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
  return Column(
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(top: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                document["Official_price"].toString(),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),

              ),
            ),
            Text(
              AppLocalizations.of(context).translate('first1_string'),
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),

            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text((document["Date"].toDate()).toString() + 'اخر تحديث : ',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),

      ),
      Padding(
        padding: const EdgeInsets.only(top: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                document["buy"].toString(),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),

              ),
            ),
            Text(
              AppLocalizations.of(context).translate('first2_string'),
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),

            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                document["Sale"].toString(),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),


              ),
            ),
            Text(
              AppLocalizations.of(context).translate('first7_string'),
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),

            ),
          ],
        ),
      ),

      Padding(
        padding:
            const EdgeInsets.only(top: 20, bottom: 10, right: 10, left: 10),
        child: Container(
          margin: EdgeInsets.only(top: 1),
          child: AdmobBanner(
            adUnitId: "ca-app-pub-3940256099942544/6300978111",
            adSize: AdmobBannerSize.BANNER,
            listener: (AdmobAdEvent event, Map<String, dynamic> args) {
              switch (event) {
                case AdmobAdEvent.loaded:
                  print('Admob banner loaded!');
                  break;

                case AdmobAdEvent.opened:
                  print('Admob banner opened!');
                  break;

                case AdmobAdEvent.closed:
                  print('Admob banner closed!');
                  break;

                case AdmobAdEvent.failedToLoad:
                  print(
                      'Admob banner failed to load. Error code: ${args['errorCode']}');
                  break;
                case AdmobAdEvent.clicked:
                  // TODO: Handle this case.
                  break;
                case AdmobAdEvent.impression:
                  // TODO: Handle this case.
                  break;
                case AdmobAdEvent.leftApplication:
                  // TODO: Handle this case.
                  break;
                case AdmobAdEvent.completed:
                  // TODO: Handle this case.
                  break;
                case AdmobAdEvent.rewarded:
                  // TODO: Handle this case.
                  break;
                case AdmobAdEvent.started:
                  // TODO: Handle this case.
                  break;
              }
            },
          ),
        ),
      ),
    ],
  );
}
