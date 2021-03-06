import 'package:crypto_scale_trade/db/database.dart';
import 'package:crypto_scale_trade/db/s_plan.dart';
import 'package:crypto_scale_trade/provider/bottom_navigation_provider.dart';
import 'package:crypto_scale_trade/provider/percent_provider.dart';
import 'package:crypto_scale_trade/provider/plan_listview_provider.dart';
import 'package:crypto_scale_trade/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'l10n/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  //runApp(const MyApp());
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<BottomNavigationProvider>(create: (_) => BottomNavigationProvider()),
      ChangeNotifierProvider<PercentProvider>(create: (_) => PercentProvider()),
      ChangeNotifierProvider<PlanListvewProvider>(create: (_) => PlanListvewProvider()),
      Provider<ScalePlanDao>(create: (_) => Database().scalePlanDao),
    ],
    child: MaterialApp(
        home: MainScreen(),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          AppLocalizations.delegate,
        ],
        supportedLocales: L10n.all,
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          // fontFamily: 'Georgia',
          // textTheme: TextTheme(
          //   headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          //   headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          //   bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
          // ),
        ),
    ),
  ));
}


