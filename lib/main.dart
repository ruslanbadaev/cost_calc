import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
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
    final textTheme = Theme.of(context).textTheme;
    final darkTheme = ThemeData(
      textTheme: GoogleFonts.comfortaaTextTheme(textTheme).copyWith(
        body1: GoogleFonts.comfortaa(
            textStyle: textTheme.body1, color: Colors.white, fontSize: 18),
        body2: GoogleFonts.comfortaa(
            textStyle: textTheme.body2, color: Colors.white, fontSize: 24),
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
      textTheme: GoogleFonts.comfortaaTextTheme(textTheme).copyWith(
        body1: GoogleFonts.comfortaa(
            textStyle: textTheme.body1, color: Colors.black, fontSize: 18),
        body2: GoogleFonts.comfortaa(
            textStyle: textTheme.body2, color: Colors.black, fontSize: 24),
      ),
      buttonTheme: ButtonThemeData(
          buttonColor: Colors.deepPurpleAccent,
          colorScheme: ColorScheme.light(background: Colors.red)),
      primarySwatch: Colors.grey,
      primaryColor: Colors.white,
      brightness: Brightness.light,
      backgroundColor: Colors.grey[500],
      accentColor: Colors.deepPurpleAccent,
      accentIconTheme: IconThemeData(color: Colors.deepPurpleAccent),
      dividerColor: Colors.white54,
      buttonColor: Colors.deepPurpleAccent,
    );
    ThemeNotifier themeNotifier = Provider.of<ThemeNotifier>(context);
    return MaterialApp(
      title: 'Port Card',
      theme: themeNotifier.get() ? darkTheme : lightTheme,
      home: HomeScreen(title: 'Port Card'),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/calc_screen':
            return PageTransition(
              child: CardScreen(),
              type: PageTransitionType.bottomToTop,
              duration: Duration(milliseconds: 800),
              settings: settings,
            );
            break;
          default:
            return null;
        }
      },
    );
  }
}
