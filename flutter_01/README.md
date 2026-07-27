＊플러터
크로스 플랫폼 - 하나로 개발하면 여러 플랫폼(AOS/IOS/WEB)로 배포할 수 있다.
자체적인 렌더링 엔진을 가지고 있다.

vs 리액트 네이티브
호출해서 브릿지로 렌더링함...

1. ★다트 문법 익히기
2. widget을 잘 사용하기
3. 문서 찾아 보면서 적용 시켜보기!(https://api.flutter.dev/flutter/material/)

const Placeholder() vs Scaffold()

@override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

// 여기에 나중에 뭔가 채워넣을 것이다. 라고 알려주는 임시 표지판 같은 위젯
// 실행하면 화면에 X자 대각선이 그려진 네모난 박스가 표시됨.

@override
  Widget build(BuildContext context) {
    return Scaffold();
  }

// 앱의 기본 뼈대(틀)을 만들어주는 도화지 위젯
// 흰색의 빈 화면 판을 제공, 화면을 만들때는 무조건 Scaffold를 기본 틀로 깔고 시작..

・위젯 키워드 수집
・const Placeholder vs Scaffold



◆Row vs Column


1. Column (세로 배치)개념: 물건을 위에서 아래로(수직 방향) 차곡차곡 쌓는 레이아웃입니다.
축(Axis) 개념:주축 (Main Axis): 세로 방향 (위 $\rightarrow$ 아래)교차축 (Cross Axis): 가로 방향 (왼쪽 $\rightarrow$ 오른쪽)[Column의 형태]
┌─────────────┐
│  [박스 1]   │  <-- 위에서 아래로
├─────────────┤
│  [박스 2]   │
├─────────────┤
│  [박스 3]   │
└─────────────┘

Column(
  mainAxisAlignment: MainAxisAlignment.center, // 주축(세로) 기준 가운데 정렬
  crossAxisAlignment: CrossAxisAlignment.start, // 교차축(가로) 기준 왼쪽 정렬
  children: [
    Container(width: 100, height: 50, color: Colors.red),
    Container(width: 150, height: 50, color: Colors.green),
    Container(width: 200, height: 50, color: Colors.blue),
  ],
)

2. Row (가로 배치)개념: 물건을 왼쪽에서 오른쪽으로(수평 방향) 나란히 배치하는 레이아웃입니다.
축(Axis) 개념:주축 (Main Axis): 가로 방향 (왼쪽 $\rightarrow$ 오른쪽)교차축 (Cross Axis): 세로 방향 (위 $\rightarrow$ 아래)[Row의 형태]
┌─────────────────────────┐
│ [박스1] [박스2] [박스3] │  <-- 왼쪽에서 오른쪽으로
└─────────────────────────┘

Row(
  mainAxisAlignment: MainAxisAlignment.spaceAround, // 주축(가로) 기준 간격을 균등하게 배분
  crossAxisAlignment: CrossAxisAlignment.center,    // 교차축(세로) 기준 가운데 정렬
  children: [
    Container(width: 50, height: 50, color: Colors.red),
    Container(width: 50, height: 50, color: Colors.green),
    Container(width: 50, height: 50, color: Colors.blue),
  ],
)


구분                                  Row (가로)              Column (세로)

배치 방향                             가로 (좌 → 우)　　    세로 (상 → 하)
MainAxisAlignment (주축 정렬)         가로 방향 정렬         세로 방향 정렬
CrossAxisAlignment (교차축 정렬)      세로 방향 정렬         가로 방향 정렬