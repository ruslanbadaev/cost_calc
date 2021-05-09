import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_cost_calc/models/card.dart';
import 'package:flutter_cost_calc/notifiers/card_notifier.dart';

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
      'title': 'Email',
      'text': 'Простая аторизация с подтверждением по почте',
      'price': 100,
      'checked': false,
      'icon': Icons.qr_code_scanner_outlined
    }),
    CheckCard.fromMap({
      'title': 'Социальные сети',
      'text': 'Авторизация через API популярных социальных сетей',
      'price': 100,
      'checked': false,
      'icon': Icons.qr_code_scanner_outlined
    }),
    CheckCard.fromMap({
      'title': 'Номер телефона',
      'text': 'Авторизация с подтвердением номера телефона по sms',
      'price': 100,
      'checked': false,
      'icon': Icons.qr_code_scanner_outlined
    }),
    CheckCard.fromMap({
      'title': 'QR код',
      'text': 'Авторизация методом сканирования QR кода',
      'price': 100,
      'checked': false,
      'icon': Icons.qr_code_scanner_outlined
    }),
    CheckCard.fromMap({
      'title': 'Восстановление пароля',
      'text': 'Дать возможность пользователю восстановить пароль',
      'price': 100,
      'checked': false,
      'icon': Icons.qr_code_scanner_outlined
    }),
  ],
];

class CardsService {
  List<CheckCard> getItems(int page) {
    print(allCards[page]);
    return allCards[page];
  }

  int getTotalPages() {
    return allCards.length;
  }

  String getHeader(int page) {
    final List<String> allHeaders = [
      'Выбор платформы',
      'Типы авторизации',
      'Авторизация',
    ];

    return allHeaders[page];
  }

  String getWhyAreWe(int page) {
    final List<String> allWhyAreWe = [
      'Кроссплатформенность технологии Flutter позволяет использовать одну кодовую базу под множество платформ',
      'Авторизация',
    ];

    return allWhyAreWe[page];
  }
}
