import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:share/share.dart';

import 'app_localizations.dart';

class Lebaness extends StatefulWidget {
  @override
  _LebanessState createState() => _LebanessState();
}

class _LebanessState extends State<Lebaness> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance.collection("lebaness").snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return Text('loading data .. please Wait..');
          var x =   Timestamp(1577663280,0);
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
              ),
            ),
            Text(AppLocalizations.of(context).translate('first_string'),),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text( ( document["Date"].toDate() ).toString()+'اخر تحديث : '),
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
              ),
            ),
            Text(AppLocalizations.of(context).translate('second_string'),
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
              ),
            ),
            Text(':الصرافين -بيع'),
          ],
        ),
      ),

      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          RaisedButton(
            onPressed: (){
              Share.share('https://play.google.com/store/apps/details?id=com.king.candycrushsaga&hl=en', subject: 'شارك تطبيقنا مع اصاحبك !');

            },
            child: Text('مشاركه التطبيق', style: TextStyle(fontSize: 20)),
          ),
          RaisedButton(
            color: Colors.green,
            onPressed: null,
            child: Text('Disabled Button', style: TextStyle(fontSize: 20)),
          ),
        ],
      ),
    ],
  );
}
