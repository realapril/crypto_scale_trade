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

class MainScreen extends StatefulWidget{
  @override
  _MainScreen createState()=> _MainScreen();
}

class _MainScreen extends State<MainScreen>{
  //final List<Widget> _screenData = [Screen1(), Screen2(), Screen3(), Screen4()];
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

  Widget _bottomNavigationBarWidget() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[850],
        boxShadow: [
          BoxShadow(
            spreadRadius: -10,
            blurRadius: 60,
            color: Colors.black.withOpacity(.20),
            offset: Offset(0, 15),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 16.0, vertical: 8),
        child: GNav(
          gap: 10,
          color: Colors.grey[600],
          activeColor: Colors.white,
          rippleColor: Colors.grey[800]!,
          hoverColor: Colors.grey[700]!,
          iconSize: 20,
          textStyle: TextStyle(fontSize: 16, color: Colors.white),
          tabBackgroundColor: Colors.grey[900]!,
          padding:
          EdgeInsets.symmetric(horizontal: 20, vertical: 16.5),
          duration: Duration(milliseconds: 800),
          tabs: [
            GButton(
              icon: LineIcons.inbox,//searchPlus
              text: '1', //AppLocalizations.of(this.context)!.saved,
            ),
            GButton(
              icon: LineIcons.calculator,
              text: '2',//AppLocalizations.of(context)!.scale,
            ),
            GButton(
              icon: LineIcons.percent,
              text: '3',//AppLocalizations.of(context)!.percent,
            ),
            GButton(
              icon: LineIcons.cog,
              text: '4',//AppLocalizations.of(context)!.settings,
            )
          ],
          selectedIndex: bottomNavigationBar.getCurrentPage,
          onTabChange: (index) {
            bottomNavigationBar.updateCurrentPage(index);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bottomNavigationBar = Provider.of<BottomNavigationProvider>(context);
    int _page = bottomNavigationBar.getCurrentPage;



    return Scaffold(
      appBar: AppBar(title: Text('Indexed Stack')),
      body: _navigationBody(),
      bottomNavigationBar: _bottomNavigationBarWidget(),
    );
  }


  // @override
  // Widget build(BuildContext context) {
  //   return WillPopScope(
  //     onWillPop: _onWillPop,
  //     child: Scaffold(
  //       appBar: AppBar(
  //         elevation: 20,
  //         title: const Text('percent'),
  //         automaticallyImplyLeading: false,
  //       ),
  //       body: Center(
  //         child: Text(AppLocalizations.of(context)!.helloWorld,),
  //       ),
  //       bottomNavigationBar: const BottomGNav(),
  //     ),
  //   );
  // }

}
