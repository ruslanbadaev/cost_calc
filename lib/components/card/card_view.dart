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
      color: (card.checked ?? false) ? Colors.deepPurpleAccent : null,
      child: Container(
          width: 320,
          height: 150,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                    card.icon,
                    size: (card.checked ?? false) ? 44 : 42,
                    color: (card.checked ?? false) ? Colors.white : null,
                  ) ??
                  Icon(
                    Icons.hourglass_empty_rounded,
                    color: (card.checked ?? false) ? Colors.white : null,
                    size: 42,
                  ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: 200,
                      margin: EdgeInsets.only(bottom: 8),
                      child: Text(
                        card.title ?? '---',
                        style: (card.checked ?? false)
                            ? TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              )
                            : Theme.of(context).textTheme.body2,
                      )),
                  Container(
                    width: 200,
                    child: Text(card.text ?? '---',
                        style: (card.checked ?? false)
                            ? TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)
                            : Theme.of(context).textTheme.body1),
                  ),
                ],
              ),
              SizedBox()
            ],
          )),
    ));
  }
}
