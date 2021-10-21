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
  double _vtvA =0.0;
  double _vtvB =0.0;
  double _vtvPercent =0.0;

  String get getVtvPercent => _vtvPercent.toString();

  setVtvA(String valA){
    if(valA.isNotEmpty){
      _vtvA = double.parse(valA);
      if(_vtvA!=0.0 && _vtvB!=0.0){
        _calVtvPercent(_vtvA, _vtvB);
      }
    }else{
      _ttvTotal = 0.0;
      _resetVtvPercent();
    }
  }

  setVtvB(String valB){
    if(valB.isNotEmpty){
      _vtvB = double.parse(valB);
      if(_vtvA!=0.0 && _vtvB!=0.0){
        _calVtvPercent(_vtvA, _vtvB);
      }
    }else{
      _ttvTotal = 0.0;
      _resetVtvPercent();
    }
  }
  _resetVtvPercent(){
    _vtvPercent = 0;
    notifyListeners();
  }

  _calVtvPercent(double valA, double valB){
    _vtvPercent = (valB- valA)/valA * 100;
    notifyListeners();
  }


  // 2. vi_ (Value increase)
  double _viTotal =0.0;
  double _viPercent =0.0;
  double _viAnswer =0.0;

  String get getViAnswer => _viAnswer.toString();

  setViTotal(String total){
    if(total.isNotEmpty){
      _viTotal = double.parse(total);
      if(_viTotal!=0.0 && _viPercent!=0.0){
        _calViAnswer(_viTotal, _viPercent);
      }
    }else{
      _viTotal = 0.0;
      _resetViAnswer();
    }
  }
  setViPercent(String percent){
    if(percent.isNotEmpty){
      _viPercent = double.parse(percent);
      if(_viTotal!=0.0 && _viPercent!=0.0){
        _calViAnswer(_viTotal, _viPercent);
      }
    }else{
      _viPercent = 0.0;
      _resetViAnswer();
    }
  }

  _resetViAnswer(){
    _viAnswer = 0;
    notifyListeners();
  }

  _calViAnswer(double total, double percent){
    _viAnswer = total * (1+ percent/100);
    notifyListeners();
  }

  // 3. vd_ (Value decrease)
  double _vdTotal =0.0;
  double _vdPercent =0.0;
  double _vdAnswer =0.0;

  String get getVdAnswer => _vdAnswer.toString();

  setVdTotal(String total){
    if(total.isNotEmpty){
      _vdTotal = double.parse(total);
      if(_vdTotal!=0.0 && _vdPercent!=0.0){
        _calVdAnswer(_vdTotal, _vdPercent);
      }
    }else{
      _vdTotal = 0.0;
      _resetVdAnswer();
    }
  }
  setVdPercent(String percent){
    if(percent.isNotEmpty){
      _vdPercent = double.parse(percent);
      if(_vdTotal!=0.0 && _vdPercent!=0.0){
        _calVdAnswer(_vdTotal, _vdPercent);
      }
    }else{
      _vdPercent = 0.0;
      _resetVdAnswer();
    }
  }

  _resetVdAnswer(){
    _vdAnswer = 0;
    notifyListeners();
  }

  _calVdAnswer(double total, double percent){
    _vdAnswer = total * (1-percent/100);
    notifyListeners();
  }

  // 4. ttv_ (Total to value)
  double _ttvAnswer = 0.0;
  double _ttvTotal = 0.0;
  double _ttvPercent = 0.0;

  String get getTtvAnswer => _ttvAnswer.toString();

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

  _calTtvAnswer(double total, double percent){
    _ttvAnswer = percent/total*100;
    notifyListeners();
  }


  // 5. vtp_ (Value to percent)
  double _vtpTotal =0.0;
  double _vtpValue =0.0;
  double _vtpPercent =0.0;

  String get getVtpPercent => _vtpPercent.toString();

  setVtpTotal(String total){
    if(total.isNotEmpty){
      _vtpTotal = double.parse(total);
      if(_vtpTotal!=0.0 && _vtpValue!=0.0){
        _calVtpPercent(_vtpTotal, _vtpValue);
      }
    }else{
      _vtpTotal = 0.0;
      _resetVtpPercent();
    }
  }

  setVtpValue(String value){
    if(value.isNotEmpty){
      _vtpValue = double.parse(value);
      if(_vtpTotal!=0.0 && _vtpValue!=0.0){
        _calVtpPercent(_vtpTotal, _vtpValue);
      }
    }else{
      _vtpTotal = 0.0;
      _resetVtpPercent();
    }
  }
  _resetVtpPercent(){
    _vtpPercent = 0;
    notifyListeners();
  }

  _calVtpPercent(double total, double value){
    _vtpPercent = value/total*100;
    notifyListeners();
  }


}