import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';
import 'package:usatolebanese/base/logic.dart';
import 'package:usatolebanese/pages/drawer/change_currency/logic.dart';
import 'package:usatolebanese/utility/localization/localization.dart';

class Carddy extends StatelessWidget {
  int index;
  Carddy({this.index});
  @override
  Widget build(BuildContext context) {
    var changeLogic = Provider.of<ChangeLogic>(context, listen: false);
    var baseLogic = Provider.of<BaseLogic>(context, listen: false);

    var localization = Localization.of(
      context,
    );
    return Container(
        height: MediaQuery.of(context).size.height / 4.8,
        color: index == 1 ? Color(0xff403E3F) : Color(0xff1B191A),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Selector<ChangeLogic, Tuple2<Map, Map>>(
                  selector: (BuildContext build, ChangeLogic changeLogic) =>
                      Tuple2(changeLogic.selectedValues[0],
                          changeLogic.selectedValues[1]),
                  builder: (BuildContext context, Tuple2<Map, Map> value,
                      Widget child) {
                    return Text(
                      '${localization.globals[index]}  ${this.index == 0 ? value.item1['name'] : value.item2['name']}',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    );
                  },
                ),
                PopupMenuButton(
                  icon: Icon(
                    Icons.arrow_drop_down,
                    size: 25,
                  ),
                  onSelected: (x) {
                    print(x);
                    changeLogic.selectedValues[this.index] = x;
                    changeLogic.notifyListeners();
                  },
                  itemBuilder: (BuildContext context) =>
                      changeLogic.currencyTypes.map((x) {
                    return PopupMenuItem(
                        value: x,
                        child: Center(
                          child: Text(
                            x['name'],
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                        ));
                  }).toList(),
                ),
              ],
            ),
            index == 1
                ? Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Selector<ChangeLogic, double>(
                      builder:
                          (BuildContext context, double value, Widget child) {
                        return Text(
                          '$value',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        );
                      },
                      selector: (BuildContext, ChangeLogic changeLogic) {
                        return changeLogic.result;
                      },
                    ),
                  )
                : SizedBox(
                    width: baseLogic.aspectRatio * 217,
                    height: baseLogic.aspectRatio * 83,
                    child: TextField(
                      onChanged: (x) {
                        changeLogic.onChanged(x);
                      },
                      controller: changeLogic.controller,
                      enableInteractiveSelection: false,
                      //    focusNode: AlwaysDisabledFocusNode(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 33 * baseLogic.aspectRatio),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.white,
                            width: 1,
                          )),
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.white,
                            width: 1,
                          )),
                          enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1)),
                          labelStyle: TextStyle(color: Colors.white),
                          hintText: localization
                              .globals[localization.globals.length - 1],
                          hintStyle:
                              TextStyle(color: Colors.white, fontSize: 12)),
                    ),
                  ),
          ],
        ));
  }
}
