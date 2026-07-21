// Set - 한 바구니에 집어 넣는 느낌 / 중복은 무시된다.

void main() {
  // 배열 - 자료형, 순서
  List<int> numbers = [1, 1, 2, 3, 4, 5, 5, 5];

  print('numbers: ${numbers}'); // 중복안됨

  Set<int> uniqueNumbers = {1, 1, 1, 8, 2, 2, 3, 4, 5};
  // uniqueNumbers.add('22'); // 문자열 추가 안됨.
  final someList = uniqueNumbers.toList();
  // print('uniqueNumbers: ${uniqueNumbers}'); // 중복됨
  print('someList: ${someList}'); // 중복됨
  print('someList: ${someList.runtimeType}'); // 중복됨

  // 내가 가지고 오고 싶은 배열을 넣을 수도 있다.
  // var myNumbers = Set.from(numbers); // Set처럼 중복 제거 가능.
  // var myNumbers2 = Set.of(numbers); // Set처럼 중복 제거 가능.
  // var myNumbers2 = Set.unmodifiable(numbers); // 아예 수정이 불가능하게 함.
  // print('myNumbers2: ${myNumbers2}');

  // myNumbers2.add(6);
  // myNumbers2.add(7);
  // print('myNumbers2: ${myNumbers2}');

  // myNumbers2 = {1, 2, 3}; // final일때는 안되고, var라면 가능.
  // print('myNumbers2: ${myNumbers2}'); // Cannot change an unmodifiable set

  // var emptySet = Set(); _Set<dynamic>
  // var emptySet2 = Set<String>(); // <>으로 명시도 가능
  // Set<String> emptySet3 = {}; // 이렇게도 가능 {} 인거 잊지말것!
  // var emptySet4 = Set.new();
  // var emptySet5 = Set<String>.new();
  // var emptySet6 = Set.identity();
  // var emptySet7 = Set<String>.identity();
  // print('emptySet.runtimeType: ${emptySet7.runtimeType}');

  // 아예 Set을 만들때 수정 불가능하게 만듦.
  final strongSet = const {'red', 'green', 'blue'};
  // strongSet.add("pink"); // 추가 불가.
}
