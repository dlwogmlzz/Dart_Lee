typedef MyRecordType = ({int first, int second, int age});
typedef MyLargeType = (
  int,
  bool,
  List<int>,
  Set<String>,
  Map<String, dynamic>,
  void Function(String, int), {
  int age,
});

void main() {
  // List, Set, Map
  // 데이터를 관리할 때, 자료를 아무거나 다 하나로 묶어서 관리하고 싶을때. Record를 사용한다.
  // var someRecord = (100, 200);

  // (int, int) someRecord = (100, 200); // var 대신에 (int, int) 이렇게도 가능!
  // final (int, int) someRecord = (100, 200); // final도 지정가능!
  // var someRecord = (first: 100, second: 200); // 이름을 지정할 때, var로 선언

  // ({int first, int second, int age}) someRecord = (first: 100, second: 200, age: 30); // 이런식으로도 가능, runtimeType으로 어떤 타입인지 확인한후
  // ※그리고 ↑위의 코드는 수정이 불가능 하기 때문에 const를 쓸 필요가 없다.

  // 그리고 typedef를 이용해서 타입을 별칭으로 선언하고 사용할 수도 있다.
  // MyRecordType someRecord = (
  //   first: 100,
  //   second: 200,
  //   age: 30,
  // ); // 이런식으로도 가능, runtimeType으로 어떤 타입인지 확인한후

  // 수정불가능...
  // someRecord.$1 = 300;
  // print('someRecord.runtimetype : ${someRecord.runtimeType}');

  // var someRecord = (
  //   age: 10, // age라고 이름도 지정가능함. 순서가 바뀜. 순서에 안들어감. 그다음 부터 1이됨.
  //   20,
  //   false,
  //   [1, 2, 3, 4, 5],
  //   {"red", "green", "blue"},
  //   {"name": "호호", "age": 10},
  //   (String name, int age) { // 함수도 Record로 지정가능.
  //     print('name: $name, age: $age');
  //   },
  // );

  MyLargeType someRecord = (
    age: 10, // age라고 이름도 지정가능함. 순서가 바뀜. 순서에 안들어감. 그다음 부터 1이됨.
    20,
    false,
    [1, 2, 3, 4, 5],
    {"red", "green", "blue"},
    {"name": "호호", "age": 10},
    (String name, int age) {
      // 함수도 Record로 지정가능.
      print('name: $name, age: $age');
    },
  );

  print('someRecord.runtimetype : ${someRecord.runtimeType}');

  // final int first = someRecord.$1;
  // print('first: $first');
  // final List<int> someNumbers = someRecord.$3;
  // print('someNumbers: $someNumbers');

  // // 이름 기반 데이터를 출력하려면??
  // final int age = someRecord.age;
  // print('age: $age');

  var exampleRecord = (100, 200);
  someFunction(("나나", 200));
  otherFunction((name: "뽀", age: 300));

  // var result = someReturnFunction();
  // result.$1;
  // result.$2;
  // var (name, age) = someReturnFunction(); // 디스트럭팅(name, age)으로 분해해서 받을 수도 있다..
  var (:name, :age) = otherReturnFunction(); // 디스트럭팅(name, age)으로 분해해서 받을 수도 있다..
  print('name: $name / age: $age');
}

// 위치 기반
void someFunction((String name, int age) param) {
  print('paran name: ${param.$1}');
  print('paran age: ${param.$2}');
}

// 이름 기반
void otherFunction(({String name, int age}) param) {
  print('paran name: ${param.name}');
  print('paran age: ${param.age}');
}

// 반환 기반
// (String name, int age) someReturnFunction() {
// 이름 없이 변수만으로 가능함.
(String, int) someReturnFunction() {
  return ("얌얍", 200);
}

// (String name, int age) otherReturnFunction() {
//   return ("얌얍", 200);
// }

// 이름 기반으로 다시 바꾸고 싶을때
({String name, int age}) otherReturnFunction() {
  return (name: "얌얍", age: 200);
}
