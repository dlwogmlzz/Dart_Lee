// typedef

void main() {
  // 이런식으로 가능.
  MyNickName name = "이사원입니다.";
  print('name.runtimeType: ${name.runtimeType}');

  // 웬만하면 자료형을 명시하는 것이 좋다.
  SomeAction action = (String name, int age, bool isDone) {
    return "zzz";
  };
}

// 자료 = data
// type = 자료형

// typedef(별칭, Alias) - 자료형을 이렇게 정의하겠다.
// typedef 새롭게지을이름 = 진짜타입;
typedef MyNickName = String;
typedef MyNumber = String;
typedef SomeType = List<(String name, int age, bool isDone)>;

typedef SomeAction = String Function(String, int, bool);

// 왜 사용할까?
