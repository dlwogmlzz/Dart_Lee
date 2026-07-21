// 배열 - 같은 자료형으로 줄지어 있는 형태.
void main() {
  // var numbers = [1, 2, 3, 4, 5];
  List<int> numbers = [1, 2, 3, 4, 5];
  print('numbers.runtimeType: ${numbers.runtimeType}');
  print('numbers.length: ${numbers.length}');
  numbers.add(6);
  print('numbers.length: ${numbers.length}');
  // numbers.add("ㅋㅋ"); 에러
  final int myNumber = numbers[2]; // []안에 있는 2가 0부터 2번째 index
  print('myNumber: ${myNumber}');

  // 범위 = range
  // final int foundNumber = numbers[9]; // 허용범위를 넘어섬.
  // print('foundNumber: ${foundNumber}');

  // indexOf 값이 몇번째 위치에 있는지, 없으면 -1을 출력함.
  final int secondNumber = numbers.indexOf(100);
  print('secondNumber: ${secondNumber}');

  final List<String> friends = ["철수", "영희"];

  // friends = ["스티븐", "제라드"]; // final 이라서 값을 바꿀수 없어서 에러
  friends.add("갑식");

  /**
   * const로 추가, 수정이 아예 안되게 할수 있음.
   */
  List<String> myFriends = const ["철수", "영희"];
  // myFriends.add("요호"); // add안됨.
  final index = myFriends.indexOf("영희");
  print('index: ${index}');
  print('myFriends: ${myFriends}');

  // 빈 배열 생성
  var someNumbers = <String>[]; // List<dynamic>인데 []앞에 <타입>을 넣어주면 List<타입>의 타입이 됨.
  List<int> someNumbers2 = []; // 이렇게 해도 됨.

  print('someNumbers.runtimeType: ${someNumbers.runtimeType}');
  print('someNumbers2.runtimeType: ${someNumbers2.runtimeType}');
}
