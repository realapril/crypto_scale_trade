import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:crypto_scale_trade/screens/bars/bottom_nav.dart';
import 'UI/quit_pop_up.dart';

class ScalePlanningScreen extends StatefulWidget{
  @override
  _ScalePlanning createState()=> _ScalePlanning();
}

class _ScalePlanning extends State<ScalePlanningScreen>{
  Future<bool> _onWillPop() async {
    return (await showDialog(
        context: context,
        builder: (context) =>const QuitPopUp()
    )) ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          elevation: 20,
          title: const Text('물타기'),
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: Text(AppLocalizations.of(context)!.helloWorld,),
        ),
        bottomNavigationBar: const BottomGNav(initialIdx: 1),
      ),
    );
  }

}