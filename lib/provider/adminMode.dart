import 'package:flutter/material.dart';

class AdminMode extends ChangeNotifier {
  bool isAdmin = false;

  ChangeisAdmin(bool value) {
    isAdmin = value;

    notifyListeners();
  }
}
