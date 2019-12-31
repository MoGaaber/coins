import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:usatolebanese/pages/bnb/change_currency/logic.dart';

class TheCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var logic = Provider.of<ChangeLogic>(context);
    return Card(
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
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
                padding: const EdgeInsets.only(right: 140),
                child: PopupMenuButton(
                  icon: Icon(Icons.arrow_drop_down),
                  itemBuilder: (BuildContext context) =>
                      ChangeLogic.currencyTypes
                          .map<PopupMenuItem>((element) => PopupMenuItem(
                                child: Text(element),
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
                      enabledBorder: UnderlineInputBorder(
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
    );
  }
}
