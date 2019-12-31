import 'package:flutter/material.dart';

class Warning extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
