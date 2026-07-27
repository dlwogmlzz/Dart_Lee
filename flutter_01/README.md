＊Flutter 플러터
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
   축(Axis) 개념:주축 (Main Axis): 세로 방향 (위, start → 아래, end)교차축 (Cross Axis): 가로 방향 (start, 왼쪽 → end, 오른쪽)[Column의 형태]
   ┌─────────────┐
   │ [박스 1] │ <-- 위에서 아래로
   ├─────────────┤
   │ [박스 2] │
   ├─────────────┤
   │ [박스 3] │
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
   축(Axis) 개념:주축 (Main Axis): 가로 방향 (왼쪽 → 오른쪽)교차축 (Cross Axis): 세로 방향 (위 → 아래)[Row의 형태]
   ┌─────────────────────────┐
   │ [박스1] [박스2] [박스3] │ <-- 왼쪽에서 오른쪽으로
   └─────────────────────────┘

Row(
mainAxisAlignment: MainAxisAlignment.spaceAround, // 주축(가로) 기준 간격을 균등하게 배분
crossAxisAlignment: CrossAxisAlignment.center, // 교차축(세로) 기준 가운데 정렬
children: [
Container(width: 50, height: 50, color: Colors.red),
Container(width: 50, height: 50, color: Colors.green),
Container(width: 50, height: 50, color: Colors.blue),
],
)

구분 Row (가로) Column (세로)

배치 방향 가로 (좌 → 우)　　 세로 (상 → 하)
MainAxisAlignment (주축 정렬) 가로 방향 정렬 세로 방향 정렬
CrossAxisAlignment (교차축 정렬) 세로 방향 정렬 가로 방향 정렬

mainAxisSize.max / min

내부패딩- padding: XXX

Contrainer - 디자인 적용시 용이함.
SizedBox - 빈공간 적용시 용이함.


◆SafeArea

플러터(Flutter)에서 SafeArea는 아이폰의 노치(Notch), 다이나믹 아일랜드, 홈 화면 인디케이터 바, 그리고 안드로이드의 상태바나 내비게이션 바 등 디바이스의 물리적인 UI 요소에 콘텐츠가 가려지지 않도록 안전한 영역 안에서만 화면을 그려주도록 만드는 아주 중요한 위젯입니다.


1. 왜 SafeArea가 필요할까요? (개념 이해)
요즘 스마트폰들은 화면 위쪽(카메라 노치)이나 아래쪽(제스처 바)에 시스템 영역이 차지하는 공간이 있습니다. 만약 SafeArea를 쓰지 않고 일반 레이아웃을 만들면, 앱의 중요한 버튼이나 텍스트가 이 영역에 겹쳐서 안 보이거나 터치가 안 되는 참사가 일어날 수 있습니다.

[SafeArea를 쓰지 않았을 때] (상태바/노치에 글자가 파묻힘)
┌─────────────────────────┐
│ ⚠️ 알림바/노치 영역에 겹침 │  <-- 글자가 잘릴 수 있음
├─────────────────────────┤
│ 본문 내용...             │
└─────────────────────────┘

[SafeArea를 적용했을 때] (안전한 영역 아래로 밀려남)
┌─────────────────────────┐
│ ───────────────         │  <-- 시스템 영역 회피 (빈 공간 처리)
├─────────────────────────┤
│ ✅ 안전한 영역 안의 본문  │  <-- 콘텐츠가 깔끔하게 보임
└─────────────────────────┘


2. 코드 예시
SafeArea를 사용하는 방법은 간단합니다. 가리고 싶지 않은 위젯(예: Text, Container 등)을 SafeArea로 감싸주기만 하면 됩니다.

Dart
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // Scaffold의 body에 SafeArea를 적용
        body: SafeArea(
          // 상하좌우 시스템 영역(노치 등)을 피해서 안전한 곳에 배치됩니다.
          child: Container(
            color: Colors.blueAccent,
            width: double.infinity,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '나는 절대 노치나 홈 바에 가리지 않아요!',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


3. 알아두면 좋은 세부 속성 (옵션)
SafeArea는 기본적으로 상하좌우 모든 방향의 시스템 영역을 피하지만, 특정 방향만 막거나 풀고 싶을 때 아래의 속성들을 조절할 수 있습니다.

top (기본값: true): 상단 상태바/노치 영역을 피할 것인가? (false로 하면 상단까지 화면이 확장됨)

bottom (기본값: true): 하단 홈 인디케이터 영역을 피할 것인가?

left / right (기본값: true): 가로모드일 때 좌우 측면의 노치나 절단면을 피할 것인가?

Dart
SafeArea(
  top: true,    // 위쪽 노치는 피하고
  bottom: false // 아래쪽은 피하지 않고 화면 끝까지 채우겠다!
  child: Text('여유 공간 커스텀'),
)


