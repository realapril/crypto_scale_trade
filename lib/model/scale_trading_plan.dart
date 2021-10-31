import 'package:flutter/cupertino.dart';

class ScalePlan_md {
  String buyingPrice;
  String amount;
  String totalValue;
  bool isTradeTypeBuying;


  ScalePlan_md(this.buyingPrice, this.amount, this.totalValue, this.isTradeTypeBuying);
}

class ScalePlanItem_md{
  ScalePlan_md scalePlan;

  TextEditingController myController1;
  TextEditingController myController2;

  ScalePlanItem_md(this.scalePlan, this.myController1, this.myController2);
}

class WholeScalePlan_md{
  String name;
  DateTime lastEditedTime;

  WholeScalePlan_md(this.name, this.lastEditedTime);
}