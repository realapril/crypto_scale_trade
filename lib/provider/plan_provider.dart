import 'package:flutter/material.dart';

class ScalePlanProvider extends ChangeNotifier {
  double price = 0;
  double amount = 0;
  double totalValue = 0;

  String get getTotalValue => totalValue.toString();

  setBuyingPrice(String price){
    if(price.isNotEmpty){
      this.price = double.parse(price);
      if(this.price!=0.0 && amount!=0.0){
        _calTotalValue(this.price, amount);
      }
    }else{
      this.price = 0.0;
      _resetTotalValue();
    }
  }

  setAmount(String amount){
    if(amount.isNotEmpty){
      this.amount = double.parse(amount);
      if(price!=0.0 && this.amount!=0.0){
        _calTotalValue(price, this.amount);
      }
    }else{
      this.amount = 0.0;
      _resetTotalValue();
    }
  }


  _resetTotalValue(){
    totalValue = 0;
    notifyListeners();
  }

  _calTotalValue(double price, double amount){
    totalValue = price * amount;
    notifyListeners();
  }
}