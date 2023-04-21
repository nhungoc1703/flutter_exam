import 'package:flutter/foundation.dart';

class SelectFonts with ChangeNotifier {
  String _value = 'Charis';

  String get value => _value;

  void select(String val) {
    _value = val;
    notifyListeners();
  }
}
