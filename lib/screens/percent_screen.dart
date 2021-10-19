import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PercentScreen extends StatefulWidget{
  @override
  _PercentScreen createState()=> _PercentScreen();
}

class _PercentScreen extends State<PercentScreen>{

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(AppLocalizations.of(context)!.helloWorld,),
    );
    //   Scaffold(
    //       appBar: AppBar(
    //         elevation: 20,
    //         title: const Text('percent'),
    //         automaticallyImplyLeading: false,
    //       ),
    //     body: Center(
    //       child: Text(AppLocalizations.of(context)!.helloWorld,),
    //     )
    // );
  }

}