import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:usatolebanese/base/logic.dart';
import 'package:usatolebanese/globals/logics/constants.dart';
import 'package:usatolebanese/utility/localization/localization.dart';
import 'package:launch_review/launch_review.dart';

class Draw extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var logic = Provider.of<BaseLogic>(context, listen: false);
    return FractionallySizedBox(
      widthFactor: 0.70,
      child: Drawer(
        child: Material(
          color: Colors.black,
          child: Column(
            children: <Widget>[
              DrawerHeader(
                child: Center(
                    child: Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.cover,
                  width: logic.aspectRatio * 164.444444444,
                  height: logic.aspectRatio * 164.444444444,
                )),
                decoration: BoxDecoration(
                  color: Color(0xff250101),
                ),
              ),
              for (int i = 0; i < logic.icons.length; i++)
                Column(
                  children: <Widget>[
                    ListTile(
                        title: Text(
                          Localization.of(context).drawer[i],
                          style: TextStyle(
                              fontSize: logic.aspectRatio * 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        leading: Icon(logic.icons[i],
                            size: logic.aspectRatio * 37,
                            color: Colors.white.withOpacity(0.6)),
                        onTap: () {
                          Navigator.of(
                            context,
                          ).pop();

                          if (i <= 2) {
                            logic.navigateToPage(context, i);
                          } else {
                            if (i == 3) {
                              logic.shareApp();
                            } else {
                              LaunchReview.launch(
                                  androidAppId: Constants.packageName);
                            }
                          }
                        }),
                    i == 2
                        ? Divider(
                            height: 50 * logic.aspectRatio,
                            color: Colors.white.withOpacity(0.3),
                          )
                        : Divider(
                            height: 1,
                          ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
