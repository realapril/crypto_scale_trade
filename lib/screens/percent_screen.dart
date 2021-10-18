import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:crypto_scale_trade/screens/bars/bottom_nav.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PercentScreen extends StatefulWidget{
  @override
  _PercentScreen createState()=> _PercentScreen();
}

class _PercentScreen extends State<PercentScreen>{
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