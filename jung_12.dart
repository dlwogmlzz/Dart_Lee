// null 다루기

void main() {
  // int 지만 데이터가 없을때(null일때)
  int? number = null;

  int? second = null;
  int? third = 300;

  // 새로운 변수를 만들어서 데이터를 넣을 수있음.
  // var myNumber = number ?? 100; // number에 데이터가 없을때 100을 넣음.
  var myNumber = number ?? second ?? third; // number에 데이터가 없을때 second의 값을 넣음 그래도 없다면 300을 넣어라.
  print('myNumber: ${myNumber}');

  String? myName = null;
  int? nameLength = myName?.length; // myName의 길이(length)를 알고 싶을때, 위에서 옵셔널을 사용했기 때문에 똑같이 옵셔널을 써야함.
  // 그리고 length는 본래 int기 때문에 int 변수에 담아줘야 함.
  bool? isNameCountOdd = myName?.length?.isOdd; // isOdd 홀수 인지 확인.
  String? secondName = null;
  String? thirdName = null;
  String? fourthName = "얍얍얍";

  // 만약에 myName에 데이터가 없다면 값을 할당해라.
  myName ??= secondName ?? thirdName ?? fourthName;
  /**
   * myName ??= "호롤로로로";
   * 이 코드가
   * 
   * if (myName == null) {
   *  myName = "호롤로로로";
   * }
   * 이거랑 같음.
   */
  print('myName: ${myName}');

  // myName에 호롤로로로 값이 있는데 만약에 다른 값을 넣으려고 한다면..
  // myName ??= "히히";
  // print('myName: ${myName}'); // 전에 넣었던 값이 그대로 출력됨. 위에 '히히' 값은 할당 안됨.

  var count = 0;
  count = count + 1;
  count += 1;

}
