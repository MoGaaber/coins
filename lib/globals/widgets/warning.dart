import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:usatolebanese/base/logic.dart';
import 'package:usatolebanese/utility/localization/localization.dart';

class Warning extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var logic = Provider.of<BaseLogic>(context, listen: false);

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
            size: logic.aspectRatio * 38.8888888889,
          ),
        ),
        Flexible(
          flex: 8,
          child: Text(
            Localization.of(context).warning,
            style: TextStyle(
                color: Colors.white,
                fontSize: logic.aspectRatio * 19.3777777778,
                fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }
}
