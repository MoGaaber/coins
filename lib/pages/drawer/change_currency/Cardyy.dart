import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';
import 'package:usatolebanese/base/logic.dart';
import 'package:usatolebanese/pages/drawer/change_currency/logic.dart';
import 'package:usatolebanese/utility/localization/localization.dart';

class Carddy extends StatelessWidget {
  String x = 'الدولار الأميركي';
  int index;
  Carddy({this.index});
  @override
  Widget build(BuildContext context) {
    var changeLogic = Provider.of<ChangeLogic>(context, listen: false);
    var baseLogic = Provider.of<BaseLogic>(context, listen: false);
    var textTheme = Theme.of(context).textTheme;
    var localization = Localization.of(
      context,
    );
    print(x.split(' ')[0].substring(2, x.split(' ')[0].length));
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
          decoration: BoxDecoration(
              color: index == 1 ? Color(0xff403E3F) : Color(0xff1B191A),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          height: MediaQuery.of(context).size.height / 6,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Spacer(),
                  Icon(
                    index == 0
                        ? Icons.subdirectory_arrow_right
                        : Icons.subdirectory_arrow_left,
                    size: 24,
                    color: Colors.white.withOpacity(0.8),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Selector<ChangeLogic, Tuple2<Map, Map>>(
                    selector: (BuildContext build, ChangeLogic changeLogic) =>
                        Tuple2(changeLogic.selectedValues[0],
                            changeLogic.selectedValues[1]),
                    builder: (BuildContext context, Tuple2<Map, Map> value,
                        Widget child) {
                      return Text(
                        '${this.index == 0 ? value.item1['name'] : value.item2['name']}',
                        style: textTheme.body2.copyWith(fontSize: 20),
                      );
                    },
                  ),
                  Spacer(
                    flex: 5,
                  ),
                  PopupMenuButton(
                    icon: Icon(
                      Icons.arrow_drop_down,
                      size: 35,
                    ),
                    onSelected: (x) {
                      changeLogic.onSelectedPopUp(
                        x,
                        index,
                      );
                    },
                    itemBuilder: (BuildContext context) =>
                        baseLogic.currencyTypes.map((x) {
                      return PopupMenuItem(
                          value: x,
                          child: Center(
                            child: Text(
                              x['name'],
                              style: textTheme.caption.copyWith(
                                color: Colors.black.withOpacity(0.5),
                              ),
                            ),
                          ));
                    }).toList(),
                  ),
                  Spacer(
                    flex: 1,
                  )
                ],
              ),
              index == 1
                  ? Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Selector<ChangeLogic, Tuple2<num, String>>(
                        builder: (BuildContext context,
                            Tuple2<num, String> value, Widget child) {
                          return Text.rich(
                            TextSpan(
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 21,
                                    fontWeight: FontWeight.bold),
                                text: '${value.item1} ',
                                children: [
                                  TextSpan(
                                    text: localization.locale.languageCode ==
                                            'ar'
                                        ? '${value.item2.split(' ')[0].substring(2, value.item2.split(' ')[0].length)}'
                                        : '${value.item2.substring(0, 2)}',
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(0.5),
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  )
                                ]),
                          );
                        },
                        selector: (_, ChangeLogic changeLogic) {
                          return Tuple2(changeLogic.result,
                              changeLogic.selectedValues[1]['name']);
                        },
                      ),
                    )
                  : SizedBox(
                      width: baseLogic.aspectRatio * 217,
                      height: baseLogic.aspectRatio * 83,
                      child: TextField(
                        onChanged: (x) {
                          changeLogic.onChanged(x, context);
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
          )),
    );
  }
}
