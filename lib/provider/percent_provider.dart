import 'package:crypto_scale_trade/model/percent_cal_models.dart';
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
  VTV vtv = VTV();

  String get getVtvPercent => vtv.resPercent.toString();

  setVtvA(String valA){

    if(_isNumeric(valA)){
      vtv.valA = double.parse(valA);
      if(vtv.valA!=0.0 && vtv.valB!=0.0){
        _calVtvPercent(vtv.valA, vtv.valB);
      }else{
        vtv.resPercent = 0.0;
        _resetVtvPercent();
      }
    }else{
      vtv.resPercent = 0.0;
      _resetVtvPercent();
    }
  }

  setVtvB(String valB){
    if(_isNumeric(valB)){
      vtv.valB = double.parse(valB);
      if(vtv.valA!=0.0 && vtv.valB!=0.0){
        _calVtvPercent(vtv.valA, vtv.valB);
      }else{
        vtv.resPercent = 0.0;
        _resetVtvPercent();
      }
    }else{
      vtv.resPercent = 0.0;
      _resetVtvPercent();
    }
  }
  _resetVtvPercent(){
    vtv.resPercent = 0;
    notifyListeners();
  }

  _calVtvPercent(double valA, double valB){
    vtv.resPercent = (valB- valA)/valA * 100;
    notifyListeners();
  }


  // 2. vi_ (Value increase)
  VI vi = VI();

  String get getViResult => vi.result.toString();

  setViTotal(String total){
    if(_isNumeric(total)){
      vi.total = double.parse(total);
      if(vi.total!=0.0 && vi.percent!=0.0){
        _calViResult(vi.total, vi.percent);
      }else{
        vi.result = 0.0;
        _resetViResult();
      }
    }else{
      vi.result = 0.0;
      _resetViResult();
    }
  }
  setViPercent(String percent){
    if(_isNumeric(percent)){
      vi.percent = double.parse(percent);
      if(vi.total!=0.0 && vi.percent!=0.0){
        _calViResult(vi.total, vi.percent);
      }else{
        vi.result = 0.0;
        _resetViResult();
      }
    }else{
      vi.result = 0.0;
      _resetViResult();
    }
  }

  _resetViResult(){
    vi.result = 0;
    notifyListeners();
  }

  _calViResult(double total, double percent){
    vi.result = total * (1+ percent/100);
    notifyListeners();
  }

  // 3. vd_ (Value decrease)
  VD vd = VD();

  String get getVdResult => vd.result.toString();

  setVdTotal(String total){
    if(_isNumeric(total)){
      vd.total = double.parse(total);
      if(vd.total!=0.0 && vd.percent!=0.0){
        _calVdResult(vd.total, vd.percent);
      }else{
        vd.result = 0.0;
        _resetVdResult();
      }
    }else{
      vd.result = 0.0;
      _resetVdResult();
    }
  }
  setVdPercent(String percent){
    if(_isNumeric(percent)){
      vd.percent = double.parse(percent);
      if(vd.total!=0.0 && vd.percent!=0.0){
        _calVdResult(vd.total, vd.percent);
      }else{
        vd.result = 0.0;
        _resetVdResult();
      }
    }else{
      vd.result = 0.0;
      _resetVdResult();
    }
  }

  _resetVdResult(){
    vd.result = 0;
    notifyListeners();
  }

  _calVdResult(double total, double percent){
    vd.result = total * (1-percent/100);
    notifyListeners();
  }

  // 4. ttv_ (Total to value)
  TTV ttv = TTV();

  String get getTtvResult => ttv.result.toString();

  setTtvTotal(String total){
    if(_isNumeric(total)){
      ttv.total = double.parse(total);
      if(ttv.total!=0.0 && ttv.percent!=0.0){
        _calTtvAnswer(ttv.total, ttv.percent);
      }else{
        ttv.result = 0.0;
        _resetTtvResult();
      }
    }else{
      ttv.result = 0.0;
      _resetTtvResult();
    }
  }

  setTtvPercent(String percent){
    if(_isNumeric(percent)){
      ttv.percent = double.parse(percent);
      if(ttv.total!=0.0 && ttv.percent!=0.0){
        _calTtvAnswer(ttv.total, ttv.percent);
      }else{
        ttv.result = 0.0;
        _resetTtvResult();
      }
    }else{
      ttv.result = 0.0;
      _resetTtvResult();
    }
  }

  _resetTtvResult(){
    ttv.result = 0;
    notifyListeners();
  }

  _calTtvAnswer(double total, double percent){
    ttv.result = percent/total*100;
    notifyListeners();
  }


  // 5. vtp_ (Value to percent)
  VTP vtp = VTP();

  String get getVtpPercent => vtp.resPercent.toString();

  setVtpTotal(String total){
    if(_isNumeric(total)){
      vtp.total = double.parse(total);
      if(vtp.total!=0.0 && vtp.value!=0.0){
        _calVtpPercent(vtp.total, vtp.value);
      }else{
        vtp.resPercent = 0.0;
        _resetVtpPercent();
      }
    }else{
      vtp.resPercent = 0.0;
      _resetVtpPercent();
    }
  }

  setVtpValue(String value){
    if(_isNumeric(value)){
      vtp.value = double.parse(value);
      if(vtp.total!=0.0 && vtp.value!=0.0){
        _calVtpPercent(vtp.total, vtp.value);
      }else{
        vtp.resPercent = 0.0;
        _resetVtpPercent();
      }
    }else{
      vtp.resPercent = 0.0;
      _resetVtpPercent();
    }
  }
  _resetVtpPercent(){
    vtp.resPercent = 0;
    notifyListeners();
  }

  _calVtpPercent(double total, double value){
    vtp.resPercent = value/total*100;
    notifyListeners();
  }


  bool _isNumeric(String? s) {
    if (s == null) {
      return false;
    }
    if (s.trim().isEmpty){
      return false;
    }
    return double.tryParse(s) != null;
  }


}