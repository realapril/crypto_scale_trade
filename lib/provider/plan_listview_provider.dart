import 'package:crypto_scale_trade/model/buying_plan.dart';
import 'package:flutter/material.dart';

class PlanListvewProvider extends ChangeNotifier {
  List<BuyingPlan> _plans = [
    BuyingPlan('', '', '', FocusNode(), FocusNode(), TextEditingController(), TextEditingController()),
  ];

  List<BuyingPlan> get plans => _plans;

  addPlan(BuyingPlan newPlan) {
    _plans.add(newPlan);
    notifyListeners();
  }

  updatePlan(int index){

  }

  deletePlan(int index) {
    _plans.removeAt(index);
    notifyListeners();
  }
}