import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:usatolebanese/main.dart';

class Buttony extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Test test = Provider.of(context);

    return RaisedButton(
        onPressed: () {
        //  test.index++;
         // test.notifyListeners();
        },
        child: Text(
          'العربية',
        ));
  }
}
