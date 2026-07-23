// future - 비동기 프로그램, delay를 주는것.

void main() async {
  /**
   * 프로그램은
   * 위에서 아래로 실행되는데,
   * 그렇지 않을 때도 있다.
   */

  // print('오늘도 ');
  // print('빡코딩하고 계신가요?');

  // 데이터베이스, API로 받아오는 데이터는 시간이 오래 걸림.
  // 비 동기(Asynchronous) - 같지 않다?
  // 나중에 이벤트가 들어온다.
  // 예) 네트워크, 로컬DB 조회 등..

  // 비동기를 처리할때는 콜백이라는 것을 사용한다.
  // 콜백이란? 나중에 불러주는것.
  // 넷플릭스 같은 기능
  // 내 정보 - 요청

  // 카카오톡
  // 채팅방 목록
  // 쇼핑 목록

  // 추천 영상 목록 - 요청
  // someDelayedFunction("1번");
  // someDelayedFunction(
  //   "1번",
  //   seconds: 2,
  //   callback: (String result) {
  //     print(result);

  //     // 이런식으로 또 호출할 수 있음.
  //     someDelayedFunction(
  //       "2번",
  //       seconds: 3,
  //       callback: (String result) {
  //         print(result);

  //         someDelayedFunction(
  //           "3번",
  //           seconds: 4,
  //           callback: (String result) {
  //             print(result);
  //           },
  //         );
  //       },
  //     );
  //   },
  // );

  // someDelayedFunction(
  //   "1번",
  //   seconds: 2,
  //   callback: (String result) {
  //     print(result);
  //   },
  // );

  // return

  // 딜레이!!
  print('안녕하세요.');
  // await - 기다리라는 의미.
  var result1 = await someDelayedAsyncFunction("1번", seconds: 1);
  print('result1 : $result1');
  var result2 = await someDelayedAsyncFunction("2번", seconds: 2);
  print('result2 : $result2');
  var result3 = await someDelayedAsyncFunction("3번", seconds: 3);
  print('result3 : $result3');
  print('오늘도 빡코딩!!');

  // 경주마가 동시로 출발해서 경주를 하는 느낌.
  List<String> finalResult = await Future.wait([
    someDelayedAsyncFunction("1번", seconds: 1),
    someDelayedAsyncFunction("2번", seconds: 2),
    someDelayedAsyncFunction("3번", seconds: 3),
  ]);
  print('finalResult: $finalResult');
}

// void someDelayedFunction(String label, { int seconds = 1, required void Function() callback}) {
//   print('someDelayedFunction called -- 1');
//   // Future.delayed(Duration(seconds: 3), () {
//   //   print('3초가 지났다 / label: $label');
//   // });

//   Future.delayed(Duration(seconds: seconds), callback);
//   print('someDelayedFunction called -- 2');
// }

void someDelayedFunction(
  String label, {
  int seconds = 1,
  required void Function(String) callback,
}) {
  print('someDelayedFunction called -- 1');
  // Future.delayed(Duration(seconds: 3), () {
  //   print('3초가 지났다 / label: $label');
  // });

  Future.delayed(Duration(seconds: seconds), () {
    var result = '$seconds초가 지났다 - $label';
    callback(result);
    callback(result);
    callback(result);
  });
  print('someDelayedFunction called -- 2');
}

Future<String> someDelayedAsyncFunction(String label, {int seconds = 1}) async {
  print('someDelayedFunction called -- 1');

  String result = await Future.delayed(Duration(seconds: seconds), () {
    return '$seconds초가 지났다 - $label';
  });

  print('someDelayedFunction called -- 2');
  return result;
}
