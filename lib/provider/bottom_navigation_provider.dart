import 'package:flutter/material.dart';

class BottomNavigationProvider extends ChangeNotifier {
  int _index = 0; //0 : screen1 1: screen2
  int get getCurrentPage => _index;

  updateCurrentPage(int index) {
    _index = index;
    notifyListeners();
  }
}