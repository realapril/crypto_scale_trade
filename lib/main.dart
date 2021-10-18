import 'package:crypto_scale_trade/l10n/l10n.dart';
import 'package:crypto_scale_trade/screens/percent_screen.dart';
import 'package:crypto_scale_trade/screens/scale_planning_screen.dart';
import 'package:crypto_scale_trade/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'screens/saved_list_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0x434343),
      ),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        AppLocalizations.delegate,
      ],
      supportedLocales: L10n.all,
      initialRoute: '/savedList',
      routes: {
        '/savedList': (context) => SavedListScreen(),
        '/percent' : (context) => PercentScreen(),
        '/scale_planning' : (context) => ScalePlanningScreen(),
        '/setting' : (context) => SettingsScreen(),
      },

      home: SavedListScreen(),
    );
  }
}
