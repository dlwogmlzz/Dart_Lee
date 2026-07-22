// 클래스, 생성자
void main() {
  // 데이터 - 변수, 상수, List, Map, Set, Record
  // 클래스 - 자료의 여러형태를 담을 수 있다.
  // 객체

  // 이사원
  // var aUser = User("이사원", 20); // User 생성자에서 age가 옵셔널
  // var aUser = User("이사원", 10, "운동선수"); // 옵셔널 파라미터[]로 감싸줬기 때문에 age를 안써도 에러가 안남.
  // var aUser = User("이사원", job: "운동선수"); // age를 생성자에서 초기화 해줬을 경우, 안써도줘도 됨.
  // var aUser = User(
  //   "이사원",
  //   age: 2000,
  //   job: "운동선수",
  // ); // 옵셔널 파라미터[]로 감싸줬기 때문에 age를 안써도 에러가 안남.

  // var aUser = User(); // 생성자에서 매개변수를 아예 안받는다()는 의미로 만듦
  // var aUser = User("원우", 40, "태권도관장"); // 생성자에서 일부 매개변수가 있을때
  // var aUser = User.withName();

  // 위치 기반 호출
  // var aUser = User.withPositional("재희", 42, "무직");

  // defaultInit
  // var aUser = User.defaultInit();

  // 
  var aUser = User.secondInit("고윤정");

  // 이름 기반 호출
  // var aUser = User.withName("재희", age: 42, job: "무직");

  print('aUser.name: ${aUser.name}');
  print('aUser.age: ${aUser.age}');
  print('aUser.job: ${aUser.job}');
  print('aUser.info: ${aUser.info}');

  // 다른 사람
  // final User you = User("냥냥", 2);

  // 메모리라는 공간
  positionalParamFunction("제임스", 50); // 50이 출력됨, 안넣어주면 100이 출력됨.
  namedParamFunction("프랭크", age: 500);
}

const String defaultName = "이름있음";

// 인간
class User {
  String? name;
  // int? age;
  int? age = 200; // 기본값을 여기서 그냥 넣어도 상관없음.
  String? job;
  String? info;

  // 기본 생성자
  // User(this.name, this.age); // 자기 자신의 name
  // User(this.name, [this.age]); // 위에 함수를 만들때 age를 옵셔널 파라미터'[]'로 작성했기 때문에 여기도 옵셔널 파라미터'[]'로 작성.

  // User(this.name); // 위에 age에 기본값(200)을 넣어줬기 때문에 데이터(this.age)를 안넣어주어도 된다.
  // User(this.name, [this.age]); // 옵셔널 파라미터기 때문에 [this.age]를 안넣어도 되지만, 위에서 200을 넣어줘도, 데이터 자체가 안들어 왔기 때문에 null로 출력됨.

  // 위치 기반 매개변수
  User(
    this.name, [
    this.age = 300,
    this.job,
  ]); // 옵셔널 파라미터기 때문에 [this.age]를 안넣어도 되지만, 위에서 200을 넣어줘도, 데이터 자체가 안들어 왔기 때문에 null로 출력됨.

  // 이름 기반 매개변수
  // User(this.name, {this.age = 1000, this.job});

  // 매개변수가 없는 생성자로 여기서 초기화한 값이 출력됨.
  // User() : name = defaultName, job = "무직"; // 위에 변수 name과 job에 값을 여기서 초기화 하고 싶다고 할때

  // 매개변수를 받아서 처리한다고 했을때..
  // User(this.name, this.age, this.job) : job = "이름: ${this.name}... "; // 여기서는 this를 못 넣음..
  // User(this.name, this.age, this.job) : info = "이름: ${name}, 나이: ${age}, 직업: ${job}"; // 여기서는 this 빼고 넣어야됨..

  // User(this.name, [this.age = 300, this.job]);

  // ↑위의 성생자를 활용해서 다른 추가 생성자를 만들 수 있다.
  // User.withName(); // 이렇게만 해도 생성이 됨.

  // 위치 기반
  User.withPositional(this.name, [this.age = 1000, this.job])
    : info =
          "이름: ${name}, 나이: ${age}, 직업: ${job}"; // 옵셔널 [] - age와 job을 선택사항으로 만들고, 순서대로 값을 입력받는 위치 기반으로 처리됨.
  // 이름 기반
  User.withName(this.name, {this.age = 1000, this.job}); // 이렇게만 해도 생성이 됨.
  User.defaultInit() : this("정화", 20, "백조");

  // User.secondInit(String userName) : this.withName(userName, age: 100, job: "축구 선수");
  User.secondInit(String userName) : this.withName(userName, age: userName.length, job: "농구 선수");
}

// 위치기반 매개변수를 받는 함수.
// void positionalParamFunction(String name, [int? age]) { // [int? age] - age가 안들어갈 수도 있고 들어 갈수도 있다.
void positionalParamFunction(String name, [int? age = 100]) {
  // [] 옵셔널 파라미터
  // age에 기본 값을 100으로 셋팅하고 출력할때, 값을 안넣어주면 100이 출력되고 출력 값을 넣어주면 넣어준 값이 출력됨.
  print('positionalParamFunction / name: $name, age: $age');
}

// 위치기반 + 이름기반 매개변수를 받는 함수.
void namedParamFunction(String name, {int? age = 200}) {
  print('namedParamFunction / name: $name, age: $age');
}
