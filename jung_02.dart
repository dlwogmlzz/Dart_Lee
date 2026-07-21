// 상수 const와 final

void main() {
  // 값을 바꿀 수 있음.
  var myName = "홀롤로로";
  myName = "수정됨";

  // 값을 못 바꿈.
  final nickname = "이사원";
  // 자료형 명시
  final String nickname2 = "이사원";

  // final이라서 값이 안바뀜.
  nickname = "이사장";
  nickname2 = "이대리";

  // final vs const
  /**
   * final : 프로그램이 돌아가는 동안(런타임)에 상수를 정하는 것.
   * const : 프로그램이 돌아가기 전에 컴파일 시간에 상수가 정해지는 것. 아예 바뀌지 않는 값일 경우.
   */

}
