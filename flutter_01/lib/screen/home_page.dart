// stl - stateless 위젯, 상태가 없는것
// stf - statefull 위젯, 상태가 있는것
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // return const Placeholder();
    return Scaffold(
      appBar: AppBar(title: const Text('Sample Code')),
      body: Container(
        color: Colors.lightGreenAccent, // child가 있는 경우, 자식 크기에 딱 맞춰서 줄어듦.
        // height: 300,
        width: double.infinity,
        // spacing으로 각 _getBox()에 간격을 줌.
        // mainAxisSize: MainAxisSize.min로 주방향(가로) 자식 엘리먼트 까지 줄어듦.
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: _getColumnBody(),
        ),
      ),
    ); // Scaffold
  }
}

Row _getRowBody() {
  return Row(
    // mainAxisSize: MainAxisSize.min,
    mainAxisSize: MainAxisSize.max,
    // crossAxisAlignment: CrossAxisAlignment.end, or start
    crossAxisAlignment: CrossAxisAlignment.stretch,
    spacing: 10,
    children: [
      _getBox(height: 300),
      _getBox(height: 200),
      // _getBox(width: 300),
      Expanded(child: _getBox()), // Expanded Widget // 가로로 꽉 채우줌.
      // Flexible(flex: 1, fit: FlexFit.tight, child: _getBox()),
      // Expanded Widget // 가로로 꽉 채우줌.
    ],
  );
}

Column _getColumnBody() {
  return Column(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.center,
    // crossAxisAlignment: CrossAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.stretch,
    spacing: 10,
    children: [
      _getBox(width: 300, height: 100),
      // _getBox(width: 200, height: 200),
      const SizedBox(height: 50),
      Expanded(flex: 2, child: _getBox(width: 200, height: 200)),
      Flexible(flex: 1, fit: FlexFit.tight, child: _getBox()),
      // _getBox(), // Expanded Widget // 가로로 꽉 채우줌.
    ],
  );
}

Container _getBox({double height = 50, double width = 50}) {
  // 매개변수로 height에 기본값을 50 받음.
  return Container(width: width, height: height, color: Colors.blueAccent);
}
