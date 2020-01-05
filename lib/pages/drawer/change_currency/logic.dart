import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:usatolebanese/utility/localization/localization.dart';

class ChangeLogic extends ChangeNotifier with EquatableMixin {
  double convert(double input, double from, double to) {
    return (input * from) / to;
  }

  var keyboardVisibility = false;
  ChangeLogic(BuildContext context) {
    localization = Localization.of(context).currencyTypes;
    selectedValues = [
      {'name': localization[0], 'value': 1},
      {'name': localization[0], 'value': 1}
    ];
    controller.addListener(() {
      print('.' + controller.value.text);
    });
  }
  List<Map> selectedValues;
  var localization;

  var controller = TextEditingController();
  List<Map> currencyTypes;

  var result = 0.0;

  onChanged(String text) {
    if (text.isEmpty || double.parse(text) <= 0) {
      result = 0;
    } else {
      result = convert(
          double.parse(text),
          selectedValues[0]['value'].toDouble(),
          selectedValues[1]['value'].toDouble());
    }
    notifyListeners();
  }

  @override
  // TODO: implement props
  List<Object> get props => selectedValues;

  void onSelectedPopUp(Map x, int index) {
    selectedValues[index] = x;
    notifyListeners();
  }
}
