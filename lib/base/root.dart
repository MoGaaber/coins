import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class BaseRoot extends StatefulWidget {
  @override
  _BaseRootState createState() => _BaseRootState();
}

class _BaseRootState extends State<BaseRoot> {
  var xTranslate = 1.0;
  var tabsTitles = [
    {'selected': false, 'title': 'العمله اللبنانيه', 'idx': 0},
    {'selected': false, 'title': 'العمله السوريه', 'idx': 1},
    {'selected': false, 'title': 'محول العملات', 'idx': 2}
  ];
  var coins = ['الدولار الامريكى', 'الليره اللبنانى', 'الليره السوري'];
  var controller = PageController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.black),
      home: SafeArea(
          child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: tabsTitles.map<ButtonTheme>((x) {
                          print(x);
                          return ButtonTheme(
                            buttonColor: Colors.red,
                            shape: x['title'] == 'العمله السوريه'
                                ? Border(
                                    right: BorderSide(color: Colors.white),
                                    left: BorderSide(color: Colors.white))
                                : null,
                            materialTapTargetSize: MaterialTapTargetSize.padded,
                            height: 50,
                            child: FlatButton(
                              color:
                                  x['selected'] ? Colors.white : Colors.black,
                              onPressed: () {
                                for (var x in tabsTitles) {
                                  x['selected'] = false;
                                }
                                if (x['idx'] == 2) {
                                  controller.animateToPage(0,
                                      duration: Duration(milliseconds: 200),
                                      curve: Curves.easeInOutExpo);
                                  xTranslate = -100;
                                } else if (x['idx'] == 1) {
                                  controller.animateToPage(1,
                                      duration: Duration(milliseconds: 200),
                                      curve: Curves.easeInOutExpo);

                                  xTranslate = 0;
                                } else {
                                  controller.animateToPage(2,
                                      duration: Duration(milliseconds: 200),
                                      curve: Curves.easeInOutExpo);

                                  xTranslate = 100;
                                }

                                x['selected'] = true;

                                setState(() {});
                              },
                              child: Text(
                                x['title'].toString(),
                                style: TextStyle(
                                    color: x['selected']
                                        ? Colors.black
                                        : Colors.white),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: AnimatedContainer(
                          transform:
                              Matrix4.translationValues(xTranslate, 0, 0),
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                              color: Colors.yellow, shape: BoxShape.circle),
                          duration: Duration(milliseconds: 200),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: PageView(
                    controller: controller,
                    children: <Widget>[
                      Container(
                        color: Colors.red,
                      ),
                      Container(
                        color: Colors.white,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 30.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Flexible(
                                    flex: 1,
                                    child: Icon(
                                      Icons.warning,
                                      color: Colors.white,
                                    )),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    'تنويه نحن مجرد ناقلين لسعر السوق والصرافين وليس لنا اى دور فى تحديد السعر  ',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10, top: 20),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                'التحويل من : ',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          Card(
                            margin: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 15),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 50),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 30),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          child: Image.network(
                                            'https://cdn2.bigcommerce.com/server5000/250c5/products/465/images/599/american-flag-14__00474.1498062105.1280.1280.jpg?c=2',
                                            width: 50,
                                            height: 30,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Text('الدولار'),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 140),
                                        child: PopupMenuButton(
                                          icon: Icon(Icons.arrow_drop_down),
                                          itemBuilder: (BuildContext context) =>
                                              coins
                                                  .map<PopupMenuItem>(
                                                      (element) =>
                                                          PopupMenuItem(
                                                            child:
                                                                Text(element),
                                                            value: element,
                                                          ))
                                                  .toList(),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 30),
                                    child: SizedBox(
                                        width: 200,
                                        height: 20,
                                        child: TextField(
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 1,
                                                    color: Colors.red,
                                                    style: BorderStyle.solid),
                                              ),
                                              hintText: 'اكتب هنا'),
                                        )),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}

class TabBarr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TabBar();
  }
}
