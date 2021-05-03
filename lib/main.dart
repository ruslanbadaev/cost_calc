import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_cost_calc/notifiers/card_notifier.dart';
import 'package:flutter_cost_calc/notifiers/theme_notifier.dart';
import 'package:flutter_cost_calc/screens/vote_screen.dart';
import 'package:flutter_cost_calc/screens/home_screen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => CardsNotifier(),
      ),
      ChangeNotifierProvider(
        create: (context) => ThemeNotifier(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  State createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final darkTheme = ThemeData(
      textTheme: GoogleFonts.comfortaaTextTheme(
        Theme.of(context).textTheme,
      ),
      primarySwatch: Colors.grey,
      primaryColor: Colors.black,
      brightness: Brightness.dark,
      backgroundColor: const Color(0xFF212121),
      accentColor: Colors.black,
      accentIconTheme: IconThemeData(color: Colors.black),
      dividerColor: Colors.black12,
    );

    final lightTheme = ThemeData(
      textTheme: GoogleFonts.comfortaaTextTheme(
        Theme.of(context).textTheme,
      ),
      primarySwatch: Colors.grey,
      primaryColor: Colors.white,
      brightness: Brightness.light,
      backgroundColor: const Color(0xFFE5E5E5),
      accentColor: Colors.black,
      accentIconTheme: IconThemeData(color: Colors.white),
      dividerColor: Colors.white54,
    );
    ThemeNotifier themeNotifier = Provider.of<ThemeNotifier>(context);
    return MaterialApp(
      title: 'Port Card',
      theme: themeNotifier.get() ? darkTheme : lightTheme,
      home: HomeScreen(title: 'Port Card'),
      routes: {
        "/add_scanner": (context) => CardScreen(),
      },
    );
  }
}
