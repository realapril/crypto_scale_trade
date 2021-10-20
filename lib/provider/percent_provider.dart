import 'package:flutter/material.dart';

class PercentProvider extends ChangeNotifier {
  // int _index = 0; //0 : screen1 1: screen2
  // int get getCurrentPage => _index;
  //
  // updateCurrentPage(int index) {
  //   _index = index;
  //   notifyListeners();
  // }
  double _whole = 0;
  double _percent = 0;
  double _answer = 0;

  calPercentOfTotal(double whole, double percent){
    _whole = whole;
    _percent = percent;
    _answer = percent/whole*100;
  }
  double get getPercentOfTotal => _answer;
}