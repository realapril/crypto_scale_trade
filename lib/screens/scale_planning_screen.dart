import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ScalePlanningScreen extends StatefulWidget{
  @override
  _ScalePlanning createState()=> _ScalePlanning();
}

class _ScalePlanning extends State<ScalePlanningScreen>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.scale)),
      body: Center(
        child: Text(AppLocalizations.of(context)!.helloWorld,),
      ),
    );
  }

}