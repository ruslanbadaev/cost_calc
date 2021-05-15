import 'package:flutter/material.dart';
import 'package:sweetsheet/sweetsheet.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:flutter_cost_calc/components/card/card_view.dart';
import 'package:flutter_cost_calc/models/card.dart';
import 'package:flutter_cost_calc/notifiers/card_notifier.dart';
import 'package:provider/provider.dart';

class TotalScreen extends StatefulWidget {
  @override
  State createState() {
    return TotalScreenSate();
  }
}

class TotalScreenSate extends State<TotalScreen> {
  @override
  void initState() {
    CardsNotifier cardsNotifier =
        Provider.of<CardsNotifier>(context, listen: false);

    cardsNotifier.stopSlider();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CardsNotifier cardsNotifier = Provider.of<CardsNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Подводим итоги'),
      ),
      body: !cardsNotifier.sliderIsRun()
          ? Column(children: [
              Container(
                child: Column(
                  children: [
                    for (CheckCard card in cardsNotifier.getSelectedItems())
                      Card(
                        child: ListTile(
                          title: Text(card.title,
                              style: Theme.of(context).textTheme.body1),
                          leading: Icon(card.icon),
                          trailing: Text('${card.price.toString()}\$',
                              style: Theme.of(context).textTheme.body1),
                          hoverColor: Colors.deepPurpleAccent,
                        ),
                      )
                  ],
                ),
              ),
              Card(
                color: Colors.deepPurpleAccent,
                child: ListTile(
                  title: Text('Примерная стоимость',
                      style: Theme.of(context).textTheme.body1),
                  leading: Icon(Icons.thumb_up_alt_rounded),
                  trailing: Text('${cardsNotifier.getTotalPrice()}\$',
                      style: Theme.of(context).textTheme.body1),
                  hoverColor: Colors.deepPurpleAccent,
                ),
              )
            ])
          : Center(
              child: SleekCircularSlider(
                  appearance: CircularSliderAppearance(
              customColors: CustomSliderColors(
                  dotColor: Colors.white,
                  trackColor: Colors.purpleAccent,
                  progressBarColor: Colors.deepPurpleAccent),
              spinnerMode: true,
            ))),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => {},
        label: Text('Узнать подробности'),
        icon: Icon(Icons.engineering_rounded),
      ),
    );
  }
}
