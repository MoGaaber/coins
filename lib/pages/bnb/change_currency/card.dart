import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:usatolebanese/pages/bnb/change_currency/logic.dart';

class TheCard extends StatelessWidget {
  int index;
  TheCard({this.index});
  @override
  Widget build(BuildContext context) {
    var logic = Provider.of<ChangeLogic>(context);
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: Image.asset(
                      this.index == 0
                          ? logic.firstPicture
                          : logic.secondPicture,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text(
                  ChangeLogic.currencyTypes[index == 0
                      ? logic.selectedIndex1
                      : logic.selectedIndex2]['name'],
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 70),
                  child: PopupMenuButton(
                    onSelected: (x) {
                      if (index == 0) {
                        logic.selectedIndex1 = x;
                        logic.firstPicture = ChangeLogic.images[x];
                      } else {
                        logic.selectedIndex2 = x;
                        logic.secondPicture = ChangeLogic.images[x];
                      }
                      logic.notifyListeners();
                    },
                    icon: Icon(Icons.arrow_drop_down),
                    itemBuilder: (BuildContext context) =>
                        ChangeLogic.currencyTypes
                            .map<PopupMenuItem>((element) => PopupMenuItem(
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      element['name'],
                                      textDirection: TextDirection.rtl,
                                    ),
                                  ),
                                  value: element['value'],
                                ))
                            .toList(),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: this.index == 0
                  ? Center(
                      child: SizedBox(
                          width: 200,
                          height: 20,
                          child: TextField(
                            onChanged: (x) {
                              logic.priceToday = x;
                              logic.notifyListeners();
                            },
                            controller: logic.controller,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1,
                                      color: Colors.red,
                                      style: BorderStyle.solid),
                                ),
                                hintText: 'اكتب هنا'),
                          )),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: Text(
                        'السعر اليوم = ${logic.priceToday}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
