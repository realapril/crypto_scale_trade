import 'package:crypto_scale_trade/screens/bars/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

class SavedListScreen extends StatefulWidget{
  @override
  _SavedListState createState()=> _SavedListState();
}

class _SavedListState extends State<SavedListScreen>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( //기본으로 뒤로가기 붙어있음
        elevation: 20,
        title: const Text('Saved List'),
      ),
      body: Center(

      ),
      bottomNavigationBar: BottomGNav()
    );
  }

}