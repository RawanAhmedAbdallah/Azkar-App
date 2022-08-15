import 'package:flutter/material.dart';
import 'zekr_provider.dart';

class CounterProvider extends ChangeNotifier {
  int counter = 0;
  late String value;

  void increment() {
    ++counter;
    notifyListeners();
  }
  void decrement() {
    counter = 0;
    notifyListeners();
  }
}



