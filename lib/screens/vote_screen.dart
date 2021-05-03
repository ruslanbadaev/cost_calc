import 'package:flutter/material.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Vote"),
        ),
        body: Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(),
                Wrap(children: <Widget>[
                  CardView(
                    card: CheckCard(),
                  ),
                  CardView(
                    card: CheckCard(),
                  ),
                  CardView(
                    card: CheckCard(),
                  ),
                ]),
                Card(
                  color: Colors.black45,
                  child: Container(
                      width: 560,
                      height: 150,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(Icons.radio),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  width: 200,
                                  margin: EdgeInsets.only(bottom: 8),
                                  child: Text(
                                    'Почему мы?',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white70,
                                    ),
                                  )),
                              Container(
                                width: 200,
                                child: Text(
                                    'dafdsfdafdsfdafdsfdafdsf dafdsfdafdsf',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.white54)),
                              ),
                            ],
                          ),
                          SizedBox()
                        ],
                      )),
                ),
                StepProgressIndicator(
                  totalSteps: 10,
                  currentStep: 4,
                  size: 36,
                  selectedColor: Colors.pinkAccent,
                  unselectedColor: Colors.black45,
                  customStep: (index, color, _) => color == Colors.pinkAccent
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
              ]),
        ));
  }
}
