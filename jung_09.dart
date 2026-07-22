void main() {
  // 자료구조 - 데이터를 어떻게 관리할것인가??
  // Map - "키 : 값"으로 자료를 보관하는 것, 키는 중복이 되면 안된다.

  List<int> counts = [3, 6, 9]; // 키로 넣을 값.
  List<String> korCounts = ["셋", "여섯", "아홉"]; // 값으로 넣을 값.

  // final koreanCountMap = Map<int, String>.fromIterables(counts, korCounts);
  // final koreanCountMap = Map<int, dynamic>.fromIterables(counts, korCounts);
  var koreanCountMap = Map<int, String>.fromIterables(counts, korCounts);

  // koreanCountMap[12] = "열둘"; // 수정이 가능

  // 아예 새로운 값을 넣고 싶을때..는 변수를 var로 지정해야 됨. final로 하면 안됨.
  // koreanCountMap = {1: "3", 2: "6"};

  // 아예 수정, 추가도 안되게 하려면 unmodifiable()을 사용하면 된다.
  // unmodifiable은 조회와 가지고 오는 것은 가능.
  // final strongMap = Map.unmodifiable(koreanCountMap);

  // strongMap.[100] = "백";

  // 맵을 생성할 때 수정이 안되게 하려면? Cannot modify unmodifiable map
  // final strongSecondMap = const {10: '십'};
  // strongSecondMap[20] = "이십";

  // print('koreanCountMap : ${koreanCountMap}');
  // print('koreanCountMap.runtimeType : ${koreanCountMap.runtimeType}');

  // return; // 을 넣으면 밑에 껀 실행 안됨.

  List<int> numbers = [1, 2, 3, 4, 4, 4, 4, 5, 2];

  final numberMap = Map<int, String>.fromIterable(
    // 반복가능한 데이터를 기반으로 Map(맵) 형태의 객체를 생성할 때 사용하는 메서드.
    numbers,
    key: (aNumber) {
      return aNumber;
    },
    value: (aNumber) {
      // return aNumber * 10;
      final valueResult = aNumber * 10;
      return "값: $valueResult";
    },
  );
  print('numberMap : ${numberMap}');

  print('numberMap.runtimeType : ${numberMap.runtimeType}');

  // return; // 을 넣으면 밑에 껀 실행 안됨.

  Set<int> uniqueNumbers = {1, 2, 2, 3, 3, 4};

  Map<int, String> students = {1: "철수", 3: "영희"};

  // 데이터 추가
  students[5] = "선민";
  print('students : ${students}');

  // 데이터 수정
  students[5] = "수잔";
  print('students : ${students}');

  print('students.runtimeType : ${students.runtimeType}');

  // final String foundStudent = students[1]; // 타입불일치, String으로 선언되었는데 값이 다름.

  // 데이터 조회
  final String? foundStudent = students[1]; // ? 으로 선언을 해주면 에러가 없어짐.
  // var foundStudent = students[1]; // ? 옵셔널로 선언을 해주면 에러가 없어짐.
  print('foundStudent : ${foundStudent}');
  print('foundStudent.runtimeType : ${foundStudent.runtimeType}');

  // 빈 맵
  // var emptyMap = {};
  // Map<int, String> emptyMap = {};
  // Map<int, String> emptyMap = new Map();
  // Map<int, String> emptyMap2 = Map.new();
  final emptyMap3 = Map.identity();
  // print('emptyMap.runtimeType : ${emptyMap.runtimeType}');
  // print('emptyMap2.runtimeType : ${emptyMap2.runtimeType}');
  print('emptyMap3.runtimeType : ${emptyMap3.runtimeType}');

}
