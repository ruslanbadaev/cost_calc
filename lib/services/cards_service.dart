import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_cost_calc/models/card.dart';
import 'package:flutter_cost_calc/notifiers/card_notifier.dart';

class CardsService {
  List<Map> getItems(int page) {
    final List<List<Map<String, dynamic>>> allCards = [
      [
        {
          'title': '123',
          'text': '321',
          'checked': true,
          'icon': Icon(Icons.qr_code_scanner_outlined)
        },
        {
          'title': 'fff',
          'text': 'aaa',
          'checked': false,
          'icon': Icon(Icons.ac_unit)
        },
        {
          'title': 'aaa',
          'text': 'fff',
          'checked': false,
          'icon': Icon(Icons.cached_outlined)
        },
      ],
      [
        {
          'title': '123',
          'text': '321',
          'checked': true,
          'icon': Icon(Icons.qr_code_scanner_outlined)
        },
        {
          'title': 'aaa',
          'text': 'fff',
          'checked': false,
          'icon': Icon(Icons.cached_outlined)
        },
      ],
    ];
    print(allCards[page]);
    return allCards[page];
  }
}
