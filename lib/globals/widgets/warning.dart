import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:usatolebanese/utility/localization/localization.dart';

class Warning extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            FontAwesomeIcons.info,
            color: Colors.red,
            size: 50,
          ),
          Expanded(
            flex: 4,
            child: Text(
              Localization.of(context).warning,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}
