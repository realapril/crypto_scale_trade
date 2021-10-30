import 'package:flutter/cupertino.dart';

class ScalePlan {
  String buyingPrice;
  String amount;
  String totalValue;
  bool isTradeTypeBuying;


  ScalePlan(this.buyingPrice, this.amount, this.totalValue, this.isTradeTypeBuying);
}

class ScalePlanItem{
  ScalePlan scalePlan;

  TextEditingController myController1;
  TextEditingController myController2;

  ScalePlanItem(this.scalePlan, this.myController1, this.myController2);
}

class WholeScalePlan{
  String name;
  DateTime lastEditedTime;

  WholeScalePlan(this.name, this.lastEditedTime);
}