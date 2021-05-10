import 'package:flutter/material.dart';
import 'package:flutter_cost_calc/models/card.dart';
import 'package:flutter_cost_calc/services/cards_service.dart';
import 'package:flutter_cost_calc/services/storage_service.dart';

class CardsNotifier with ChangeNotifier {
  List<CheckCard> _cards = [];
  int _totalPrice = 0;
  int _totalPages = 0;
  int _page = 0;
  String _header = '';
  String _whyAreWe = '';
  bool _runSlider = false;

  void runSlider() {
    _runSlider = true;
    notifyListeners();
  }

  void stopSlider() {
    _runSlider = false;
    notifyListeners();
  }

  bool sliderIsRun() {
    return _runSlider;
  }

  setPage(int page) {
    _cards = [];
    _page = page;
    notifyListeners();
  }

  int getPage() {
    return _page;
  }

  nextPage(int page) {
    _cards = [];
    _cards = CardsService().getItems(page);
    notifyListeners();
  }

  getTotalPages() {
    return _totalPages;
  }

  loadTotalPages() {
    _totalPages = CardsService().getTotalPages();
    notifyListeners();
  }

  nextHeader(int page) {
    _header = CardsService().getHeader(page);
    notifyListeners();
  }

  nextWhyAreWe(int page) {
    _whyAreWe = CardsService().getWhyAreWe(page);
    notifyListeners();
  }

  void toggleCard(int index) {
    _cards[index].checked = !_cards[index].checked;
    _totalPrice +=
        _cards[index].checked ? _cards[index].price : -_cards[index].price;
    notifyListeners();
  }

  List<CheckCard> getItems() {
    return _cards;
  }

  String getHeader() {
    return _header;
  }

  String getWhyAreWe() {
    return _whyAreWe;
  }

  int getTotalPrice() {
    return _totalPrice;
  }
}
