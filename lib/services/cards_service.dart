import 'dart:convert';
import 'package:flutter_cost_calc/models/card.dart';
import 'package:flutter_cost_calc/notifiers/card_notifier.dart';
import 'package:http/http.dart' as http;

class CardsService {
  List<Map> getItems(page) {
    final List<List<Map>> allCards = [
      [{}],
      [{}]
    ];
    return allCards[page];
  }
}
