// 함수 매개변수 : positional param, named param

void main() {
  // 출력할때는 선언했을때 그 위치 그대로여야함.
  // someFunction('ㅋㅋ', 10, false);
  someFunction('ㅋㅋ', 10, true);
  // named params 출력, 순서가 바뀌어도 상관없음.
  otherFunction(age: 20, name: '요요');
  combinedFunction(isDone: true, "하하", 300, job: "BBakcoding");

  // 밑에서 required를 넣어준 변수를 출력안하면 에러가 뜸. 
  requiredFunction(isDone: true, name: "하하", age: 300, job: "축구선수"); // key: value 형식으로 출력해야됨.
}

// 위치 기반 매개변수 - positional params
// 만약에 isDone 데이터를 출력하고 싶지 않다면,
// bool isDone을 [bool? isDone]이런식으로 감싸주고 출력할때, isDone을 빼도 상관없고 null로 출력됨.
// someFunction(String name, int age, bool isDone) {
someFunction(String name, int age, [bool? isDone, int? grade]) {
  print('someFunction / name: $name, age: $age, isDone: $isDone, grade: $grade');
}

// 이름 기반 매개변수 - named params
otherFunction({String? name = null, int? age, bool? isDone = true}) {
  // 기본값을 설정해주면 출력문에서 선언을 안해줘도 출력됨.
  print('otherFunction / name: $name, age: $age, isDone: $isDone');
}

// 위치기반 + 이름기반 둘다 사용하고 싶을때
combinedFunction(String name, int age, {bool? isDone, String? job}) {
  print('combinedFunction / name: $name, age: $age, isDone: $isDone job: $job');
}

// required 매개변수 + {}로 감싸줘야됨.
requiredFunction({required String name, required int age, required bool isDone, required String job}) {
  print('requiredFunction / name: $name, age: $age, isDone: $isDone job: $job');
}
