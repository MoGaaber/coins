import 'package:flutter/material.dart';

class Changhmoney extends StatefulWidget {
  @override
  _ChanghmoneyState createState() => _ChanghmoneyState();
}

class _ChanghmoneyState extends State<Changhmoney> {
  String drobval = 'الدولار الامريكي';
  double syria = 10;
  double lebanon = 20;
  dynamic convertToSyria(double input) {
    if (input <= 0) {
      print('valid');
      return false;
    } else {
      return (input / lebanon) * syria;
    }
  }

  void drobChange(String val) {
    setState(() {
      drobval = val;
    });
  }

  TextEditingController _foo = TextEditingController();

  String textval;
  void plezclecme() {
    setState(() {
      textval = _foo.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(convertToSyria(20));
    return Column(
      children: <Widget>[
        DropdownButton<String>(
            items: <String>[
              'الدولار الامريكي',
              'ليره لبنانيه (صرافين)',
              'ليره التركيه (صرافين)'
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                child: Text(value),
                value: value,
              );
            }).toList(),
            value: drobval,
            onChanged: drobChange),
        DropdownButton<String>(
            items: <String>[
              'الدولار الامريكي',
              'ليره لبنانيه (صرافين)',
              'ليره التركيه (صرافين)'
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                child: Text(value),
                value: value,
              );
            }).toList(),
            value: drobval,
            onChanged: drobChange),
        TextField(
          textInputAction: TextInputAction.done,
          textAlign: TextAlign.center,
          autofocus: true,
          maxLines: 1,
        ),
        Text("عدد العملات = ${textval}"),
        FlatButton(onPressed: plezclecme, child: Text('click me'))
      ],
    );
  }
}
