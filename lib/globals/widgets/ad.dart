import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';

class Ad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding:
            const EdgeInsets.only(top: 20, bottom: 10, right: 10, left: 10),
        child: Container(
          margin: EdgeInsets.only(top: 1),
          child: AdmobBanner(
            adUnitId: "ca-app-pub-3940256099942544/6300978111",
            adSize: AdmobBannerSize.LARGE_BANNER,
            listener: (AdmobAdEvent event, Map<String, dynamic> args) {
              switch (event) {
                case AdmobAdEvent.loaded:
                  print('Admob banner loaded!');
                  break;

                case AdmobAdEvent.opened:
                  print('Admob banner opened!');
                  break;

                case AdmobAdEvent.closed:
                  print('Admob banner closed!');
                  break;

                case AdmobAdEvent.failedToLoad:
                  print(
                      'Admob banner failed to load. Error code: ${args['errorCode']}');
                  break;
                case AdmobAdEvent.clicked:
                  // TODO: Handle this case.
                  break;
                case AdmobAdEvent.impression:
                  // TODO: Handle this case.
                  break;
                case AdmobAdEvent.leftApplication:
                  // TODO: Handle this case.
                  break;
                case AdmobAdEvent.completed:
                  // TODO: Handle this case.
                  break;
                case AdmobAdEvent.rewarded:
                  // TODO: Handle this case.
                  break;
                case AdmobAdEvent.started:
                  // TODO: Handle this case.
                  break;
              }
            },
          ),
        ),
      ),
    );
  }
}
