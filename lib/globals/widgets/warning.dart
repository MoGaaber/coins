import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:usatolebanese/utility/localization/localization.dart';

class Warning extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Flexible(
          flex: 1,
          child: Icon(
            FontAwesomeIcons.info,
            color: Colors.red,
            size: 20,
          ),
        ),
        Flexible(
          flex: 8,
          child: Text(
            Localization.of(context).warning,
            style: TextStyle(
                color: Colors.white, fontSize: 12, fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }
}
