import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import 'home.dart';

void main(){
  runApp(Usatolebaness());
  
  
}

class Usatolebaness extends StatefulWidget {
  @override
  _UsatolebanessState createState() => _UsatolebanessState();
}

class _UsatolebanessState extends State<Usatolebaness> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: SplashScreen(

        seconds: 3,
        photoSize: 80,
        backgroundColor: Colors.black,
        navigateAfterSeconds: Home(),
        title: Text(
          'مرحبا بكم في quotes_mix',
          style: TextStyle(fontFamily: 'BalooBhaijaan'),
        ),
      ),
    );
  }
}