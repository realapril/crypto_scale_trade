import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SavedListScreen extends StatefulWidget{
  @override
  _SavedListState createState()=> _SavedListState();
}

class _SavedListState extends State<SavedListScreen>{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(AppLocalizations.of(context)!.helloWorld,),
    );
    //   WillPopScope(
    //   onWillPop: _onWillPop,
    //   child: Scaffold(
    //     appBar: AppBar(
    //       elevation: 20,
    //       title: const Text('Saved List'),
    //       automaticallyImplyLeading: false,
    //     ),
    //     body: Center(
    //       child: Text(AppLocalizations.of(context)!.helloWorld,),
    //     ),
    //     bottomNavigationBar: const BottomGNav(initialIdx: 0),
    //   ),
    // );
  }
//
}