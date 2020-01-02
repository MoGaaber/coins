import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';
import 'package:usatolebanese/base/logic.dart';
import 'package:usatolebanese/pages/drawer/change_currency/logic.dart';
import 'package:usatolebanese/utility/localization/localization.dart';

class Cardd extends StatelessWidget {
  bool isFirst;
  Cardd({this.isFirst});
  @override
  Widget build(BuildContext context) {
    String x = 'mohamed';
    x = x.substring(0, x.length - 1);
    print(x);
    var changeLogic = Provider.of<ChangeLogic>(context, listen: false);
    var localization = Localization.of(
      context,
    );
    var logic = Provider.of<BaseLogic>(context, listen: false);
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 5,
        color: !isFirst ? Color(0xff403E3F) : Color(0xff1B191A),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Spacer(
                  flex: 1,
                ),
                Selector<ChangeLogic, Tuple2<String, String>>(
                  selector: (BuildContext, ChangeLogic changeLogic) =>
                      Tuple2(changeLogic.fromT, changeLogic.toT),
                  builder: (BuildContext context, Tuple2 value, Widget child) {
                    return Text(
                      this.isFirst
                          ? '${localization.globals[0]} ${value.item1}'
                          : '${localization.globals[1]} ${value.item2}',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    );
                  },
                ),
                Spacer(
                  flex: 1,
                ),
                PopupMenuButton(
                  icon: Icon(Icons.arrow_drop_down),
                  onSelected: (x) {
                    if (this.isFirst) {
                      changeLogic.from = x['value'];
                      changeLogic.fromT = x['name'];
                    } else {
                      changeLogic.to = x['value'];
                      changeLogic.toT = x['name'];
                    }

                    changeLogic.notifyListeners();
                  },
                  itemBuilder: (BuildContext context) =>
                      logic.currencyTypes.map((x) {
                    return PopupMenuItem(
                        value: x,
                        child: Center(
                          child: Text(
                            x['name'],
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                        ));
                  }).toList(),
                ),
                Spacer(
                  flex: 7,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 0,
              ),
              child: !isFirst
                  ? Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Selector<ChangeLogic, double>(
                        builder:
                            (BuildContext context, double value, Widget child) {
                          return Text(
                            '${value}',
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
                      width: 130,
                      height: 50,
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {},
                          child: TextField(
                            focusNode: changeLogic.focus,

                            onTap: () {
                              changeLogic.adVisibility = false;
                              changeLogic.notifyListeners();
                              print('1!!');
                            },
                            controller: changeLogic.controller,
                            showCursor: false,

                            enableInteractiveSelection: false,
                            readOnly: true,
                            //    focusNode: AlwaysDisabledFocusNode(),
                            style: TextStyle(color: Colors.white, fontSize: 20),
                            onChanged: (x) {},
                            keyboardType: TextInputType.numberWithOptions(),
                            decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                  color: Colors.white.withOpacity(1),
                                  width: 1,
                                )),
                                border: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 1,
                                )),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white.withOpacity(0.5),
                                        width: 1)),
                                labelStyle: TextStyle(color: Colors.white),
                                hintText: localization
                                    .globals[localization.globals.length - 1],
                                hintStyle: TextStyle(
                                    color: Colors.white, fontSize: 12)),
                          ),
                        ),
                      ),
                    ),
            ),
          ],
        ));
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
