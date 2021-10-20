// import 'package:crypto_scale_trade/model/trade_model.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// class ScaleProvider extends ChangeNotifier {
//   // late String cryptoName;
//   // late double averagePurchasePrice; //매수평단
//   // late double balance;//수량
//   // late double cashValue; //투자금액
//   // late String monetaryUnit;//환산단위
//   late String cryptoName;
//   late TradeModel model;
//
//   void setBuyModel(double averagePurchasePrice, double balance){
//     model = TradeModel(averagePurchasePrice: averagePurchasePrice, balance: balance, cashValue: averagePurchasePrice*balance);
//     notifyListeners();
//   }
//
//   // dynamic getBuyModel(){
//   //   if(_model!=null){
//   //     return _model
//   //   }
//   // }
//   //
//   // int _pageNum = 0; //0 : screen1 1: screen2
//   //
//   // int get getPageNum => _pageNum;
//   //
//   // void setPage(int index) {
//   //   _pageNum = index;
//   //   notifyListeners();
//   // }
//
// }