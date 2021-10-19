import 'package:crypto_scale_trade/screens/UI/quit_pop_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:crypto_scale_trade/screens/bars/bottom_nav.dart';

class PercentScreen extends StatefulWidget{
  @override
  _PercentScreen createState()=> _PercentScreen();
}

class _PercentScreen extends State<PercentScreen>{

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
            title: const Text('percent'),
            automaticallyImplyLeading: false,
          ),
        body: Center(
          child: Text(AppLocalizations.of(context)!.helloWorld,),
        ),
      bottomNavigationBar: const BottomGNav(initialIdx: 2),
      ),
    );
  }

}