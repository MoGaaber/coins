import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Lebaness extends StatefulWidget {
  @override
  _LebanessState createState() => _LebanessState();
}

class _LebanessState extends State<Lebaness> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance.collection("coin").snapshots(),
          builder: (context, snapshot) {

            switch(snapshot.connectionState){
              case ConnectionState.waiting :{
return  Text('loading data .. please Wait..');
              }
              break;
              case ConnectionState.done:{


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
            );}
    break;
  },deafult :
          }),
    );
  }
}

