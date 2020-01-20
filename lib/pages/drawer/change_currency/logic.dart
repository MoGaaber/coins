import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:usatolebanese/utility/localization/localization.dart';

class ChangeLogic extends ChangeNotifier with EquatableMixin {
  num convert(num input) {
    return input * (selectedValues[1]['value'] / selectedValues[0]['value']);
  }

  BuildContext context;
  var keyboardVisibility = false;
  ChangeLogic(
    BuildContext context,
  ) {
    this.context = context;

    localization = Localization.of(context).currencyTypes;

    selectedValues = [
      {'name': localization[0], 'value': 1},
      {'name': localization[0], 'value': 1}
    ];
  }
  List<Map> selectedValues;
  var localization;
  bool test = true;
  var controller = TextEditingController();
  List<Map> currencyTypes;
  num result = 0;
  num unCheckedResult;
  onChanged(String text, BuildContext context) {
    if (text.isEmpty || num.parse(text) <= 0) {
      result = 0;
    } else {
      unCheckedResult = convert(num.parse(text));
      if (unCheckedResult.toString().split('.')[1].length > 3) {
        var resultInString = convert(num.parse(text)).toString();
        var sections = resultInString.split('.');
        var afterDot = sections[1];
        var beforeDot = sections[0];
        resultInString = beforeDot + '.' + afterDot.substring(0, 2);
        result = double.parse(resultInString);
      } else {
        result = unCheckedResult;
      }
    }
    notifyListeners();
  }

  @override
  // TODO: implement props
  List<Object> get props => selectedValues;

  void onSelectedPopUp(Map x, int index) {
    selectedValues[index] = x;
    if (controller.text.isNotEmpty) {
      unCheckedResult = convert(num.parse(controller.text));
      if (unCheckedResult.toString().split('.')[1].length > 3) {
        var resultInString = convert(num.parse(controller.text)).toString();
        var sections = resultInString.split('.');
        var afterDot = sections[1];
        var beforeDot = sections[0];
        resultInString = beforeDot + '.' + afterDot.substring(0, 2);
        result = double.parse(resultInString);
      } else {
        result = unCheckedResult;
      }
    }

    notifyListeners();
  }
}
