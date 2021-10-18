import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BottomGNav extends StatefulWidget {
  const BottomGNav({Key? key}) : super(key: key);

  @override
  _BottomGNav createState() => _BottomGNav();
}

class _BottomGNav extends State<BottomGNav> {
  @override
  Widget build(BuildContext context) {
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
              text: AppLocalizations.of(context)!.saved,
            ),
            GButton(
              icon: LineIcons.calculator,
              text: AppLocalizations.of(context)!.scale,
            ),
            GButton(
              icon: LineIcons.percent,
              text: AppLocalizations.of(context)!.percent,
            ),
            GButton(
              icon: LineIcons.cog,
              text: AppLocalizations.of(context)!.settings,
            )
          ],
          // selectedIndex: selectedIndex,
          // onTabChange: _tabChanged,
        ),
      ),
    );
  }

}