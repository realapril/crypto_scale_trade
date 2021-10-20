import 'package:crypto_scale_trade/component/bottom_nav.dart';
import 'package:crypto_scale_trade/provider/bottom_navigation_provider.dart';
import 'package:crypto_scale_trade/screens/percent_screen.dart';
import 'package:crypto_scale_trade/screens/saved_list_screen.dart';
import 'package:crypto_scale_trade/screens/scale_planning_screen.dart';
import 'package:crypto_scale_trade/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainScreen extends StatefulWidget{
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreen createState()=> _MainScreen();
}

class _MainScreen extends State<MainScreen>{
  late BottomNavigationProvider bottomNavigationBar;

  Widget _navigationBody() {
    switch (bottomNavigationBar.getCurrentPage) {
      case 0:
        return SavedListScreen();
      case 1:
        return ScalePlanningScreen();
      case 2:
        return PercentScreen();
      case 3:
        return SettingsScreen();
    }
    return Container();
  }

  PreferredSizeWidget _appBar() {
    switch (bottomNavigationBar.getCurrentPage) {
      case 0:
        return AppBar(title: Text(AppLocalizations.of(context)!.saved));
      case 1:
        return AppBar(title: Text(AppLocalizations.of(context)!.scale));
      case 2:
        return AppBar(title: Text(AppLocalizations.of(context)!.percent));
      case 3:
        return AppBar(title: Text(AppLocalizations.of(context)!.settings));
      default :
        return AppBar(title: const Text('None'));
    }
  }

  @override
  Widget build(BuildContext context) {
    bottomNavigationBar = Provider.of<BottomNavigationProvider>(context);
    return Scaffold(
      appBar: _appBar(),
      body: _navigationBody(),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }

}
