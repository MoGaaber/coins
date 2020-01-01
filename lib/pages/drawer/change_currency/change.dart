import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:usatolebanese/base/logic.dart';
import 'package:usatolebanese/pages/drawer/change_currency/logic.dart';

class Change extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var logic = Provider.of<BaseLogic>(context);
    var changeLogic = Provider.of<ChangeLogic>(context);
    return Column();

//    return ListView(
//      //  crossAxisAlignment: CrossAxisAlignment.start,
//      children: <Widget>[
//        Align(
//          alignment: Alignment.center,
//          child: Text(
//            'value is ${changeLogic.value.toString()}',
//            style: TextStyle(color: Colors.white, fontSize: 30),
//          ),
//        ),
//        Padding(
//          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//          child: AnimatedOpacity(
//            duration: Duration(milliseconds: 300),
//            opacity:
//                changeLogic.from == null || changeLogic.to == null ? 0.0 : 1.0,
//            child: TextField(
//              enabled: changeLogic.from == null || changeLogic.to == null
//                  ? false
//                  : true,
//              controller: changeLogic.controller,
//              onChanged: (x) {
//                print(x);
//                changeLogic.value = (changeLogic.convert(
//                    double.parse(x), changeLogic.from, changeLogic.to));
//                changeLogic.notifyListeners();
//              },
//              keyboardType: TextInputType.number,
//              decoration: InputDecoration(
//                  focusedBorder: OutlineInputBorder(
//                      borderRadius: BorderRadius.all(Radius.circular(10))),
//                  disabledBorder: OutlineInputBorder(
//                      borderRadius: BorderRadius.all(Radius.circular(10))),
//                  enabledBorder: OutlineInputBorder(
//                      borderRadius: BorderRadius.all(Radius.circular(10))),
//                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
//                  hintText: 'Write here',
//                  prefixIcon: Icon(FontAwesomeIcons.coins),
//                  filled: true,
//                  fillColor: Colors.white),
//            ),
//          ),
//        ),
//
//        Padding(
//          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//          child: Card(
//            color: Colors.white38,
//            child: Padding(
//              padding: const EdgeInsets.all(8.0),
//              child: Row(
//                mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                children: <Widget>[
//                  Text(
//                    'From ${changeLogic.fromT}',
//                    style: TextStyle(
//                        fontSize: 20,
//                        fontWeight: FontWeight.bold,
//                        color: Colors.white),
//                  ),
//                  PopupMenuButton(
//                    onSelected: (x) {
//                      changeLogic.from = x['value'];
//                      changeLogic.fromT = x['name'];
//                      changeLogic.notifyListeners();
//                    },
//                    itemBuilder: (BuildContext context) =>
//                        logic.currencyTypes.map((x) {
//                      return PopupMenuItem(value: x, child: Text(x['name']));
//                    }).toList(),
//                  )
//                ],
//              ),
//            ),
//          ),
//        ),
//        Padding(
//          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
//          child: Card(
//            color: Colors.white38,
//            child: Padding(
//              padding: const EdgeInsets.all(8.0),
//              child: Row(
//                mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                children: <Widget>[
//                  Text(
//                    'To ${changeLogic.toT} ',
//                    style: TextStyle(
//                        fontSize: 20,
//                        fontWeight: FontWeight.bold,
//                        color: Colors.white),
//                  ),
//                  PopupMenuButton(
//                    onSelected: (x) {
//                      changeLogic.to = x['value'];
//                      changeLogic.toT = x['name'];
//                      changeLogic.notifyListeners();
//                    },
//                    itemBuilder: (BuildContext context) =>
//                        logic.currencyTypes.map((x) {
//                      return PopupMenuItem(value: x, child: Text(x['name']));
//                    }).toList(),
//                  )
//                ],
//              ),
//            ),
//          ),
//        ),
//
//        // Ads(),
//      ],
//    );
  }
}
