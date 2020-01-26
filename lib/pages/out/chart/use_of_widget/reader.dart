import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:usatolebanese/pages/out/chart/use_of_widget/pagedetails.dart';


class Reader extends StatefulWidget {
  @override
  _ReaderState createState() => _ReaderState();
}

class _ReaderState extends State<Reader> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("أخبار الاقتصاد"),
      centerTitle: true,
      ),
      body: StreamBuilder(
          stream: Firestore.instance.collection("post").snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Text("loading");
            } else {
              return Card(
                child: ListView.builder(
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot mypost = snapshot.data.documents[index];
                      return Stack(
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 300,
                            child: Padding(
                              padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                              child: Material(
                                color: Colors.white,
                                elevation: 14,
                                shadowColor: Color(0Xbb219bF3),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: Column(

                                      children: <Widget>[
                                        InkWell(
                                          onTap: (){
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => Pagedetails( collection: mypost['Pagedetails'],))
                                          );

                                          },
                                          child: Container(
                                            width:
                                            MediaQuery.of(context).size.width,
                                            height: 150,
                                            child: Image.network(
                                              "${mypost["image"]}",
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "${mypost["title"]}",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "${mypost["subtitle"]}",
                                          style: TextStyle(

                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blueGrey),
                                        ),




                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          //                          Column(
                          //                            children: <Widget>[
                          //                               FlatButton(
                          //                                 onPressed: _rateApp,
                          //                                 child: Image.network(
                          //                                  "${mypost["image"]}",
                          //                                  fit: BoxFit.fill,
                          //                              ),
                          //                               ),
                          //
                          //
                          //                            ],
                          //
                          //
                          //
                          //                          ),
                        ],
                      );
                    }),
              );
            }
          }),
    );

  }
}
