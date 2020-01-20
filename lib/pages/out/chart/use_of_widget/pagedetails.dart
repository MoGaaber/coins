import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:usatolebanese/globals/logics/constants.dart';
import 'package:usatolebanese/globals/widgets/ad.dart';

class Pagedetails extends StatefulWidget {
  String collection;
  Pagedetails({this.collection});
  @override
  _PagedetailsState createState() => _PagedetailsState();
}

class _PagedetailsState extends State<Pagedetails> {
  List<DocumentSnapshot> list;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
//               Container(
//                width:
//                MediaQuery.of(context).size.width,
//                height: 150,
//                child: Image.network(
//                  widget.collection,
//
//                  fit: BoxFit.fill,
//                ),
//              ),


              Card(
                  child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          widget.collection,
                          style: TextStyle(
                              fontFamily: 'BalooBhaijaan',
                              fontSize: 16,
                              height: 2,
                              color: Colors.black),
                        ),
                      ))),
              Expanded(
                  child: Ad(AdmobBannerSize.MEDIUM_RECTANGLE,
                      Constants.firstAdCode)),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text("تفاصيل"),
        ));
  }
}
