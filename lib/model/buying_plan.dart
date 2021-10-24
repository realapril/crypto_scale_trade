import 'package:flutter/cupertino.dart';

class BuyingPlan {
  String buyingPrice;
  String amount;
  String totalValue;

  TextEditingController myController1;
  TextEditingController myController2;
  //TextEditingController myController3;

  BuyingPlan(this.buyingPrice, this.amount, this.totalValue, this.myController1, this.myController2);
}