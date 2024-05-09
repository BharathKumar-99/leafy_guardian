import 'package:flutter/material.dart';

class AppConfig extends ChangeNotifier {
  bool isDarkMode = false;
  void changeTheme() {
    isDarkMode = !isDarkMode;
    notifyListeners();
  }
}