import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_button/flutter_button.dart';
import 'package:flutter_cost_calc/components/card/card_view.dart';
import 'package:flutter_cost_calc/notifiers/card_notifier.dart';
import 'package:flutter_cost_calc/notifiers/theme_notifier.dart';

import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreen> {
  @override
  void initState() {
    CardsNotifier cardNotifier =
        Provider.of<CardsNotifier>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CardsNotifier cardNotifier = Provider.of<CardsNotifier>(context);
    ThemeNotifier themeNotifier = Provider.of<ThemeNotifier>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "I want app and cola without sugar",
            style: GoogleFonts.comfortaa(),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.pushNamed(context, "/add_scanner");
              },
            ),
            IconButton(
              icon: Icon(Icons.lightbulb_outline_rounded),
              onPressed: () {
                themeNotifier.toggle();
              },
            ),
          ],
        ),
        body: cardNotifier != null
            ? Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    Text(
                      'Нет ничего приятнее, чем узнать Вашу экономию с помощью наших услуг',
                      style: TextStyle(color: Colors.white12, fontSize: 24),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Text('От этого Вас удерживает только эта манящая кнопка',
                        style: TextStyle(color: Colors.white24, fontSize: 18)),
                    SizedBox(
                      height: 24,
                    ),
                    AnimePressButton(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.pinkAccent,
                      onTap: () {},
                      wGradient: false,
                      /*         gradientColors: [
                        Colors.black,
                        Colors.green,
                      ], */
                      title: "Рассчитать",
                      titleColor: Colors.white,
                    ),
                  ]))
            : Center(
                child: CircularProgressIndicator(),
              ));
  }
}
