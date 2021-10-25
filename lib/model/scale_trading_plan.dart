import 'package:flutter/cupertino.dart';

class ScalePlan {
  String buyingPrice;
  String amount;
  String totalValue;
  bool isTradeTypeBuying;

  TextEditingController myController1;
  TextEditingController myController2;

  ScalePlan(this.buyingPrice, this.amount, this.totalValue, this.isTradeTypeBuying, this.myController1, this.myController2);
}