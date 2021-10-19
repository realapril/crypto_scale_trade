import 'package:crypto_scale_trade/screens/UI/quit_pop_up.dart';
import 'package:crypto_scale_trade/screens/bars/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SavedListScreen extends StatefulWidget{
  @override
  _SavedListState createState()=> _SavedListState();
}

class _SavedListState extends State<SavedListScreen>{
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
          title: const Text('Saved List'),
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: Text(AppLocalizations.of(context)!.helloWorld,),
        ),
        bottomNavigationBar: const BottomGNav(initialIdx: 0),
      ),
    );
  }

}