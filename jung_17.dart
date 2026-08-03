// getter(가져오는것) / setter(세팅하는것)


void main() {
  var myCat = Cat(name: "아오잉", age: 2);
  print('myCat.info2: ${myCat.info2}');
  print('myCat.nickname: ${myCat.nickname}');

  myCat.nickname = "개냐옹";
  print('myCat.info2: ${myCat.info2}');
  print('myCat.isOld: ${myCat.isOld}');

  // getter로 name을 가져옴.
  // setter로 수정함.
  myCat.name = "야오밍 - 수정함.";

  // myCat.info = "이런식으로 넣는것은 불가능";
  // myCat.name

  // getter따로 setter따로도 가능함.
}

class Cat {
  String? name;
  // int? age;
  int age;
  String? _health;

  String get health

  // String get info {
  //   // 이 info는 get만 있기 때문에 가져오는 것, 정보제공, 내부적으로 메서드로 연산하고 내보내고 싶을때 가능!!!
  //   return "고양이 정보 / 이름: $name, 나이: $age";
  // }

  // getter
  // 위의 info랑 똑같음. return을 '=>' 화살표 함수로 바꿔서 한 줄로 깔끔하게 작성.
  String get info2 => "고양이 정보 / 이름: $name, 나이: $age";

  // 고양이가 나이가 들었는지 확인.
  bool get isOld {
    return age > 5;
  }

  String get nickname => '고양이 닉네임: $name';

  // setter
  set nickname(String newValue) {
    name = '닉네임: $newValue';
  }

  Cat({this.name, required this.age});
}
