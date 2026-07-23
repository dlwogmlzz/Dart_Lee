// constant 생성자
void main() {
  // var firstUser = User();
  // var secondUser = User();
  // var thirdUser = User.secondInit();

  // 일반 생성자.
  // User firstUser = const User();
  // User secondUser = const User();

  // constant 생성자.
  // 이렇게도 가능. const - 컴파일 타임 상수.
  User firstUser = const User();
  const User secondUser = User();

  // User thirdUser = User();

  // 생성자를 같이 해서 동일한 주소를 가지게 함.
  User fourthUser = const User.secondInit();
  User fifthUser = const User.secondInit();

  // 객체 식별키가 어떤 것인지 해쉬코드로 찍어서 확인.
  print('firstUser : ${firstUser.hashCode}');
  print('secondUser : ${secondUser.hashCode}');
  // print('thirdUser : ${thirdUser.hashCode}');
  print('fourthUser : ${fourthUser.hashCode}');
  print('fifthUser : ${fifthUser.hashCode}');

  // identical - 해쉬코드 체크하는 기능.
  bool areTheSame = identical(firstUser, secondUser);
  print('areTheSame : ${areTheSame}'); // 두 존재가 같은 존재면 true / 다른 존재면 false
}

// const
// 프로그래밍 언어 Dart
// 코드를 작성한다 -> 컴파일한다 -> 런타임에 돌아간다

class User {
  final String? name; // final - 런타임 상수, 코드가 런타임 되는 순간에 딱 한 번 값을 넣을 수 있고, 그 뒤는 못 바꿈.
  final int? age;

  const User({
    this.name = "이름없음",
    this.age = 100,
  }); // 여기에 const를 붙인다고 하면, 위의 변수에 final을 붙여줘야한다.
  // User.secondInit() : this();

  // User({this.name = "이름없음", this.age = 100});
  const User.secondInit() : name = "얍얍", age = 200;
}
