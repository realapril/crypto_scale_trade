import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsScreen extends StatefulWidget{
  @override
  _Settings createState()=> _Settings();
}

class _Settings extends State<SettingsScreen>{

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(AppLocalizations.of(context)!.helloWorld,),
    );
  }

}