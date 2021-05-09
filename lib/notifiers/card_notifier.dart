import 'package:flutter/material.dart';
import 'package:flutter_cost_calc/models/card.dart';
import 'package:flutter_cost_calc/services/cards_service.dart';
import 'package:flutter_cost_calc/services/storage_service.dart';

class CardsNotifier with ChangeNotifier {
  List<Map<String, dynamic>> _cards = [];
  List<CheckCard> _cards1 = [];

  nextPage(int page) {
    //_cards = CardsService().getItems(page);
    _cards1 = CardsService().getItems(page);
  }

  void toggleCard(int index) {
    print(_cards1[index].checked);
    print('123');

    _cards1[index].checked = !_cards1[index].checked;
    print(_cards1[index].checked);
    notifyListeners();
  }

  List<CheckCard> getItems() {
    return _cards1;
  }
}
