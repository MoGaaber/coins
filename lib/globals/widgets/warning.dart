import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:usatolebanese/base/logic.dart';
import 'package:usatolebanese/utility/localization/localization.dart';

class Warning extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var logic = Provider.of<BaseLogic>(context, listen: false);
    var textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Flexible(
            flex: 1,
            child: Icon(
              FontAwesomeIcons.infoCircle,
              color: Colors.red.withOpacity(0.5),
              size: logic.aspectRatio * 38.8888888889,
            ),
          ),
          Flexible(
            flex: 8,
            child: Text(
              Localization.of(context).warning,
              style: textTheme.caption,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
