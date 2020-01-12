import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:usatolebanese/utility/localization/localization.dart';

class ChangeLogic extends ChangeNotifier with EquatableMixin {
  num convert(num input) {
    return (input * selectedValues[0]['value']) / selectedValues[1]['value'];
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

  onChanged(String text, BuildContext context) {
    if (text.isEmpty || num.parse(text) <= 0) {
      result = 0;
    } else {
      result = convert(num.parse(text));
    }
    notifyListeners();
  }

  @override
  // TODO: implement props
  List<Object> get props => selectedValues;

  void onSelectedPopUp(Map x, int index) {
    selectedValues[index] = x;
    if (controller.text.isNotEmpty) {
      result = convert(num.parse(controller.text));
    }
    notifyListeners();
  }
}
