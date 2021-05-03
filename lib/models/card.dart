import 'package:flutter/material.dart';

class CheckCard {
  String title;
  String text;
  bool checked;
  Icon icon;
  CheckCard();
  CheckCard.fromMap(Map<String, dynamic> data) {
    title = data['title'];
    text = data['text'];
    checked = data['checked'];
    icon = data['icon'];
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'text': text,
      'checked': checked,
      'icon': icon,
    };
  }
}
