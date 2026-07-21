// 조건문
void main() {
  // var name = null;
  // String name = null; // null은 String에 넣을 수 없음.
  // 옵셔널(?)
  // String? name2 = null;
  String? name2 = '허허허';
  final result0 = name2 ?? '이름없음';

  print('result0: $result0');
  print('result0: ${result0}');
  print('result0.runtimeType: ${result0.runtimeType}');

  bool isDartMode = false;

  // if (isDartMode) {
  //   print('다크모드 입니다.');
  // }

  // 삼항연산자
  final result = isDartMode == true ? "다크모드" : "화이트모드";
  final result2 = !isDartMode ? "다크모드" : "화이트모드"; // 이런식으로 축약도 가능.
  print(result);
  print(result2);

  // var myName = "이사원ㅋ";

  // if (myName == "이사원") {
  //   print('이사원이 맞습니다.');
  // } else if (myName == '이사원2') {
  //   print('이사원2이 입니다.');
  // } else {
  //   print('둘다 아닙니다.');
  // }
}
