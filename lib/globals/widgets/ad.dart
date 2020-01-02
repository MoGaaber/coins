import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';

class Ad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: AdmobBanner(
        adUnitId: "ca-app-pub-6888438639218821~8125460279",
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
    );
  }
}
