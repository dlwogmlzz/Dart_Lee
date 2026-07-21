void main() {
  // var - 초기화한 값에 따라 타입을 추론함.
  var myName = "이재희";
  print('myName.runtimeType : ${myName.runtimeType}');
  // String name = "호롤롤로";
  // int age = 10;
  // double someNumber = 1.1;
  print(myName);

  // dynamic - 어떤 자료형이든지 바꿀 수 있다.
  myName = false; // 원래는 안되는데 dynamic으로 타입을 바꾸면 가능.
}
