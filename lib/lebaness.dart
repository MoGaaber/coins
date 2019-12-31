import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:share/share.dart';
import 'package:admob_flutter/admob_flutter.dart';
import 'package:usatolebanese/ads.dart';
import 'package:usatolebanese/changhmoney.dart';
import 'package:usatolebanese/globals/widgets/warning.dart';
import 'package:usatolebanese/syriya.dart';
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
        child: Text(
          (document["Date"].toDate()).toString() + 'اخر تحديث : ',
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
              child: Card(
                color: Colors.black26,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    document["Official_price"].toString(),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Text(
              '!',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                'بيع',
                style: TextStyle(fontSize: 30),
              ),
              Icon(Icons.expand_less),
            ],
          ),
          Row(
            children: <Widget>[
              Text(
                'شراء',
                style: TextStyle(fontSize: 30),
              ),
              Icon(Icons.expand_less),
            ],
          )
        ],
      ),
      Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: Colors.black26,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    document["buy"].toString(),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: Colors.black26,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    document["Sale"].toString(),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                color: Colors.black26,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    document["buy"].toString(),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                color: Colors.black26,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    document["Sale"].toString(),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      Warning(),
      Ads(),
    ],
  );
}
