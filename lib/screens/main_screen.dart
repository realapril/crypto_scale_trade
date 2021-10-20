import 'package:crypto_scale_trade/component/bottom_nav.dart';
import 'package:crypto_scale_trade/provider/bottom_navigation_provider.dart';
import 'package:crypto_scale_trade/screens/percent_screen.dart';
import 'package:crypto_scale_trade/screens/saved_list_screen.dart';
import 'package:crypto_scale_trade/screens/scale_planning_screen.dart';
import 'package:crypto_scale_trade/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainScreen extends StatelessWidget{
  MainScreen({Key? key}) : super(key: key);

  late BottomNavigationProvider bottomNavigationBar;

  Widget _navigationBody() {
    switch (bottomNavigationBar.getCurrentPage) {
      case 0:
        return SavedListScreen();
        break;
      case 1:
        return ScalePlanningScreen();
        break;
      case 2:
        return PercentScreen();
        break;
      case 3:
        return SettingsScreen();
        break;
    }
    return Container();
  }

  PreferredSizeWidget _appBar(){
    switch (bottomNavigationBar.getCurrentPage) {
      case 0:
        return AppBar(title: Text('Indexed Stack'));
        break;
      case 1:
        return AppBar(title: Text('Indexed Stack'));
        break;
      case 2:
        return AppBar(title: Text('Indexed Stack'));
        break;
      case 3:
        return AppBar(title: Text('Indexed Stack'));
        break;
      default :
        return AppBar(title: Text(''));
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
