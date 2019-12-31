import 'package:flutter/material.dart';

class TheText extends StatelessWidget {
  String text;
  TheText({this.text});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
    );
  }
}
