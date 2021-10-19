import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:crypto_scale_trade/screens/bars/bottom_nav.dart';
import 'UI/quit_pop_up.dart';

class SettingsScreen extends StatefulWidget{
  @override
  _Settings createState()=> _Settings();
}

class _Settings extends State<SettingsScreen>{
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
          title: const Text('설정'),
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: Text(AppLocalizations.of(context)!.helloWorld,),
        ),
        bottomNavigationBar: const BottomGNav(initialIdx: 3),
      ),
    );
  }

}