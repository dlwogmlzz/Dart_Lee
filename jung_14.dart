// late - 클래스 생성시 멤버변수에 붙임.
void main() {
  var aUser = User("철수쓰");

  // Pet에 접근하기 위해 Future를 사용하여, 나중에 띄우고 싶을때 사용함.
  // Future.delayed(Duration(seconds: 3), () { // 3초뒤에 출력됨.
  //   print('aUser.pet.name: ${aUser.pet?.name}');
  // }); // Duration() - 몇초 뒤에 진행 할것인지 정함. 괄호안에 seconds: 3 등등 시간을 지정할수 있음

  // aUser.dog = Pet();
  // print('aUser.dog: $(aUser.dog?.name)');
}

class User {
  String? name;
  // Pet? pet = Pet(); // 1. 먼저 생성됨.
  // 그런데 여기에서 Pet에 late를 넣어주면 메모리에 안올라가서 실행 안됨.
  late Pet? pet = Pet();

  // Pet을 옵셔널(?)로 안하고 싶을때..
  // Pet dog; // 이것만 쓰면 생성자에서 값을 넣어라고 에러를 띄움.
  late Pet dog; // 옵셔널(?)로 안하면서 지금 값을 설정하고 싶지 않을때 late를 붙여준다.
  int? age;
  // String? info = "name: ${this.name} age: ${this.age}"; // 메모리에 안올라가면 this에 접근할 수 없어서 에러가 발생.
  late String? info = "name: ${this.name} age: ${this.age}"; // 그래서 late를 써서 나중에 사용예정이라는 것을 명시하면 this에 에러가 없어짐.

  User({this.name, this.age}) {
    // User(this.name) : dog = Pet() {
    // 2. 그 다음에 이 로그가 찍힘.
    print('Pet init name: $name');
  }
}

class Pet {
  String? name;

  Pet({this.name = "이름없음"}) {
    print('Pet init name: $name');
  }
}
