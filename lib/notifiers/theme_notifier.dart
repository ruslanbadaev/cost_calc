import 'package:flutter/material.dart';
import 'package:flutter_cost_calc/services/scanner_service.dart';

class ThemeNotifier with ChangeNotifier {
  bool darkTheme = true;

  toggle() {
    darkTheme = !darkTheme;
    notifyListeners();
  }

  get() {
    return darkTheme;
  }
}
