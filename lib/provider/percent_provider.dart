import 'package:flutter/material.dart';

class PercentProvider extends ChangeNotifier {

  /// Provides 5 kinds of percent calculations
  ///
  /// 1. If the value changed from A to B, by what percentage did it increase or Decrease?
  /// 2. What if the value increased by A percent?
  /// 3. What if the value decreased by A percent?
  /// 4. What is A percent of the total value?
  /// 5. What percentage of the total is A?
  ///
  /// 1. vtv_ (Value to value)
  /// 2. vi_ (Value increase)
  /// 3. vd_ (Value decrease)
  /// 4. ttv_ (Total to value)
  /// 5. vtp_ (Value to percent)

  // 1. vtv_ (Value to value)
  // 2. vi_ (Value increase)
  // 3. vd_ (Value decrease)

  // 4. ttv_ (Total to value)
  double _ttvAnswer = 0.0;
  double _ttvTotal = 0.0;
  double _ttvPercent = 0.0;

  setTtvTotal(String total){
    if(total.isNotEmpty){
      _ttvTotal = double.parse(total);
      if(_ttvTotal!=0.0 && _ttvPercent!=0.0){
        _calTtvAnswer(_ttvTotal, _ttvPercent);
      }
    }else{
      _ttvTotal = 0.0;
      _resetTtvAnswer();
    }
  }

  setTtvPercent(String percent){
    if(percent.isNotEmpty){
      _ttvPercent = double.parse(percent);
      if(_ttvTotal!=0.0 && _ttvPercent!=0.0){
        _calTtvAnswer(_ttvTotal, _ttvPercent);
      }
    }else{
      _ttvPercent = 0.0;
      _resetTtvAnswer();
    }
  }

  _resetTtvAnswer(){
    _ttvAnswer = 0;
    notifyListeners();

  }

  _calTtvAnswer(double total, double percent){//전체의 a 퍼센트는?
    _ttvAnswer = percent/total*100;
    print("계산"+ _ttvAnswer.toString());
    notifyListeners();
  }

  String get getTtvAnswer => _ttvAnswer.toString();

  // 5. vtp_ (Value to percent)
}