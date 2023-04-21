import 'package:flutter/material.dart';

class SliderValue with ChangeNotifier {
  double _value = 3;

  double get value => _value;

  void increment(double val) {
    _value = val;
    notifyListeners();
  }
}
