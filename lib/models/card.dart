import 'package:flutter/material.dart';

class CheckCard {
  String title;
  String text;
  bool checked;
  IconData icon;
  String price;
  CheckCard();

  CheckCard.fromMap(Map<String, dynamic> data) {
    title = data['title'];
    text = data['text'];
    checked = data['checked'];
    icon = data['icon'];
    price = data['price'];
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'text': text,
      'checked': checked,
      'icon': icon,
      'price': price,
    };
  }
}
