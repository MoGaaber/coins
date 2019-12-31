import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:usatolebanese/app_localizations.dart';


class Syriya extends StatefulWidget {
  @override
  _SyriyaState createState() => _SyriyaState();
}

class _SyriyaState extends State<Syriya> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance.collection("turkesh").snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return Text('loading data .. please Wait..');

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
    children: <Widget>[Padding(
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

      Padding(
        padding: const EdgeInsets.only(top: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                document["Official_price"].toString(),
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
            ),
            Text(AppLocalizations.of(context).translate('second1_string'),style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(  document["Date"].toString()+'اخر تحديث : '),
      ),

      Padding(
        padding: const EdgeInsets.only(top: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Card(
                margin: EdgeInsets.all(10),
                color: Colors.black12,

                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    document["buy"].toString(),
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Text(AppLocalizations.of(context).translate('second2_string'),
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
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
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            Text(AppLocalizations.of(context).translate('second3_string'),
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),


    ],
  );
}
