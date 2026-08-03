import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class CounterState {
  int count = 0;
  CounterState({required this.count});
}

class RiverpodCounterNotifier extends Notifier<CounterState> {
  // 데이터를 따로 선언.
  // int count = 0;
  var count = 0.obs; // obs - 변수를 관찰가능한(Observable) 상태로 만든다.
  // RxInt count = 0.obs; // obs - 변수를 관찰가능한(Observable) 상태로 만든다.
  // CounterViewmodel(); // GetxController의 경우 생성자도 필요없음

  // 로직
  void countUp() {
    state = CounterState(count: state.count + 1); // state, 상태 변경.
    print('RiverpodCounterNotifier - countUp count : ${state.count}');
    // count += 1; // count = count + 1;
    // notifyListeners(); // GetxController의 경우 안해도 됨.
  }

  void countDown() {
    state = CounterState(count: state.count - 1); // state, 상태 변경.
    if (state.count < 0) {
      state.count = 0;
    }
    print('RiverpodCounterNotifier - countDown count : ${state.count}');
    // count -= 1; // count = count - 1;
    // notifyListeners(); // GetxController의 경우 안해도 됨.
  }

  @override
  CounterState build() {
    // TODO: implement build
    return CounterState(count: 0);
  }
}
