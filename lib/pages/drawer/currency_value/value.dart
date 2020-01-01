import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:usatolebanese/globals/widgets/warning.dart';

class Value extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: Future.wait([
        Firestore.instance
            .collection('lebaness')
            .reference()
            .orderBy('Date', descending: true)
            .limit(2)
            .getDocuments(),
        Firestore.instance.collection('coin').document('lebanon').get()
      ]).then((x) {
        return x;
      }),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting)
          return Text('!!');
        else {
          var documents = snapshot.data[0].documents;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Text(
                    'Last updated in ${formatDate(documents[0]['Date'].toDate(), [
                      'dd',
                      '/',
                      mm,
                      '/',
                      yyyy,
                      ' - ',
                      h,
                      ':',
                      mm
                    ])} ',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w200),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('Official price : ',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w300)),
                    Text(
                      snapshot.data[1].data['official'].toString(),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                    )
                  ],
                ),
              ),
              SizedBox.fromSize(
                  size: Size.fromHeight(200),
                  child: Row(
                    children: <Widget>[
                      Spacer(
                        flex: 1,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(''),
                          Text(
                            'From',
                            style: TextStyle(fontWeight: FontWeight.w400),
                          ),
                          Text(
                            'To',
                            style: TextStyle(fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Spacer(
                        flex: 3,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                'Buy',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 22),
                              ),
                              Icon(Icons.keyboard_arrow_up),
                            ],
                          ),
                          Text(documents.last.data['buy'].toString()),
                          Text(documents.first.data['buy'].toString())
                        ],
                      ),
                      Spacer(
                        flex: 3,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                'Sell',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 22),
                              ),
                              Icon(Icons.keyboard_arrow_down),
                            ],
                          ),
                          Text(documents.last.data['Sale'].toString()),
                          Text(documents.first.data['Sale'].toString())
                        ],
                      ),
                      Spacer(
                        flex: 2,
                      ),
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Warning(),
              ),
              ButtonTheme(
                textTheme: ButtonTextTheme.primary,
                height: 50,
                minWidth: 180,
                child: FlatButton.icon(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      side: BorderSide(color: Colors.white, width: 1)),
                  color: Colors.black,
                  onPressed: () {},
                  icon: Icon(FontAwesomeIcons.coins),
                  label: Text('Previous days'),
                ),
              )
            ],
          );
        }
      },
    );
    ;
  }
}
