import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';
import 'package:usatolebanese/base/logic.dart';
import 'package:usatolebanese/base/notifier.dart';
import 'package:usatolebanese/pages/drawer/change_currency/logic.dart';
import 'package:usatolebanese/utility/localization/localization.dart';

class Cardd extends StatelessWidget {
  bool isFirst;
  Cardd({this.isFirst});
  @override
  Widget build(BuildContext context) {
    var localization = Localization.of(
      context,
    );
    Notifier notifier = Provider.of<Notifier>(context, listen: false);

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
                Text(
                  this.isFirst
                      ? '${localization.globals[0]} ${notifier.textValues['from']}'
                      : '${localization.globals[1]} ',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                Spacer(
                  flex: 1,
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
                      child: Text(
                        '}',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
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
                            onTap: () {},
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
