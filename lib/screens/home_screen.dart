import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_button/flutter_button.dart';
import 'package:page_transition/page_transition.dart';
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
                Navigator.pushNamed(context, "/calc_screen");
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
                child: Card(
                    child: Container(
                        padding: EdgeInsets.all(56),
                        height: 500,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                  'Нет ничего приятнее, чем узнать Вашу экономию с помощью наших услуг',
                                  style: Theme.of(context).textTheme.body2),
                              SizedBox(
                                height: 24,
                              ),
                              Text(
                                  'От этого Вас удерживает только эта манящая кнопка',
                                  style: Theme.of(context).textTheme.body1),
                              SizedBox(
                                height: 32,
                              ),
                              /*               AnimePressButton(
                                borderRadius: BorderRadius.circular(200),
                                color: Colors.deepPurpleAccent,
                                onTap: () {
                                  print(123);
                                },
                                wGradient: false,
                                title: "Рассчитать",
                                titleColor: Colors.white,
                              ), */
                              Button3D(
                                height: 100,
                                width: 240,
                                style: StyleOf3dButton(
                                    z: 16,
                                    backColor: Colors.deepPurple,
                                    topColor: Colors.deepPurpleAccent),
                                onPressed: () {
                                  print('tap');
                                  Navigator.pushNamed(context, "/calc_screen");
                                },
                                child: Text(
                                  "Расчитать",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 24),
                                ),
                              ),
                              /*            AnimatedHoverButton(
                                borderRadius: BorderRadius.circular(100),
                                tappedTitleColor: Colors.white,
                                spashColor: Colors.deepPurpleAccent,
                                titleColor: Colors.deepPurpleAccent,
                                borderColor: Colors.deepPurpleAccent,
                                title: "Рассчитать",
                                titleSize: 24,
                                onTap: () {
                               
                                },
                              ), */
                            ]))))
            : Center(
                child: CircularProgressIndicator(),
              ));
  }
}
