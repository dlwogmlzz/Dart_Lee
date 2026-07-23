// factory 생성자
// 생성자 앞에 factory 붙여서 반환(return)할수 있게 함.
// factory 키워드로 객체 생성이 가능하다.
void main() {
  // var myPet = Pet(null);
  // var myPet = Pet.aged(null);
  // print('myPet.name / ${myPet.name}');
  // print('myPet.age / ${myPet.age}');

  var firstUserInfo = UserInfo.getShared();
  var secondUserInfo = UserInfo.getShared();

  print('firstUserInfo: ${firstUserInfo.hashCode}');
  print('secondUserInfo: ${secondUserInfo.hashCode}');
}

class Pet {
  String? name;
  int? age;

  // Pet(String? name) { // 방식1. factory가 없는 기본 생성자일 때는 return이 안됨.
  // Pet(String? name) : name = "애완동물 $name", age = 100 { // 방식2. factory가 없는 기본 생성자일 때는 return이 안됨.
  factory Pet(String? name) {
    print('Pet init called / name: $name');

    // Exception
    if (name == null) {
      throw Exception('애완동물 이름이 없습니다.');
    }
    // return이 가능함..
    return Pet._internalInit(name: "애완동물: $name", age: 100);
  }

  // 내부적으로 생성한 추가 생성자.
  Pet._internalInit({this.name, this.age}); // _ ,언더스코어를 써서 내부적으로 사용한다는 의미

  // 이름 기반 생성자
  // Pet({this.name = "이름없음", this.age = 3});

  // 무조건 생성이 되는 객체들.
  // Pet(String name, int age) : name = "$name 입니다.", age = age * 10;
  // 이름 기반 추가 생성자
  // Pet.named() : name = "이름없음", age = 3;
  factory Pet.aged(int? petAge) {
    print('Pet init called / petAge: $petAge');

    // Exception
    if (petAge == null) {
      throw Exception('애완동물 나이가 없습니다.');
    }

    return Pet._internalInit(name: "애완동물 이름", age: petAge);
  }
  // 생성을 안하게, 못하게 하고 싶을때. 객체 생성을 컨트롤 할수 있는 키워드가 factory 이다.
}

class UserInfo {
  static final UserInfo _instance =
      UserInfo._internalInit(); // static - 고정된 메모리 공간에 계속 있는것을 뜻함.
  const UserInfo._internalInit();

  // factory UserInfo() {
  //   // return을 하기 위해서 factory를 붙임.
  //   print('UserInfo init');
  //   return _instance;
  // }

  factory UserInfo.getShared() {
    return _instance;
  }
}
