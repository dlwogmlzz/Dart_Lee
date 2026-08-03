import 'package:get/get.dart';

class GetxCounterController extends GetxController {
  // 데이터를 따로 선언.
  // int count = 0;
  var count = 0.obs; // obs - 변수를 관찰가능한(Observable) 상태로 만든다.
  // RxInt count = 0.obs; // obs - 변수를 관찰가능한(Observable) 상태로 만든다.
  // CounterViewmodel(); // GetxController의 경우 생성자도 필요없음

  // 로직
  void countUp() {
    print('GetxCounterController - countUp count : $count');
    count += 1; // count = count + 1;
    // notifyListeners(); // GetxController의 경우 안해도 됨.
  }

  void countDown() {
    print('GetxCounterController - countUp count : $count');
    count -= 1; // count = count - 1;

    if (count < 0) {
      count = 0.obs;
    }
    // notifyListeners(); // GetxController의 경우 안해도 됨.
  }
}
