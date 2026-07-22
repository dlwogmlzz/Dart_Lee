// 구조분해, 스프레드 요소, 디스트럭팅
void main() {
  // List, Map, Record
  var numbers = [1, 2, 3, 4];
  List<int>? counts = [3, 3, 3, 9, 10];
  List<int>? optionalCounts = null;

  int? optionNum = 200;
  int? myNum = null;

  // var newNumbers = [...numbers, 100, ...counts]; // numbers와 counts를 동시에 출력 시키기 위해서 같이 초기화도 가능.
  var newNumbers = [
    ...numbers,
    ?myNum,
    ?optionNum,
    ...?counts,
    ...?optionalCounts,
  ]; // ...?counts - counts가 있으면 구조분해를 하면서 넣어주세요 라는 의미. optionalCounts는 null이라서 출력안됨.

  // 둘다 가능함.
  // var [one, two, three] = numbers;
  // var [one, _, three, _] = [1, 2, 3, 4]; // 2와 4는 변수로 안담고 싶을때 _(언더스코어, 여기서는 생략을 의미)를 사용한다.
  // var [one, ...] = [1, 2, 3, 4]; // 1빼고 나머지는 출력 시키기 싶지 않을 때 「... / 스프레드 요소」를 사용한다.
  // var [one, ...rest] = [
  //   1,
  //   2,
  //   3,
  //   4,
  // ]; // 1빼고 나머지를 출력하고 싶을때 끝에 변수명 아무거나(ex. rest)써서 출력시킬 수 있음.

  print("newNumbers: $newNumbers");
  // print("rest: $rest");
  // print("two: $two");
  // print("three: $three");

  // map 구조분해
  var userInfo = {"age": 10, "name": "크크크", "hobby": "Coding"};
  var {"age": userAge, "hobby": userHobby} = userInfo;
  print("userAge: $userAge, userHobby: $userHobby");

  // Record
  var info = ("red", 100);
  var (String color, score) = info;
  print("color: $color, score: $score");

  // 이름 기반
  var catInfo = (color: "green", age: 2);
  var (color: String catColor, :int age) = catInfo;
  print("catColor: $catColor, age: $age");

  // 이름 기반 함수 호출
  final (:name, age: int usersAge) = getUserInfo();

  // getMyFavoriteNumbers의 첫번째 숫자만 출력하고 싶을때

  // List 출력
  // var[firstValue, ..., lastValue] getMyFavoriteNumbers();

  // Map 출력
  var { "name": myFriendsName } = getMyFriendsInfo();
}

// List
List<int> getMyFavoriteNumbers() {
  return [1, 2, 2, 2, 2, 2, 3, 3, 4, 5, 5, 5];
}

// Map
Map<String, dynamic> getMyFriendsInfo() {
  return {"age": 10, "name": "코코", "jog": "코딩"};
}

// ** 구조 분해는 언제 쓰는 것이 좋은가? 함수라든지
// 레코드 형식 함수
({String name, int age}) getUserInfo() {
  return (name: "하하하", age: 120);
}
