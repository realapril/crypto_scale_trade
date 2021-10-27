import 'package:crypto_scale_trade/model/scale_trading_plan.dart';
import 'package:flutter/material.dart';

class PlanListvewProvider extends ChangeNotifier {
  //basic plan should be buying plan
  List<ScalePlan> _plans = [ ScalePlan('', '', '', true, TextEditingController(), TextEditingController())  ];

  List<ScalePlan> get plans => _plans;

  addPlan(ScalePlan newPlan) {
    _plans.add(newPlan);
    notifyListeners();
  }

  clearPlan(){
    _plans.clear();
    notifyListeners();
  }

  resetPlan(){
    _plans.clear();
    _plans.add(ScalePlan('', '', '', true, TextEditingController(), TextEditingController()));
    notifyListeners();
  }

  updatePlanPrice(int index, String price){
    _plans[index].buyingPrice = price;
    _plans[index].totalValue = _calTotalValue(price, _plans[index].amount);

    notifyListeners();
  }

  updatePlanAmount(int index, String amount){
    _plans[index].amount = amount;
    _plans[index].totalValue = _calTotalValue(_plans[index].buyingPrice, amount);

    notifyListeners();
  }

  deletePlan(int index) {
    _plans.removeAt(index);
    notifyListeners();
  }

  String _calTotalValue(String price, String amount){
    double _price = 0;
    double _amount = 0;
    double _total = 0;
    if(price.isNotEmpty) {
        _price = double.parse(price);
    }

    if(amount.isNotEmpty){
        _amount = double.parse(amount);
    }
    if(_price!=0 && _amount!=0){
        _total = _price * _amount;
    }

    return _total.toString();
  }
}
