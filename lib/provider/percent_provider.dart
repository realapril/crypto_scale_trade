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
  double _viResult =0.0;

  String get getViResult => _viResult.toString();

  setViTotal(String total){
    if(total.isNotEmpty){
      _viTotal = double.parse(total);
      if(_viTotal!=0.0 && _viPercent!=0.0){
        _calViResult(_viTotal, _viPercent);
      }
    }else{
      _viTotal = 0.0;
      _resetViResult();
    }
  }
  setViPercent(String percent){
    if(percent.isNotEmpty){
      _viPercent = double.parse(percent);
      if(_viTotal!=0.0 && _viPercent!=0.0){
        _calViResult(_viTotal, _viPercent);
      }
    }else{
      _viPercent = 0.0;
      _resetViResult();
    }
  }

  _resetViResult(){
    _viResult = 0;
    notifyListeners();
  }

  _calViResult(double total, double percent){
    _viResult = total * (1+ percent/100);
    notifyListeners();
  }

  // 3. vd_ (Value decrease)
  double _vdTotal =0.0;
  double _vdPercent =0.0;
  double _vdResult =0.0;

  String get getVdResult => _vdResult.toString();

  setVdTotal(String total){
    if(total.isNotEmpty){
      _vdTotal = double.parse(total);
      if(_vdTotal!=0.0 && _vdPercent!=0.0){
        _calVdResult(_vdTotal, _vdPercent);
      }
    }else{
      _vdTotal = 0.0;
      _resetVdResult();
    }
  }
  setVdPercent(String percent){
    if(percent.isNotEmpty){
      _vdPercent = double.parse(percent);
      if(_vdTotal!=0.0 && _vdPercent!=0.0){
        _calVdResult(_vdTotal, _vdPercent);
      }
    }else{
      _vdPercent = 0.0;
      _resetVdResult();
    }
  }

  _resetVdResult(){
    _vdResult = 0;
    notifyListeners();
  }

  _calVdResult(double total, double percent){
    _vdResult = total * (1-percent/100);
    notifyListeners();
  }

  // 4. ttv_ (Total to value)
  double _ttvResult = 0.0;
  double _ttvTotal = 0.0;
  double _ttvPercent = 0.0;

  String get getTtvResult => _ttvResult.toString();

  setTtvTotal(String total){
    if(total.isNotEmpty){
      _ttvTotal = double.parse(total);
      if(_ttvTotal!=0.0 && _ttvPercent!=0.0){
        _calTtvAnswer(_ttvTotal, _ttvPercent);
      }
    }else{
      _ttvTotal = 0.0;
      _resetTtvResult();
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
      _resetTtvResult();
    }
  }

  _resetTtvResult(){
    _ttvResult = 0;
    notifyListeners();
  }

  _calTtvAnswer(double total, double percent){
    _ttvResult = percent/total*100;
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