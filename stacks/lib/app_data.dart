import 'dart:convert';
import 'package:flutter/foundation.dart' show kReleaseMode;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppData with ChangeNotifier {
  bool isSidebarLeftVisible = false;
  bool isSidebarRightVisible = false;
  Color isColor = Colors.black;

  void toggleSidebarLeft() {
    isSidebarLeftVisible = !isSidebarLeftVisible;
    notifyListeners();
  }

  void toggleSidebarRight() {
    isSidebarRightVisible = !isSidebarRightVisible;
    notifyListeners();
  }

  void changeColor(String color) {
    switch (color) {
      case "black":
        isColor = Colors.black;
        break;
      case "red":
        isColor = Colors.red;
        break;
      case "green":
        isColor = Colors.green;
        break;
      case "blue":
        isColor = Colors.blue;
        break;
    }
  }
}
