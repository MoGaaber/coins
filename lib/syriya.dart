import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:usatolebanese/ads.dart';
import 'package:usatolebanese/app_localizations.dart';
import 'package:usatolebanese/globals/widgets/warning.dart';


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
      children: <Widget>[

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
              AppLocalizations.of(context).translate('first1_string'),
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Row(children: <Widget>[
            Text('بيع',style: TextStyle(fontSize: 30),),
            Icon(Icons.expand_less),
          ],),
          Row(children: <Widget>[
            Text('شراء',style: TextStyle(fontSize: 30),),
            Icon(Icons.expand_less),
          ],)
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
    ]
  );
}

Widget _drawLine() {
  return Container(
    height: 1,
    color: Colors.grey.shade200,
    margin: EdgeInsets.only(top: 8),
  );
}
