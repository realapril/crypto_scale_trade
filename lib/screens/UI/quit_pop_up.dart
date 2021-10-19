import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'dart:io';

class QuitPopUp extends StatefulWidget {
  const QuitPopUp({Key? key}) : super(key: key);
  @override
  _QuitPopUp createState() => _QuitPopUp();
}

class _QuitPopUp extends State<QuitPopUp> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(AppLocalizations.of(context)!.quitConfirmTitle),
      content: Text(AppLocalizations.of(context)!.quitConfirmContent),
      actions: <Widget>[
        TextButton(
          onPressed: () => exit(0),
          child: Text(AppLocalizations.of(context)!.yes),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text(AppLocalizations.of(context)!.no),
        ),
      ],
    );
  }

}