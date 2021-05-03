import 'package:flutter_cost_calc/models/card.dart';

class CardViewModel {
  CheckCard _card;

  setCard(CheckCard card) {
    _card = card;
  }

  CheckCard get card => _card;
}
