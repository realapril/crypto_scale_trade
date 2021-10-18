import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:crypto_scale_trade/screens/bars/bottom_nav.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsScreen extends StatefulWidget{
  @override
  _Settings createState()=> _Settings();
}

class _Settings extends State<SettingsScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Text(
        AppLocalizations.of(context)!.helloWorld,
      ),
      bottomNavigationBar: BottomGNav(),

    );
  }

}