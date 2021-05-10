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
            ? Container()
            : Center(
                child: SleekCircularSlider(
                    appearance: CircularSliderAppearance(
                customColors: CustomSliderColors(
                    dotColor: Colors.white,
                    trackColor: Colors.purpleAccent,
                    progressBarColor: Colors.deepPurpleAccent),
                spinnerMode: true,
              ))));
  }
}
