import 'package:flutter/material.dart';
import 'package:sweetsheet/sweetsheet.dart';
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
    if (cardsNotifier.getItems().length == 0) cardsNotifier.nextHeader(0);
    if (cardsNotifier.getItems().length == 0) cardsNotifier.nextPage(0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final SweetSheet _sweetSheet = SweetSheet();
    CardsNotifier cardsNotifier = Provider.of<CardsNotifier>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(cardsNotifier.getHeader()),
        ),
        body: Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(),
                Wrap(children: <Widget>[
                  for (var i = 0; i < cardsNotifier.getItems().length; i++)
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
                          width: 560,
                          height: 150,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              // Icon(Icons.radio),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      width: 400,
                                      margin: EdgeInsets.only(bottom: 8),
                                      child: Text(
                                        'Почему мы?',
                                        style: TextStyle(
                                            color: Colors.deepPurpleAccent),
                                      )),
                                  Container(
                                    width: 400,
                                    child: Text(
                                        'dafdsfdafdsfdafdsfdafdsf dafdsfdafdsf',
                                        style:
                                            Theme.of(context).textTheme.body1),
                                  ),
                                ],
                              ),
                              SizedBox()
                            ],
                          )),
                      Card(
                        color: Colors.deepPurpleAccent,
                        child: Container(
                          margin: EdgeInsets.all(24),
                          child: Text(
                              'Итого ${cardsNotifier.getTotalPrice().toString()}\$',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold)),
                        ),
                      )
                    ],
                  ),
                  StepProgressIndicator(
                    totalSteps: 10,
                    currentStep: 4,
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
        ));
  }
}
