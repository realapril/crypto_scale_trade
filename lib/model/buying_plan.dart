import 'package:flutter/cupertino.dart';

class BuyingPlan {
  String buyingPrice;
  String amount;
  String totalValue;

  FocusNode myFocusNode1;
  FocusNode myFocusNode2;
  FocusNode myFocusNode3;

  TextEditingController myController1;
  TextEditingController myController2;
  TextEditingController myController3;

  BuyingPlan(this.buyingPrice, this.amount, this.totalValue, this.myFocusNode1, this.myFocusNode2, this.myFocusNode3, this.myController1, this.myController2, this.myController3);
}