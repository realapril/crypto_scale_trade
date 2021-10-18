import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SavedListScreen extends StatefulWidget{
  @override
  _SavedListState createState()=> _SavedListState();
}

class _SavedListState extends State<SavedListScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Text(
        AppLocalizations.of(context)!.helloWorld,
      ),
    );
  }

}