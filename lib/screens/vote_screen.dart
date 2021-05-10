import 'package:flutter/material.dart';
import 'package:sweetsheet/sweetsheet.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:flutter_cost_calc/components/card/card_view.dart';
import 'package:flutter_cost_calc/models/card.dart';
import 'package:flutter_cost_calc/notifiers/card_notifier.dart';
import 'package:provider/provider.dart';

class CardScreen extends StatefulWidget {
  @override
  State createState() {
    return CardScreenSate();
  }
}

class CardScreenSate extends State<CardScreen> {
  @override
  void initState() {
    CardsNotifier cardsNotifier =
        Provider.of<CardsNotifier>(context, listen: false);
    cardsNotifier.loadTotalPages();
    if (cardsNotifier.getItems().length == 0) cardsNotifier.nextHeader(0);
    if (cardsNotifier.getItems().length == 0) cardsNotifier.nextWhyAreWe(0);
    if (cardsNotifier.getItems().length == 0) cardsNotifier.nextPage(0);
    cardsNotifier.stopSlider();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final SweetSheet _sweetSheet = SweetSheet();
    CardsNotifier cardsNotifier = Provider.of<CardsNotifier>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(cardsNotifier.getHeader()),
        ),
        body: !cardsNotifier.sliderIsRun()
            ? Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(),
                      Wrap(children: <Widget>[
                        for (var i = 0;
                            i < cardsNotifier.getItems().length;
                            i++)
                          InkWell(
                              onTap: () => {cardsNotifier.toggleCard(i)},
                              child: CardView(
                                card: cardsNotifier.getItems()[i],
                              )),
                      ]),
                      Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                margin: EdgeInsets.only(left: 12),
                                //   width: MediaQuery.of(context).size.width * 0.65,
                                height: 150,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    // Icon(Icons.radio),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.65,
                                            margin: EdgeInsets.only(bottom: 8),
                                            child: Text(
                                              'Почему мы?',
                                              style: TextStyle(
                                                  color:
                                                      Colors.deepPurpleAccent),
                                            )),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.65,
                                          child: Text(
                                              cardsNotifier.getWhyAreWe(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .body1),
                                        ),
                                      ],
                                    ),
                                    SizedBox()
                                  ],
                                )),
                            Row(
                              children: [
                                Card(
                                  //color: Colors.deepPurpleAccent,
                                  child: Container(
                                    margin: EdgeInsets.all(24),
                                    child: Text(
                                        'Итого ${cardsNotifier.getTotalPrice().toString()}\$',
                                        style: TextStyle(
                                            //color: Colors.white,
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                                InkWell(
                                    onTap: () => {
                                          if (cardsNotifier.getPage() > 0)
                                            {
                                              cardsNotifier.runSlider(),
                                              cardsNotifier.setPage(
                                                  cardsNotifier.getPage() - 1),
                                              cardsNotifier.nextHeader(
                                                  cardsNotifier.getPage()),
                                              cardsNotifier.nextWhyAreWe(
                                                  cardsNotifier.getPage()),
                                              cardsNotifier.nextPage(
                                                  cardsNotifier.getPage()),
                                              Navigator.pushNamed(
                                                  context, "/calc_screen")
                                            }
                                        },
                                    child: Card(
                                      color: cardsNotifier.getPage() > 0
                                          ? Colors.deepPurpleAccent
                                          : null,
                                      child: Container(
                                        margin: EdgeInsets.all(24),
                                        child: Icon(
                                          Icons.navigate_before_rounded,
                                        ),
                                      ),
                                    )),
                                InkWell(
                                    onTap: () => {
                                          if (cardsNotifier.getPage() <=
                                              cardsNotifier.getTotalPages())
                                            {
                                              cardsNotifier.runSlider(),
                                              cardsNotifier.setPage(
                                                  cardsNotifier.getPage() + 1),
                                              cardsNotifier.nextHeader(
                                                  cardsNotifier.getPage()),
                                              cardsNotifier.nextWhyAreWe(
                                                  cardsNotifier.getPage()),
                                              cardsNotifier.nextPage(
                                                  cardsNotifier.getPage()),
                                              Navigator.pushNamed(
                                                  context, "/calc_screen")
                                            }
                                        },
                                    child: Card(
                                      color: cardsNotifier.getPage() <=
                                              cardsNotifier.getTotalPages()
                                          ? Colors.deepPurpleAccent
                                          : null,
                                      child: Container(
                                        margin: EdgeInsets.all(24),
                                        child:
                                            Icon(Icons.navigate_next_rounded),
                                      ),
                                    )),
                              ],
                            )
                          ],
                        ),
                        StepProgressIndicator(
                          totalSteps: cardsNotifier.getTotalPages(),
                          currentStep: cardsNotifier.getPage(),
                          size: 36,
                          selectedColor: Colors.deepPurpleAccent,
                          unselectedColor: Colors.black45,
                          customStep: (index, color, _) =>
                              color == Colors.deepPurpleAccent
                                  ? Container(
                                      color: color,
                                      child: Icon(
                                        Icons.check,
                                        color: Colors.white,
                                      ),
                                    )
                                  : Container(
                                      color: color,
                                      child: Icon(
                                        Icons.remove,
                                      ),
                                    ),
                        ),
                      ])
                    ]),
              )
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
