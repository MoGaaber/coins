import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Turkesh extends StatefulWidget {
  @override
  _TurkeshState createState() => _TurkeshState();
}

class _TurkeshState extends State<Turkesh> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
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
            Text(': السعر الرسمي'),
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
              padding: const EdgeInsets.all(8.0),
              child: Text(
                document["buy"].toString(),
              ),
            ),
            Text(':الصرافين -شراء'),
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
            onPressed: null,
            child: Text('Disabled Button', style: TextStyle(fontSize: 20)),
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
