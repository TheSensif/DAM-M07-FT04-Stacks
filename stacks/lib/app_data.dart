import 'dart:convert';
import 'package:flutter/foundation.dart' show kReleaseMode;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppData with ChangeNotifier {
  bool isSidebarLeftVisible = false;
  bool isSidebarRightVisible = false;

  void toggleSidebarLeft() {
    isSidebarLeftVisible = !isSidebarLeftVisible;
    notifyListeners();
  }

  void toggleSidebarRight() {
    isSidebarRightVisible = !isSidebarRightVisible;
    notifyListeners();
  }
}
