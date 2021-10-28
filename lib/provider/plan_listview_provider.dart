import 'package:crypto_scale_trade/model/scale_trading_plan.dart';
import 'package:flutter/material.dart';

class PlanListvewProvider extends ChangeNotifier {
  //basic plan should be buying plan
  List<ScalePlanItem> _plans = [ ScalePlanItem( ScalePlan('', '', '', true), TextEditingController(), TextEditingController())  ];

  List<ScalePlanItem> get plans => _plans;

  addPlan(ScalePlanItem newPlan) {
    _plans.add(newPlan);
    notifyListeners();
  }

  clearPlan(){
    _plans.clear();
    notifyListeners();
  }

  resetPlan(){
    _plans.clear();
    _plans.add( ScalePlanItem( ScalePlan('', '', '', true), TextEditingController(), TextEditingController()) );
    notifyListeners();
  }

  updatePlanPrice(int index, String price){
    _plans[index].scalePlan.buyingPrice = price;
    _plans[index].scalePlan.totalValue = _calTotalValue(price, _plans[index].scalePlan.amount);

    notifyListeners();
  }

  updatePlanAmount(int index, String amount){
    _plans[index].scalePlan.amount = amount;
    _plans[index].scalePlan.totalValue = _calTotalValue(_plans[index].scalePlan.buyingPrice, amount);

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
