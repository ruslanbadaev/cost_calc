import 'package:flutter/material.dart';
import 'package:flutter_cost_calc/models/card.dart';
import 'package:flutter_cost_calc/services/cards_service.dart';
import 'package:flutter_cost_calc/services/storage_service.dart';

class CardsNotifier with ChangeNotifier {
  List<Map<String, dynamic>> _cards = [];

  nextPage(int page) {
    _cards = CardsService().getItems(page);
  }

  List<Map<String, dynamic>> getItems() {
    return _cards;
  }
}
