import 'package:crypto_scale_trade/provider/bottom_navigation_provider.dart';
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
      ChangeNotifierProvider<BottomNavigationProvider>(create: (_) => BottomNavigationProvider())
    ],
    child: MaterialApp(
        home: MainScreen(),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          AppLocalizations.delegate,
        ],
        supportedLocales: L10n.all,),
  ));
}
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         scaffoldBackgroundColor: Colors.white70,
//       ),
//       localizationsDelegates: const [
//         GlobalMaterialLocalizations.delegate,
//         GlobalWidgetsLocalizations.delegate,
//         GlobalCupertinoLocalizations.delegate,
//         AppLocalizations.delegate,
//       ],
//       supportedLocales: L10n.all,
//       routes: {
//         '/': (context) => MainScreen(),
//         // '/savedList': (context) => SavedListScreen(),
//         // '/percent' : (context) => PercentScreen(),
//         // '/scale_planning' : (context) => ScalePlanningScreen(),
//         // '/setting' : (context) => SettingsScreen(),
//       },
//       // onGenerateRoute: (settings) { //pushname 쓰면서 애니메이션 없애기위해
//       //   if (settings.name == "/savedList") {
//       //     return PageRouteBuilder(pageBuilder: (_, __, ___) => SavedListScreen(),
//       //       transitionDuration: Duration.zero,);
//       //   } else if (settings.name == "/scale_planning") {
//       //     return PageRouteBuilder(pageBuilder: (_, __, ___) => ScalePlanningScreen(),
//       //       transitionDuration: Duration.zero,);
//       //   } else if (settings.name == "/percent") {
//       //     return PageRouteBuilder(pageBuilder: (_, __, ___) => PercentScreen(),
//       //       transitionDuration: Duration.zero,);
//       //   }else if (settings.name == "/setting") {
//       //     return PageRouteBuilder(pageBuilder: (_, __, ___) => SettingsScreen(),
//       //       transitionDuration: Duration.zero,);
//       //   }
//       //   return null;
//       // },
//
//       //home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);
//
//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.
//
//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance!.addPostFrameCallback((_) => setState(() {}));
//   }
//
//   @override
//   void setState(VoidCallback fn) {
//     Navigator.of(context).pushNamed('/savedList');
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//
//       ),
//     );
//   }
// }

