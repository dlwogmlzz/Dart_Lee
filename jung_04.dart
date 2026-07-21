// function
// 반환자료형 함수이름(매개변수 자료형1 이름, 매개변수 자료형2 이름) {}
void main() {
  // 2. 함수 호출
  // saySomething();

  // final String result = saySomething(); // 출력할때도 값을 바꿔서 출력가능. 없으면 정의한 값이 출력.
  // final String result = saySomething(age: 100); // 출력할때도 값을 바꿔서 출력가능. 없으면 정의한 값이 출력.
  // final String result = saySomething(200, isDone: false); // 출력할때도 값을 바꿔서 출력가능. 없으면 정의한 값이 출력.
  // print('result : $result');

  // saySomething();
  // final String myBanana = saySomeWord();
  // print('myBanana : $myBanana');

  // 호출
  saySomethingFunction();

}

// 기본 함수1
// void saySomething() {
//   print('아무말이나');
// }

// 기본 함수2
// String saySomeWord() {
//   return "바나나";
// }

void Function() saySomethingFunction = () { // 함수타입 변수명.. 이라고 생각하면됨.
  print('아무말이나gg');
};


// 함수 축약형
saySomething() => print('아무말이나');
// String saySomeWord() => "바나나";


// 1. 함수 정의
// void saySomething() {
//   print('아무말이나');
// }

// String saySomething({bool isDone = true, int? age = null}) { // isDone에 기본값 정의 {}괄호로 감싸줘야함.
//   print('아무말이나 / age: $age / isDone: $isDone');
//   return '하하하';
// }
