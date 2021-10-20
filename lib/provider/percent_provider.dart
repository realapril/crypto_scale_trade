import 'package:flutter/material.dart';

class PercentProvider extends ChangeNotifier {
  double _answerPercentTotal = 0;

  calPercentOfTotal(double whole, double percent){
    _answerPercentTotal = percent/whole*100;
  }
  double get getPercentOfTotal => _answerPercentTotal;
}