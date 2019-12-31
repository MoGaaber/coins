import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:usatolebanese/app_localizations.dart';
import 'package:usatolebanese/base/bnb.dart';
import 'package:usatolebanese/base/logic.dart';
import 'package:usatolebanese/changhmoney.dart';
import 'package:usatolebanese/junk/tabby.dart';
import 'package:usatolebanese/lebaness.dart';
import 'package:usatolebanese/pages/bnb/change_currency/root.dart';
import 'package:usatolebanese/syriya.dart';

class Base extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var logic = Provider.of<BaseLogic>(context);
    //print(MediaQuery.of(context).size.width);
    return SafeArea(

        child: Scaffold(
          drawer: _drawer(),
          appBar: AppBar(title: Text('العملة اللبنانية'),
            centerTitle: true,
            backgroundColor: Colors.black,
            leading: IconButton(
              icon: Icon(Icons.filter_list),
              onPressed: (){},
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.refresh),
                onPressed: ()=>_drawer,
              ),
              IconButton(
                icon: Icon(Icons.share),
                onPressed: ()  {
                  Share.share(
                      'https://play.google.com/store/apps/details?id=com.usatolebanese',
                      subject: 'شارك تطبيقنا مع اصاحبك !');
                },
              ),

            ],

          ),      body: PageView(
        controller: logic.controller,
        children: <Widget>[
          Lebaness(),
          Syriya(),
          Changhmoney()
        ],
      ),
      bottomNavigationBar: Bnb(),
    ));
  }
}
class _drawer extends StatelessWidget {
  const _drawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.black,
        child: ListView(

          children: <Widget>[
            DrawerHeader(

              decoration: BoxDecoration(
//                image:DecorationImage(
//                  image: NetworkImage(''),
//                ),
                color: Colors.red,
              ),
            ),
            ListTile(
              title: Text( AppLocalizations.of(context).translate('for1_string'),style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white),
              ),
              leading: Icon(Icons.repeat,color: Colors.white),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Changhmoney()));
              },
            ),
            ListTile(
              title: Text(AppLocalizations.of(context).translate('for2_string'),style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white),),
              leading: Icon(Icons.monetization_on,color: Colors.white,),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Syriya()));
              },
            ),
            ListTile(
              title: Text(AppLocalizations.of(context).translate('for3_string'),style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white),),
              leading: Icon(Icons.monetization_on,color: Colors.white),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Lebaness()));
              },
            ),
            _drawLine(),
            ListTile(
              title: Text(
                AppLocalizations.of(context).translate('first4_string'),style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white),

              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute<Null>(builder: (BuildContext context) {
                      return WebviewScaffold(
                        url:
                        "https://play.google.com/store/apps/details?id=com.usatolebanese",
                      );
                    }));
              },
              leading: Icon(Icons.star,color: Colors.white),
            ),
            SizedBox(
              width: double.infinity,
              height: 2,
            ),
            ListTile(
              title: Text(
                AppLocalizations.of(context).translate('first5_string'),style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white),
              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute<Null>(builder: (BuildContext context) {
                      return WebviewScaffold(
                        url: "https://www.facebook.com/abdullah.almasry.562",
                      );
                    }));
              },
              leading: Icon(Icons.alternate_email,color: Colors.white),
            ),
            ListTile(
              title: Text(
                AppLocalizations.of(context).translate('first6_string'),style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white),
              ),
              onTap: () {
                Share.share(
                    'https://play.google.com/store/apps/details?id=com.usatolebanese',
                    subject: 'شارك تطبيقنا مع اصاحبك !');
              },
              leading: Icon(Icons.share,color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}

Widget _drawLine() {
  return Container(
    height: 1,
    color: Colors.grey.shade200,
    margin: EdgeInsets.only(top: 8),
  );
}
