import 'package:flutter/material.dart';

class CounterViewmodel extends ChangeNotifier {
  // 데이터를 따로 선언.
  int count = 0;
  CounterViewmodel();

  // 로직
  void countUp() {
    print('CounterViewModel - countUp count : $count');
    count += 1; // count = count + 1;
    notifyListeners(); // 데이터가 변경이 되었다고 알려주는 기능.
  }

  void countDown() {
    print('CounterViewModel - countUp count : $count');
    count -= 1; // count = count - 1;

    if (count < 0) {
      count = 0;
    }
    notifyListeners(); // 데이터가 변경이 되었다고 알려주는 기능.
  }
}
