import 'package:flutter/material.dart';
import 'package:flutter_cost_calc/components/card/card_view_model.dart';
import 'package:flutter_cost_calc/models/card.dart';

class CardView extends StatefulWidget {
  final CheckCard card;

  CardView({@required this.card});

  @override
  State createState() {
    return CardViewState(card);
  }
}

class CardViewState extends State<CardView> {
  CheckCard card;
  CardViewModel cardViewModel;

  CardViewState(this.card) {
    cardViewModel = new CardViewModel();
    cardViewModel.setCard(card);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Card(
      color: (card.checked ?? false) ? Colors.orange : Colors.black12,
      child: Container(
          width: 320,
          height: 150,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              card.icon ?? Icon(Icons.hourglass_empty_rounded),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: 200,
                      margin: EdgeInsets.only(bottom: 8),
                      child: Text(
                        card.title ?? '---',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      )),
                  Container(
                    width: 200,
                    child: Text(card.text ?? '---',
                        style: TextStyle(fontSize: 14, color: Colors.white70)),
                  ),
                ],
              ),
              SizedBox()
            ],
          )),
    ));
  }
}
