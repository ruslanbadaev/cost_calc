import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_cost_calc/models/card.dart';
import 'package:flutter_cost_calc/notifiers/card_notifier.dart';

class CardsService {
  List<CheckCard> getItems(int page) {
    final List<List<CheckCard>> allCards = [
      [
        CheckCard.fromMap({
          'title': 'Android + IoS',
          'text': 'Бесплатный бонус: Web',
          'price': 100,
          'checked': false,
          'icon': Icons.qr_code_scanner_outlined
        }),
        CheckCard.fromMap({
          'title': 'IoS + Web',
          'text': 'Бесплатный бонус: Android',
          'price': 100,
          'checked': false,
          'icon': Icons.qr_code_scanner_outlined
        }),
        CheckCard.fromMap({
          'title': 'Web + Android',
          'text': 'Бесплатный бонус: IoS',
          'price': 100,
          'checked': false,
          'icon': Icons.qr_code_scanner_outlined
        }),
      ],
      [
        CheckCard.fromMap({
          'title': '123',
          'text': '321',
          'price': 100,
          'checked': false,
          'icon': Icons.qr_code_scanner_outlined
        }),
        CheckCard.fromMap({
          'title': '123',
          'text': '321',
          'price': 100,
          'checked': false,
          'icon': Icons.qr_code_scanner_outlined
        }),
      ],
    ];
    print(allCards[page]);
    return allCards[page];
  }

  String getHeader(int page) {
    final List<String> allHeaders = [
      'Тип приложения',
      'Авторизация',
    ];

    return allHeaders[page];
  }

  String whyAreWe(int page) {
    final List<String> allHeaders = [
      'Тип приложения',
      'Авторизация',
    ];

    return allHeaders[page];
  }
}
