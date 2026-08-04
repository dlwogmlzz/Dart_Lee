import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int _counter = 0; // 내부적으로 가져옴.
  int get counter => _counter; // 외부에서 접근하기 위해서 getter방식으로 가져온다.

  final List<int> _countList = [];
  List<int> get countList => _countList;

  void incrementCounter() {
    _counter++; // 내부적으로 변경.
    _countList.insert(0, counter);
    notifyListeners();
  }
}
